<template>
  <section :class="['brands-root', `theme-${theme}`]" aria-labelledby="brands-heading">

    <div class="pf-grain" aria-hidden="true"></div>

    <div class="brands-wrap">

      <!-- Eyebrow -->
      <div class="pf-eyebrow">
        <span class="pf-dot" aria-hidden="true"></span>
        <span>{{ t.eyebrow }}</span>
      </div>

      <!-- Heading -->
      <h2 id="brands-heading" class="brands-heading">
        {{ t.heading[0] }}<br/>
        <em>{{ t.heading[1] }}</em>
      </h2>

      <!-- Rule -->
      <div class="pf-rule" aria-hidden="true"></div>

    </div>

    <!-- ── Marquee (full-width, outside the padded wrap) ── -->
    <div class="br-marquee" role="list" aria-label="Marcas">

      <!-- Edge fades -->
      <div class="br-fade br-fade--left"  aria-hidden="true"></div>
      <div class="br-fade br-fade--right" aria-hidden="true"></div>

      <!-- Track duplicated 3× so the loop is seamless at any speed -->
      <div class="br-track" :class="{ 'br-track--paused': paused }" aria-hidden="true">
        <template v-for="_ in 3" :key="_">
          <div
            v-for="brand in allBrands"
            :key="`${_}-${brand.name}`"
            class="br-item"
            role="listitem"
          >
            <div class="br-logo" v-html="brand.svg"></div>
            <span class="br-sep" aria-hidden="true">·</span>
          </div>
        </template>
      </div>
    </div>

    <!-- Accessible brand list (screen readers only) -->
    <ul class="sr-only">
      <li v-for="brand in allBrands" :key="brand.name">{{ brand.name }}</li>
    </ul>

  </section>
</template>

<script setup>
import { computed, ref } from 'vue'

const props = defineProps({
  theme: { type: String, default: 'light' },
  lang:  { type: String, default: 'PT'   },
})

const paused = ref(false)

// ── i18n ────────────────────────────────────────────────────────
const copy = {
  PT: { eyebrow: 'Empresas & Setores',    heading: ['onde meu design', 'gerou resultado'] },
  EN: { eyebrow: 'Companies & Industries', heading: ['where my design', 'drove results']  },
  ES: { eyebrow: 'Empresas & Sectores',   heading: ['donde mi diseño', 'generó resultado'] },
  DE: { eyebrow: 'Unternehmen & Branchen', heading: ['wo mein Design', 'Ergebnisse lieferte'] },
}
const t = computed(() => copy[props.lang] ?? copy.PT)

// ── All brands flat list ─────────────────────────────────────────
const allBrands = [
  // — Beauty —
  {
    name: "L'Oréal Group",
    svg: `<svg viewBox="0 0 120 32" fill="none" xmlns="http://www.w3.org/2000/svg">
      <text x="2" y="23" font-family="serif" font-size="15" font-weight="700" fill="currentColor" letter-spacing="-0.5">L'ORÉAL</text>
      <text x="2" y="31" font-family="sans-serif" font-size="5.5" fill="currentColor" letter-spacing="3.2">GROUPE</text>
    </svg>`,
  },
  {
    name: 'Prada',
    svg: `<svg viewBox="0 0 100 30" fill="none" xmlns="http://www.w3.org/2000/svg">
      <text x="2" y="22" font-family="serif" font-size="20" font-weight="400" fill="currentColor" letter-spacing="4">PRADA</text>
    </svg>`,
  },
  {
    name: 'Lancôme',
    svg: `<svg viewBox="0 0 120 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <text x="2" y="18" font-family="serif" font-size="14" font-weight="300" fill="currentColor" letter-spacing="3.5">LANCÔME</text>
      <line x1="2" y1="22" x2="118" y2="22" stroke="currentColor" stroke-width="0.6" opacity="0.5"/>
      <text x="2" y="32" font-family="serif" font-size="7" fill="currentColor" letter-spacing="2.5" font-style="italic">Paris</text>
    </svg>`,
  },
  {
    name: 'Yves Saint Laurent',
    svg: `<svg viewBox="0 0 60 60" fill="none" xmlns="http://www.w3.org/2000/svg">
      <text x="4" y="20" font-family="serif" font-size="22" font-weight="700" fill="currentColor">YSL</text>
      <line x1="4" y1="25" x2="56" y2="25" stroke="currentColor" stroke-width="0.7"/>
      <text x="4" y="36" font-family="sans-serif" font-size="4.5" fill="currentColor" letter-spacing="1.2">SAINT LAURENT</text>
      <text x="4" y="44" font-family="sans-serif" font-size="4.5" fill="currentColor" letter-spacing="1.2">PARIS</text>
    </svg>`,
  },
  {
    name: 'SkinCeuticals',
    svg: `<svg viewBox="0 0 130 30" fill="none" xmlns="http://www.w3.org/2000/svg">
      <text x="2" y="20" font-family="sans-serif" font-size="13" font-weight="300" fill="currentColor" letter-spacing="2">SKINCEUTICALS</text>
    </svg>`,
  },
  // — Finance —
  {
    name: 'Rodobens',
    svg: `<svg viewBox="0 0 120 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <rect x="2" y="6" width="22" height="22" rx="2" fill="currentColor" opacity="0.12"/>
      <text x="4" y="21" font-family="sans-serif" font-size="10" font-weight="700" fill="currentColor">RB</text>
      <text x="30" y="17" font-family="sans-serif" font-size="10" font-weight="600" fill="currentColor" letter-spacing="1">RODOBENS</text>
      <text x="30" y="28" font-family="sans-serif" font-size="5" fill="currentColor" opacity="0.5" letter-spacing="1.5">GRUPO</text>
    </svg>`,
  },
  {
    name: 'Banco Mercantil',
    svg: `<svg viewBox="0 0 140 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="18" cy="18" r="13" stroke="currentColor" stroke-width="1.2" fill="none"/>
      <text x="12" y="22" font-family="sans-serif" font-size="10" font-weight="700" fill="currentColor">M</text>
      <text x="36" y="15" font-family="sans-serif" font-size="8" font-weight="600" fill="currentColor" letter-spacing="0.5">BANCO</text>
      <text x="36" y="26" font-family="sans-serif" font-size="8" font-weight="300" fill="currentColor" letter-spacing="0.5">MERCANTIL</text>
    </svg>`,
  },
  // — Food & Beverage —
  {
    name: 'Aurora',
    svg: `<svg viewBox="0 0 100 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M10 26 L20 8 L30 26" stroke="currentColor" stroke-width="1.5" fill="none" stroke-linejoin="round"/>
      <text x="36" y="23" font-family="sans-serif" font-size="14" font-weight="700" fill="currentColor" letter-spacing="1">AURORA</text>
    </svg>`,
  },
  {
    name: 'Mercafé',
    svg: `<svg viewBox="0 0 110 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <text x="2" y="22" font-family="serif" font-size="16" font-weight="700" fill="currentColor" letter-spacing="1">Mercafé</text>
    </svg>`,
  },
  {
    name: "L'or",
    svg: `<svg viewBox="0 0 70 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <text x="2" y="26" font-family="serif" font-size="26" font-weight="700" fill="currentColor" letter-spacing="2" font-style="italic">L'or</text>
    </svg>`,
  },
  {
    name: 'Pilão',
    svg: `<svg viewBox="0 0 90 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <text x="2" y="24" font-family="sans-serif" font-size="20" font-weight="700" fill="currentColor" letter-spacing="1.5">PILÃO</text>
    </svg>`,
  },
  {
    name: 'Grupo SEB',
    svg: `<svg viewBox="0 0 100 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <rect x="2" y="8" width="20" height="20" fill="currentColor" opacity="0.1"/>
      <text x="4" y="23" font-family="sans-serif" font-size="11" font-weight="800" fill="currentColor">SEB</text>
      <text x="28" y="17" font-family="sans-serif" font-size="8" fill="currentColor" letter-spacing="1">GRUPO</text>
      <text x="28" y="27" font-family="sans-serif" font-size="5" fill="currentColor" opacity="0.5" letter-spacing="1.5">BRASIL</text>
    </svg>`,
  },
  // — Education —
  {
    name: 'Master Globo',
    svg: `<svg viewBox="0 0 120 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="16" cy="18" r="10" stroke="currentColor" stroke-width="1.2" fill="none"/>
      <ellipse cx="16" cy="18" rx="5" ry="10" stroke="currentColor" stroke-width="0.8" fill="none"/>
      <line x1="6" y1="18" x2="26" y2="18" stroke="currentColor" stroke-width="0.8"/>
      <text x="32" y="15" font-family="sans-serif" font-size="8" font-weight="600" fill="currentColor" letter-spacing="0.5">MASTER</text>
      <text x="32" y="26" font-family="sans-serif" font-size="8" font-weight="300" fill="currentColor" letter-spacing="0.5">GLOBO</text>
    </svg>`,
  },
  {
    name: 'Fundação Estudar',
    svg: `<svg viewBox="0 0 140 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <polygon points="16,6 28,26 4,26" stroke="currentColor" stroke-width="1.2" fill="none"/>
      <text x="36" y="16" font-family="sans-serif" font-size="7.5" font-weight="600" fill="currentColor" letter-spacing="0.5">FUNDAÇÃO</text>
      <text x="36" y="27" font-family="sans-serif" font-size="7.5" font-weight="300" fill="currentColor" letter-spacing="0.5">ESTUDAR</text>
    </svg>`,
  },
  {
    name: 'Unoeste',
    svg: `<svg viewBox="0 0 100 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <text x="2" y="23" font-family="sans-serif" font-size="16" font-weight="800" fill="currentColor" letter-spacing="0.5">UNOESTE</text>
    </svg>`,
  },
  {
    name: 'PUC-Campinas',
    svg: `<svg viewBox="0 0 120 36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <text x="2" y="20" font-family="serif" font-size="15" font-weight="700" fill="currentColor" letter-spacing="1">PUC</text>
      <line x1="2" y1="23" x2="50" y2="23" stroke="currentColor" stroke-width="0.6" opacity="0.4"/>
      <text x="2" y="32" font-family="sans-serif" font-size="5.5" fill="currentColor" letter-spacing="2" opacity="0.7">CAMPINAS</text>
    </svg>`,
  },
]
</script>

<style scoped>
/* ── Tokens ─────────────────────────────────────────────────────── */
.theme-dark {
  --bg          : #070711;
  --fg          : #F0EFF8;
  --fg-muted    : #777691;
  --border      : rgba(255,255,255,.07);
  --grain-opacity: .04;
  --fade-color  : #070711;
}
.theme-light {
  --bg          : #F5F3FF;
  --fg          : #0D0C1A;
  --fg-muted    : #62607A;
  --border      : rgba(0,0,0,.08);
  --grain-opacity: .025;
  --fade-color  : #F5F3FF;
}

/* ── Root ────────────────────────────────────────────────────────── */
.brands-root {
  background : var(--bg);
  color      : var(--fg);
  font-family: var(--font-body, 'DM Sans', sans-serif);
  position   : relative;
  overflow   : hidden;
  transition : background .5s ease, color .5s ease;
  padding-bottom: clamp(3rem, 6vh, 5rem);
}

/* Grain */
.pf-grain {
  position        : absolute;
  inset           : 0;
  z-index         : 1;
  pointer-events  : none;
  opacity         : var(--grain-opacity);
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");
  background-size : 180px 180px;
}

/* ── Header block ────────────────────────────────────────────────── */
.brands-wrap {
  position: relative;
  z-index : 2;
  padding : clamp(3.5rem, 8vh, 5.5rem) clamp(1.5rem, 7vw, 6rem) 2.5rem;
}

.pf-eyebrow {
  display       : flex;
  align-items   : center;
  gap           : .5rem;
  font-size     : .6rem;
  font-weight   : 500;
  letter-spacing: .16em;
  text-transform: uppercase;
  color         : var(--fg-muted);
  margin-bottom : 1.25rem;
}
.pf-dot {
  width        : 5px;
  height       : 5px;
  border-radius: 50%;
  background   : #DB1552;
  flex-shrink  : 0;
  animation    : pf-pulse 2.5s ease-in-out infinite;
}

.brands-heading {
  font-family   : var(--font-display, 'Clash Display', sans-serif);
  font-weight   : 600;
  font-size     : clamp(2rem, 8vw, 5rem);
  line-height   : .92;
  letter-spacing: -.025em;
  color         : var(--fg);
  margin-bottom : 1.75rem;
}
.brands-heading em { font-style: italic; color: #DB1552; }

.pf-rule {
  width     : 100%;
  height    : 1px;
  background: linear-gradient(90deg, rgba(219,21,82,.55) 0%, transparent 65%);
}

/* ── Marquee ─────────────────────────────────────────────────────── */
.br-marquee {
  position  : relative;
  overflow  : hidden;
  width     : 100%;
  padding   : clamp(2rem, 4vh, 3rem) 0;
  z-index   : 2;
}

/* Left / right gradient fade edges */
.br-fade {
  position: absolute;
  top     : 0;
  bottom  : 0;
  width   : clamp(4rem, 10vw, 8rem);
  z-index : 3;
  pointer-events: none;
}
.br-fade--left  {
  left      : 0;
  background: linear-gradient(to right, var(--fade-color), transparent);
}
.br-fade--right {
  right     : 0;
  background: linear-gradient(to left, var(--fade-color), transparent);
}

/* Scrolling track */
.br-track {
  display   : flex;
  align-items: center;
  width     : max-content;
  animation : marquee 28s linear infinite;
  gap       : 0;
  will-change: transform;
}
.br-track--paused { animation-play-state: paused; }

/* One brand item */
.br-item {
  display    : flex;
  align-items: center;
  gap        : clamp(2rem, 4vw, 3.5rem);
  padding    : 0 clamp(2rem, 4vw, 3.5rem);
  flex-shrink: 0;
}

/* Logo SVG */
.br-logo {
  color      : var(--fg-muted);
  display    : flex;
  align-items: center;
  opacity    : .55;
  transition : opacity .25s ease, color .25s ease;
  flex-shrink: 0;
}
.br-logo :deep(svg) {
  height    : 36px;
  width     : auto;
  max-width : 160px;
  display   : block;
}
.br-item:hover .br-logo {
  opacity: 1;
  color  : var(--fg);
}

/* Separator dot */
.br-sep {
  font-size  : .7rem;
  color      : #DB1552;
  opacity    : .4;
  flex-shrink: 0;
  user-select: none;
}

/* ── Screen-reader list ──────────────────────────────────────────── */
.sr-only {
  position : absolute;
  width    : 1px;
  height   : 1px;
  overflow : hidden;
  clip     : rect(0,0,0,0);
  white-space: nowrap;
}

/* ── Keyframes ───────────────────────────────────────────────────── */
/* Track is 3× the brand list; scroll by 1/3 = one full set */
@keyframes marquee {
  from { transform: translateX(0); }
  to   { transform: translateX(-33.333%); }
}

@keyframes pf-pulse {
  0%, 100% { opacity: 1;   transform: scale(1);   }
  50%       { opacity: .3; transform: scale(.75); }
}

/* ── Reduced motion ──────────────────────────────────────────────── */
@media (prefers-reduced-motion: reduce) {
  .br-track { animation: none; }
}
</style>
