<template>
  <!-- ── Hero ─────────────────────────────────────────── -->
  <main class="pf-hero">
    <!-- ── Photo: color layer (underneath) ──────────────
         Always visible — shows through when B&W layer wipes away -->
    <div
      class="pf-photo pf-photo--color"
      :style="photoStyle"
      aria-hidden="true"
    ></div>

    <!-- ── Photo: B&W layer (on top)
         clip-path shrinks right→left on hover, revealing colour beneath -->
    <div
      class="pf-photo pf-photo--bw"
      :style="photoStyle"
      aria-hidden="true"
    ></div>

    <!-- ── Gradient vignettes for text contrast ────────── -->
    <div class="pf-vignette pf-vignette--top" aria-hidden="true"></div>
    <div class="pf-vignette pf-vignette--bottom" aria-hidden="true"></div>
    <div class="pf-vignette pf-vignette--left" aria-hidden="true"></div>

    <!-- ── Name marquee ──────────────────────────────────
         Scrolls right → left, looping infinitely.
         The track is duplicated so the loop is seamless. -->
    <div
      ref="marqueeEl"
      class="pf-marquee"
      aria-label="Tayná Schultz"
      role="heading"
      aria-level="1"
    >
      <div class="pf-marquee__track" aria-hidden="true">
        <span class="pf-marquee__item">Tayná Schultz</span>
        <span class="pf-marquee__sep">✦</span>
        <span class="pf-marquee__item">Tayná Schultz</span>
        <span class="pf-marquee__sep">✦</span>
        <span class="pf-marquee__item">Tayná Schultz</span>
        <span class="pf-marquee__sep">✦</span>
        <span class="pf-marquee__item">Tayná Schultz</span>
        <span class="pf-marquee__sep">✦</span>
      </div>
    </div>

    <!-- ── Role (bottom-right) ───────────────────────────
         Thin weight, language-aware -->
    <Transition name="t-soft" mode="out-in">
      <div class="pf-role" :key="lang" :aria-label="t.roleLabel">
        <span>{{ t.role1 }}</span>
        <span>{{ t.role2 }}</span>
        <span>{{ t.role3 }}</span>
      </div>
    </Transition>

    <!-- ── Scroll indicator (bottom-left) ─────────────── -->
    <div class="pf-scroll" aria-hidden="true">
      <span class="pf-scroll-bar"></span>
    </div>
  </main>
</template>

<script setup>
import { computed, ref, onMounted, onUnmounted } from "vue";

// ── Hero photo ───────────────────────────────────────────
// To swap the photo: replace the file in src/assets/ and update below.
import heroPhoto from "../assets/generated expanded bg.png";

const photoStyle = computed(() => ({
  backgroundImage: `url(${heroPhoto})`,
}));

// ── Props ────────────────────────────────────────────────
const props = defineProps({
  theme: { type: String, default: "light" },
  lang: { type: String, default: "PT" },
});

// ── Role copy per language ───────────────────────────────
const copy = {
  PT: {
    role1: "UX/UI &",
    role2: "Designer",
    role3: "de Produto",
    roleLabel: "Designer UX/UI e de Produto",
  },
  EN: {
    role1: "UX/UI &",
    role2: "Product",
    role3: "Designer",
    roleLabel: "UX/UI & Product Designer",
  },
  ES: {
    role1: "UX/UI &",
    role2: "Diseñadora",
    role3: "de Producto",
    roleLabel: "UX/UI & Diseñadora de Producto",
  },
  DE: {
    role1: "UX/UI &",
    role2: "Produkt",
    role3: "Designerin",
    roleLabel: "UX/UI & Produkt Designerin",
  },
};

const t = computed(() => copy[props.lang] ?? copy.EN);

// ── JS-driven marquee with cursor proximity slowdown ─────
// Drives translation via rAF so speed changes are perfectly smooth.
const marqueeEl  = ref(null)
let   rafId      = null
let   position   = 0       // current px offset
let   speed      = 1.5     // px per frame (current, lerped)
let   targetSpeed = 1.5    // px per frame (desired)

const NORMAL_SPEED = 1.5   // ~32s for a typical track width
const SLOW_SPEED   = 0.15  // nearly stopped when cursor is right on it
const RADIUS       = 320   // px influence radius around marquee center

function tick () {
  const el = marqueeEl.value
  if (!el) return
  const track = el.querySelector('.pf-marquee__track')
  if (!track) { rafId = requestAnimationFrame(tick); return }

  // Smoothly lerp current speed toward target
  speed += (targetSpeed - speed) * 0.04

  const halfWidth = track.scrollWidth / 2
  if (halfWidth <= 0) { rafId = requestAnimationFrame(tick); return }

  position += speed
  if (position >= halfWidth) position -= halfWidth

  track.style.transform = `translateX(-${position}px)`
  rafId = requestAnimationFrame(tick)
}

function onMouseMove (e) {
  if (!marqueeEl.value) return
  const rect    = marqueeEl.value.getBoundingClientRect()
  const centerY = rect.top + rect.height / 2
  const dy      = Math.abs(e.clientY - centerY)
  const ratio   = Math.max(0, 1 - dy / RADIUS)   // 1 = on marquee, 0 = far
  targetSpeed   = NORMAL_SPEED - ratio * (NORMAL_SPEED - SLOW_SPEED)
}

onMounted(() => {
  rafId = requestAnimationFrame(tick)
  window.addEventListener('mousemove', onMouseMove, { passive: true })
})
onUnmounted(() => {
  cancelAnimationFrame(rafId)
  window.removeEventListener('mousemove', onMouseMove)
})
</script>

<style scoped>
/* ════════════════════════════════════════════════════════
   Hero shell
   ════════════════════════════════════════════════════════ */
.pf-hero {
  position: relative;
  width: 100%;
  height: 100svh;
  overflow: hidden;
  background: #0a0a0a; /* fallback while photo loads */
  /* NavBar is position:fixed above — no top padding needed */
}

/* ════════════════════════════════════════════════════════
   Photo layers
   ════════════════════════════════════════════════════════ */
.pf-photo {
  position: absolute;
  inset: 0;
  /* background-image set via :style binding in template (Vite-safe) */
  background-size: cover;
  background-position: center 18%; /* keeps face prominent on most crops */
  background-repeat: no-repeat;
}

/* Colour layer sits underneath — always full colour */
.pf-photo--color {
  z-index: 0;
}

/* B&W layer on top — clip-path animates on hover */
.pf-photo--bw {
  z-index: 1;
  filter: grayscale(1) contrast(1.06) brightness(0.9);

  /*
   * Saturation wipe: right → left
   * inset(top  right  bottom  left)
   * Default  → inset(0 0%   0 0)  = B&W fully visible
   * On hover → inset(0 100% 0 0)  = B&W clipped from right to left,
   *                                  revealing colour underneath
   */
  clip-path: inset(0 0% 0 0);
  transition: clip-path 0.9s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

/* colour reveal on hover removed — cursor proximity controls marquee speed instead */

/* Touch devices: no hover, just show colour photo */
@media (hover: none) {
  .pf-photo--bw {
    display: none;
  }
}

/* ════════════════════════════════════════════════════════
   Vignettes (keep text readable over any photo area)
   ════════════════════════════════════════════════════════ */
.pf-vignette {
  position: absolute;
  z-index: 2;
  pointer-events: none;
}

.pf-vignette--top {
  top: 0;
  left: 0;
  right: 0;
  height: 35%;
  background: linear-gradient(
    to bottom,
    rgba(10, 10, 10, 0.72) 0%,
    transparent 100%
  );
}

.pf-vignette--bottom {
  bottom: 0;
  left: 0;
  right: 0;
  height: 52%;
  background: linear-gradient(
    to top,
    rgba(10, 10, 10, 0.85) 0%,
    rgba(10, 10, 10, 0.3) 55%,
    transparent 100%
  );
}

.pf-vignette--left {
  top: 0;
  left: 0;
  bottom: 0;
  width: 40%;
  background: linear-gradient(
    to right,
    rgba(10, 10, 10, 0.5) 0%,
    transparent 100%
  );
}

/* ════════════════════════════════════════════════════════
   Name marquee
   ════════════════════════════════════════════════════════ */
.pf-marquee {
  position: absolute;
  top: clamp(4rem, 22vh, 14rem);
  left: 0;
  right: 0;
  z-index: 10;
  overflow: hidden;
  pointer-events: none;
  user-select: none;
  /*
   * Blend mode must live HERE — on the element itself — not on children.
   * z-index:10 makes .pf-marquee a stacking context, which isolates
   * any mix-blend-mode on child elements (they blend against nothing).
   * Putting it on .pf-marquee composites the whole rendered layer
   * against the root backdrop, which includes the photo.
   */
  mix-blend-mode: soft-light;
}

.pf-marquee__track {
  display: inline-flex;
  align-items: center;
  white-space: nowrap;
  /* transform driven by JS rAF — no CSS animation needed */
  will-change: transform;
}

.pf-marquee__item {
  font-family: var(--font-display);
  font-weight: 700;
  font-size: clamp(4rem, 12vw, 13rem);
  line-height: 1;
  letter-spacing: -0.03em;
  color: #0d0c1a;
  padding-right: 0.3em;
  flex-shrink: 0;
}

.pf-marquee__sep {
  font-family: var(--font-display);
  font-size: clamp(1.2rem, 3vw, 3rem);
  color: var(--accent);
  padding-right: 0.4em;
  flex-shrink: 0;
}

@keyframes pf-marquee-scroll {
  from {
    transform: translateX(0);
  }
  to {
    transform: translateX(-50%);
  }
}

/* Pause on hover (optional — remove if you want it always running) */
.pf-hero:hover .pf-marquee__track {
  animation-play-state: running; /* keep running even on hover */
}

@media (prefers-reduced-motion: reduce) {
  .pf-marquee__track {
    animation: none;
  }
}

/* ════════════════════════════════════════════════════════
   Role descriptor (bottom-right)
   ════════════════════════════════════════════════════════ */
.pf-role {
  position: absolute;
  bottom: clamp(4rem, 9vh, 7rem);
  left: clamp(1.5rem, 5vw, 4rem);
  right: auto;
  z-index: 10;

  display: flex;
  flex-direction: column;
  align-items: flex-start;
  text-align: left;

  font-family: var(--font-display);
  font-weight: 300;
  font-size: clamp(1.3rem, 3.2vw, 3rem);
  line-height: 1.12;
  letter-spacing: -0.025em;
  color: rgba(240, 239, 248, 0.88);

  animation: pf-up 0.9s var(--ease-expo) both;
  animation-delay: 0.3s;
}

.pf-role span {
  display: block;
  text-align: left;
}

/* ════════════════════════════════════════════════════════
   Scroll indicator
   ════════════════════════════════════════════════════════ */
.pf-scroll {
  position: absolute;
  bottom: 2.25rem;
  left: clamp(1.5rem, 5vw, 4rem);
  z-index: 10;
  animation: pf-up 1s var(--ease-expo) both;
  animation-delay: 0.6s;
}

.pf-scroll-bar {
  display: block;
  width: 1px;
  height: 48px;
  background: linear-gradient(to bottom, var(--accent), transparent);
  animation: pf-scroll-pulse 2.2s ease-in-out infinite;
}

/* ════════════════════════════════════════════════════════
   Language transition
   ════════════════════════════════════════════════════════ */
.t-soft-enter-active,
.t-soft-leave-active {
  transition:
    opacity 0.18s ease,
    transform 0.18s ease;
}
.t-soft-enter-from {
  opacity: 0;
  transform: translateY(6px);
}
.t-soft-leave-to {
  opacity: 0;
  transform: translateY(-6px);
}

/* ════════════════════════════════════════════════════════
   Reduced motion
   ════════════════════════════════════════════════════════ */
@media (prefers-reduced-motion: reduce) {
  .pf-photo--bw {
    transition: none;
  }
  .pf-scroll-bar {
    animation: none;
    opacity: 0.6;
  }
  .pf-marquee,
  .pf-role,
  .pf-scroll {
    animation: none;
  }
}
</style>
