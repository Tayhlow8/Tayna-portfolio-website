<template>
  <!-- ── Hero ─────────────────────────────────────────── -->
  <main class="pf-hero">

    <!-- Background: dot grid -->
    <div class="pf-bg-grid" aria-hidden="true"></div>

    <!-- Background: cursor glow (desktop only) -->
    <div class="pf-cursor-glow" aria-hidden="true" ref="cursorGlow"></div>

    <!-- Background: floating design/code tokens (mid desktop only) -->
    <div class="pf-tokens" aria-hidden="true">
      <span class="pf-token pf-token--1">--accent: #F0185A</span>
      <span class="pf-token pf-token--2">font-weight: 700</span>
      <span class="pf-token pf-token--3">display: flex</span>
      <span class="pf-token pf-token--4">@keyframes pf-up</span>
      <span class="pf-token pf-token--5">clamp(1rem, 4vw, 3rem)</span>
    </div>

    <!-- Eyebrow -->
    <div class="pf-eyebrow">
      <span class="pf-dot" aria-hidden="true"></span>
      <span>UX Designer</span>
      <span class="pf-sep" aria-hidden="true">·</span>
      <Transition name="t-soft" mode="out-in">
        <span :key="t.location">{{ t.location }}</span>
      </Transition>
    </div>

    <!-- Nome grande -->
    <div class="pf-name-row">
      <h1 class="pf-name" lang="pt">TAY<em>NÁ</em></h1>
      <Transition name="t-soft" mode="out-in">
        <div class="pf-badge" :key="t.years" :aria-label="`5+ ${t.years}`">
          <b class="pf-badge-n">5+</b>
          <span class="pf-badge-t">{{ t.years }}</span>
        </div>
      </Transition>
    </div>

    <!-- Linha decorativa -->
    <div class="pf-rule" aria-hidden="true"></div>

    <!-- Copy (muda com o idioma) -->
    <Transition name="t-soft" mode="out-in">
      <div class="pf-copy" :key="lang">

        <p class="pf-hl">{{ t.headline }}</p>
        <p class="pf-sub">{{ t.sub }}</p>

        <div class="pf-ctas" role="group" :aria-label="t.cta1 + ' / ' + t.cta2">
          <!-- CTA primário: fill sólido rosa -->
          <PfButton variant="solid" @click="scrollToProjects">
            {{ t.cta1 }} <span class="pf-arr" aria-hidden="true"> →</span>
          </PfButton>

          <!-- CTA secundário: ghost -->
          <PfButton variant="ghost" @click="scrollToAbout">
            {{ t.cta2 }}
          </PfButton>
        </div>

      </div>
    </Transition>

    <!-- Figma mockup: in-flow on mobile, absolute on desktop -->
    <div class="pf-mockup-wrap" aria-hidden="true">
      <FigmaMockup />
    </div>

    <!-- Indicador de scroll -->
    <div class="pf-scroll" aria-hidden="true">
      <span class="pf-scroll-bar"></span>
    </div>

  </main>
</template>

<script setup>
import { computed, ref, onMounted, onUnmounted } from 'vue'
import PfButton from './PfButton.vue'
import FigmaMockup from './FigmaMockup.vue'

// ── Props ───────────────────────────────────────────────────
const props = defineProps({
  theme: { type: String, default: 'dark' },
  lang:  { type: String, default: 'PT'  },
})

// ── Copies ──────────────────────────────────────────────────
const copy = {
  PT: {
    location : 'Global',
    years    : 'anos de UX',
    headline : 'Design que conecta\nnegócio, usuário\ne tecnologia.',
    sub      : 'Transformo complexidade em experiências que as pessoas amam usar — e as empresas querem construir.',
    cta1     : 'Ver projetos',
    cta2     : 'Minha história',
  },
  EN: {
    location : 'Global',
    years    : 'years in UX',
    headline : 'Design that bridges\nbusiness, user,\nand technology.',
    sub      : 'I turn complexity into experiences people love to use — and companies want to build.',
    cta1     : 'See my work',
    cta2     : 'My story',
  },
  ES: {
    location : 'Global',
    years    : 'años en UX',
    headline : 'Diseño que conecta\nnegocio, usuario\ny tecnología.',
    sub      : 'Transformo la complejidad en experiencias que la gente ama — y las empresas quieren construir.',
    cta1     : 'Ver proyectos',
    cta2     : 'Mi historia',
  },
  DE: {
    location : 'Global',
    years    : 'Jahre UX',
    headline : 'Design, das Business,\nNutzer und Technologie\nverbindet.',
    sub      : 'Ich verwandle Komplexität in Erlebnisse, die Menschen lieben — und Unternehmen aufbauen wollen.',
    cta1     : 'Meine Projekte',
    cta2     : 'Meine Geschichte',
  },
}

const t = computed(() => copy[props.lang])

// ── Cursor glow (desktop / fine pointer only) ───────────────
const cursorGlow = ref(null)
let rafId = null

function scrollToProjects () {
  document.getElementById('projetos')?.scrollIntoView({ behavior: 'smooth' })
}

function scrollToAbout () {
  document.getElementById('sobre')?.scrollIntoView({ behavior: 'smooth' })
}

function onMouseMove(e) {
  if (!cursorGlow.value) return
  cancelAnimationFrame(rafId)
  rafId = requestAnimationFrame(() => {
    cursorGlow.value.style.transform =
      `translate(${e.clientX - 250}px, ${e.clientY - 250}px)`
  })
}

onMounted(() => {
  if (window.matchMedia('(pointer: fine)').matches) {
    window.addEventListener('mousemove', onMouseMove, { passive: true })
  }
})

onUnmounted(() => {
  window.removeEventListener('mousemove', onMouseMove)
  cancelAnimationFrame(rafId)
})
</script>

<style scoped>
/* ── Hero ───────────────────────────────────────────────── */
.pf-hero {
  position: relative;
  z-index: 2;
  min-height: 100svh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 6rem 1.5rem 5rem;
}

/* ── Eyebrow ────────────────────────────────────────────── */
.pf-eyebrow {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.6rem;
  font-weight: 500;
  letter-spacing: 0.16em;
  text-transform: uppercase;
  color: var(--fg-muted);
  margin-bottom: 1.25rem;
  animation: pf-up 0.7s var(--ease-expo) both;
  animation-delay: 0.1s;
}

.pf-dot {
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background: var(--accent);
  flex-shrink: 0;
  animation: pf-pulse 2.5s ease-in-out infinite;
}

.pf-sep { color: var(--fg-faint); }

/* ── Linha do nome ──────────────────────────────────────── */
.pf-name-row {
  display: flex;
  align-items: flex-start;
  gap: 0.75rem;
  margin-bottom: 1.5rem;
}

.pf-name {
  font-family: var(--font-display);
  font-weight: 700;
  font-size: clamp(3.75rem, 21vw, 13rem);
  line-height: 0.84;
  letter-spacing: -0.025em;
  color: var(--fg);
  animation: pf-up 0.85s var(--ease-expo) both;
  animation-delay: 0.15s;
}
.pf-name em {
  font-style: italic;
  color: var(--accent);
}

/* Badge "5+ anos" */
.pf-badge {
  display: flex;
  flex-direction: column;
  padding-top: 0.35rem;
  animation: pf-up 0.85s var(--ease-expo) both;
  animation-delay: 0.28s;
}
.pf-badge-n {
  font-family: var(--font-display);
  font-size: 1.1rem;
  font-weight: 700;
  color: var(--accent);
  line-height: 1;
}
.pf-badge-t {
  font-size: 0.5rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--fg-muted);
  white-space: nowrap;
  margin-top: 0.2rem;
}

/* ── Linha divisória ────────────────────────────────────── */
.pf-rule {
  width: 100%;
  height: 1px;
  background: linear-gradient(90deg, rgba(240, 24, 90, 0.55) 0%, transparent 65%);
  margin-bottom: 1.5rem;
  animation: pf-up 0.85s var(--ease-expo) both;
  animation-delay: 0.35s;
}

/* ── Copy ───────────────────────────────────────────────── */
.pf-hl {
  font-family: var(--font-display);
  font-weight: 600;
  font-size: clamp(1.15rem, 4.5vw, 2.3rem);
  line-height: 1.18;
  letter-spacing: -0.01em;
  color: var(--fg);
  white-space: pre-line;
  margin-bottom: 1.1rem;
}

.pf-sub {
  font-size: clamp(1.125rem, 2.2vw, 1.35rem);
  font-weight: 300;
  line-height: 1.85;
  color: var(--fg-muted);
  max-width: 42ch;
  margin-bottom: 2.1rem;
}

/* ── CTAs ───────────────────────────────────────────────── */
.pf-ctas {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.pf-arr {
  display: inline-block;
  transition: transform 0.2s ease;
}

/* ── Indicador de scroll ─────────────────────────────────── */
.pf-scroll {
  position: absolute;
  bottom: 2.25rem;
  left: 1.5rem;
  animation: pf-up 1s ease both;
  animation-delay: 1s;
}
.pf-scroll-bar {
  display: block;
  width: 1px;
  height: 48px;
  background: linear-gradient(to bottom, var(--accent), transparent);
  animation: pf-scroll-pulse 2.2s ease-in-out infinite;
}

/* ── Transição de idioma ─────────────────────────────────── */
.t-soft-enter-active,
.t-soft-leave-active { transition: opacity 0.18s ease, transform 0.18s ease; }
.t-soft-enter-from   { opacity: 0; transform: translateY(6px); }
.t-soft-leave-to     { opacity: 0; transform: translateY(-6px); }

/* ── Responsivo (mobile-first) ───────────────────────────── */
@media (min-width: 640px) {
  .pf-hero   { padding: 7rem 3rem 5rem; }
  .pf-ctas   { flex-direction: row; }
  .pf-scroll { left: 3rem; }
}

@media (min-width: 1024px) {
  .pf-hero   { padding: 9rem 7rem 5rem; }
  .pf-scroll { left: 7rem; }
}

@media (min-width: 1400px) {
  .pf-hero   { padding: 10rem 10rem 5rem; }
  .pf-scroll { left: 10rem; }
}

/* ── Figma mockup wrapper ───────────────────────────────── */

/* Mobile: in-flow, centered below CTAs */
.pf-mockup-wrap {
  display         : flex;
  justify-content : center;
  margin-top      : 2.5rem;
  position        : relative;
  z-index         : 1;
  animation       : pf-up 0.9s var(--ease-expo) both;
  animation-delay : 0.55s;
}

/* Large desktop: absolute right side */
@media (min-width: 1280px) {
  .pf-mockup-wrap {
    position   : absolute;
    top        : 50%;
    right      : 4rem;
    margin-top : 0;
    display    : block;
    transform  : translateY(-50%);
  }
}

@media (min-width: 1400px) {
  .pf-mockup-wrap { right: 7rem; }
}

/* Hide floating tokens when mockup is visible */
@media (min-width: 1280px) {
  .pf-tokens { display: none; }
}

/* ── Dot grid ───────────────────────────────────────────── */
.pf-bg-grid {
  position         : absolute;
  inset            : 0;
  z-index          : 0;
  pointer-events   : none;
  background-image : radial-gradient(circle, rgba(240,24,90,0.18) 1px, transparent 1px);
  background-size  : 28px 28px;
  -webkit-mask-image : radial-gradient(ellipse 90% 85% at 60% 40%, black 20%, transparent 80%);
  mask-image         : radial-gradient(ellipse 90% 85% at 60% 40%, black 20%, transparent 80%);
  opacity          : 0.45;
}

/* ── Cursor glow ────────────────────────────────────────── */
.pf-cursor-glow {
  display        : none;
  position       : fixed;
  top            : 0;
  left           : 0;
  width          : 500px;
  height         : 500px;
  border-radius  : 50%;
  background     : radial-gradient(circle, rgba(240,24,90,0.07) 0%, transparent 65%);
  pointer-events : none;
  z-index        : 0;
  will-change    : transform;
}

@media (pointer: fine) {
  .pf-cursor-glow { display: block; }
}

/* ── Floating tokens ────────────────────────────────────── */
.pf-tokens {
  display : none;
}

@media (min-width: 768px) {
  .pf-tokens {
    display        : block;
    position       : absolute;
    inset          : 0;
    z-index        : 0;
    pointer-events : none;
  }
}

.pf-token {
  position       : absolute;
  font-family    : 'Courier New', Courier, monospace;
  font-size      : 0.52rem;
  font-weight    : 400;
  letter-spacing : 0.05em;
  color          : var(--accent);
  opacity        : 0;
  white-space    : nowrap;
  animation      : pf-token-float 10s ease-in-out infinite;
}

.pf-token--1 { right: 10%;  top: 22%; animation-delay: 0s;    animation-duration: 11s; }
.pf-token--2 { right: 18%;  top: 40%; animation-delay: 1.8s;  animation-duration: 13s; }
.pf-token--3 { right:  6%;  top: 55%; animation-delay: 3.2s;  animation-duration: 10s; }
.pf-token--4 { right: 22%;  top: 68%; animation-delay: 0.9s;  animation-duration: 14s; }
.pf-token--5 { right: 12%;  top: 80%; animation-delay: 2.5s;  animation-duration: 12s; }

@keyframes pf-token-float {
  0%   { opacity: 0;    transform: translateY(10px); }
  15%  { opacity: 0.22; }
  85%  { opacity: 0.22; }
  100% { opacity: 0;    transform: translateY(-18px); }
}

@media (prefers-reduced-motion: reduce) {
  .pf-token        { animation: none; opacity: 0.12; transform: none; }
  .pf-cursor-glow  { display: none; }
  .pf-bg-grid      { opacity: 0.25; }
}
</style>
