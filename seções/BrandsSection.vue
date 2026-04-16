<template>
  <section :class="['brands-root', `theme-${theme}`]" aria-labelledby="brands-heading">

    <!-- Grain overlay (same as HeroSection) -->
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

      <!-- Linha divisória -->
      <div class="pf-rule" aria-hidden="true"></div>

      <!-- Nichos -->
      <div class="brands-sectors">
        <div
          v-for="sector in sectors"
          :key="sector.id"
          class="brands-sector"
        >
          <!-- Sector label -->
          <div class="sector-label">
            <span class="sector-num">{{ sector.num }}</span>
            <span class="sector-name">{{ t.sectors[sector.id] }}</span>
          </div>

          <!-- Logos grid -->
          <div class="logos-grid">
            <div
              v-for="brand in sector.brands"
              :key="brand.name"
              class="logo-card"
              :title="brand.name"
            >
              <div class="logo-inner" v-html="brand.svg"></div>
              <span class="logo-fallback">{{ brand.name }}</span>
            </div>
          </div>

          <!-- Separator (except last) -->
          <div v-if="sector.id !== 'edu'" class="sector-sep" aria-hidden="true"></div>

        </div>
      </div>

    </div>
  </section>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  theme: { type: String, default: 'light' },
  lang:  { type: String, default: 'PT'   },
})

// ── i18n ────────────────────────────────────────────────────────
const copy = {
  PT: {
    eyebrow: 'Empresas & Setores',
    heading: ['onde meu design', 'gerou resultado'],
    sectors: {
      beauty:  'Beleza',
      finance: 'Financeiro',
      food:    'Alimentício',
      edu:     'Educacional',
    },
  },
  EN: {
    eyebrow: 'Companies & Industries',
    heading: ['where my design', 'drove results'],
    sectors: {
      beauty:  'Beauty',
      finance: 'Finance',
      food:    'Food & Beverage',
      edu:     'Education',
    },
  },
  ES: {
    eyebrow: 'Empresas & Sectores',
    heading: ['donde mi diseño', 'generó resultado'],
    sectors: {
      beauty:  'Belleza',
      finance: 'Financiero',
      food:    'Alimentación',
      edu:     'Educación',
    },
  },
  DE: {
    eyebrow: 'Unternehmen & Branchen',
    heading: ['wo mein Design', 'Ergebnisse lieferte'],
    sectors: {
      beauty:  'Beauty',
      finance: 'Finanzen',
      food:    'Lebensmittel',
      edu:     'Bildung',
    },
  },
}

const t = computed(() => copy[props.lang] ?? copy.PT)

// ── SVG logos (inline, monochrome — colorized via CSS currentColor) ──
const sectors = [
  {
    id: 'beauty',
    num: '01',
    brands: [
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
    ],
  },
  {
    id: 'finance',
    num: '02',
    brands: [
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
    ],
  },
  {
    id: 'food',
    num: '03',
    brands: [
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
        name: 'Lor',
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
    ],
  },
  {
    id: 'edu',
    num: '04',
    brands: [
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
    ],
  },
]
</script>

<style scoped>
/* ── Fontes (idêntico ao HeroSection) ──────────────────── */
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500&display=swap');

/* ── Tokens (copiados do DS) ────────────────────────────── */
:root {
  --accent       : #F0185A;
  --accent-glow  : rgba(240,24,90,.12);
  --accent-soft  : rgba(240,24,90,.4);
  --font-display : 'Clash Display', sans-serif;
  --font-body    : 'DM Sans', sans-serif;
  --ease-expo    : cubic-bezier(.16,1,.3,1);
}

.theme-dark {
  --bg          : #070711;
  --fg          : #F0EFF8;
  --fg-muted    : #6B6A82;
  --fg-faint    : #22213A;
  --border      : rgba(255,255,255,.07);
  --ghost-border: rgba(255,255,255,.11);
  --grain-opacity: .04;
}
.theme-light {
  --bg          : #F5F3FF;
  --fg          : #0D0C1A;
  --fg-muted    : #62607A;
  --fg-faint    : #D2CFEA;
  --border      : rgba(0,0,0,.08);
  --ghost-border: rgba(13,12,26,.12);
  --grain-opacity: .025;
}

/* ── Raiz da seção ──────────────────────────────────────── */
.brands-root {
  background   : var(--bg);
  color        : var(--fg);
  font-family  : var(--font-body);
  position     : relative;
  overflow-x   : hidden;
  transition   : background .5s ease, color .5s ease;
}

/* Grain igual ao Hero */
.pf-grain {
  position         : absolute;
  inset            : 0;
  z-index          : 1;
  pointer-events   : none;
  opacity          : var(--grain-opacity);
  background-image : url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");
  background-size  : 180px 180px;
}

/* ── Layout ─────────────────────────────────────────────── */
.brands-wrap {
  position   : relative;
  z-index    : 2;
  padding    : 5rem 1.5rem 5rem;
  max-width  : 1120px;
  margin     : 0 auto;
}

/* ── Eyebrow (idêntico ao Hero) ─────────────────────────── */
.pf-eyebrow {
  display        : flex;
  align-items    : center;
  gap            : .5rem;
  font-size      : .6rem;
  font-weight    : 500;
  letter-spacing : .16em;
  text-transform : uppercase;
  color          : var(--fg-muted);
  margin-bottom  : 1.5rem;
  animation      : pf-up .7s var(--ease-expo) both;
}

.pf-dot {
  width         : 5px;
  height        : 5px;
  border-radius : 50%;
  background    : var(--accent);
  flex-shrink   : 0;
  animation     : pf-pulse 2.5s ease-in-out infinite;
}

/* ── Heading ─────────────────────────────────────────────── */
.brands-heading {
  font-family    : var(--font-display);
  font-weight    : 600;
  font-size      : clamp(2rem, 8vw, 5rem);
  line-height    : .92;
  letter-spacing : -.025em;
  color          : var(--fg);
  margin-bottom  : 1.75rem;
  animation      : pf-up .85s var(--ease-expo) both;
  animation-delay: .1s;
}
.brands-heading em {
  font-style : italic;
  color      : var(--accent);
}

/* ── Linha divisória (igual ao Hero) ────────────────────── */
.pf-rule {
  width          : 100%;
  height         : 1px;
  background     : linear-gradient(90deg, rgba(240,24,90,.55) 0%, transparent 65%);
  margin-bottom  : 3.5rem;
  animation      : pf-up .85s var(--ease-expo) both;
  animation-delay: .2s;
}

/* ── Sectores ────────────────────────────────────────────── */
.brands-sectors {
  display        : flex;
  flex-direction : column;
  gap            : 0;
}

.brands-sector {
  animation      : pf-up .9s var(--ease-expo) both;
}
.brands-sector:nth-child(1) { animation-delay: .25s; }
.brands-sector:nth-child(2) { animation-delay: .35s; }
.brands-sector:nth-child(3) { animation-delay: .45s; }
.brands-sector:nth-child(4) { animation-delay: .55s; }

/* Separator entre nichos */
.sector-sep {
  width      : 100%;
  height     : 1px;
  background : var(--border);
  margin     : 2.5rem 0;
}

/* ── Label do nicho ──────────────────────────────────────── */
.sector-label {
  display        : flex;
  align-items    : baseline;
  gap            : .75rem;
  margin-bottom  : 1.5rem;
}

.sector-num {
  font-family    : var(--font-display);
  font-size      : .55rem;
  font-weight    : 700;
  color          : var(--accent);
  letter-spacing : .1em;
}

.sector-name {
  font-size      : .58rem;
  font-weight    : 500;
  letter-spacing : .18em;
  text-transform : uppercase;
  color          : var(--fg-muted);
}

/* ── Grid de logos ───────────────────────────────────────── */
.logos-grid {
  display               : grid;
  grid-template-columns : repeat(2, 1fr);
  gap                   : 1px;
  border                : 1px solid var(--border);
}

.logo-card {
  position    : relative;
  display     : flex;
  align-items : center;
  justify-content: center;
  padding     : 1.75rem 1.5rem;
  border-right: 1px solid var(--border);
  border-bottom: 1px solid var(--border);
  cursor      : default;
  transition  : background .25s ease;
  overflow    : hidden;
}

/* Accent glow on hover */
.logo-card::before {
  content         : '';
  position        : absolute;
  inset           : 0;
  background      : var(--accent-glow);
  opacity         : 0;
  transition      : opacity .3s ease;
  pointer-events  : none;
}
.logo-card:hover::before { opacity: 1; }

/* Linha accent na base no hover */
.logo-card::after {
  content    : '';
  position   : absolute;
  bottom     : 0;
  left       : 0;
  right      : 0;
  height     : 1px;
  background : var(--accent);
  transform  : scaleX(0);
  transform-origin: left;
  transition : transform .35s var(--ease-expo);
}
.logo-card:hover::after { transform: scaleX(1); }

/* Logo SVG */
.logo-inner {
  display        : flex;
  align-items    : center;
  justify-content: center;
  width          : 100%;
  max-width      : 140px;
  color          : var(--fg-muted);
  transition     : color .25s ease, transform .25s var(--ease-expo);
}
.logo-inner :deep(svg) {
  width   : 100%;
  height  : auto;
  max-height: 48px;
}
.logo-card:hover .logo-inner {
  color     : var(--fg);
  transform : translateY(-2px);
}

/* Fallback text (visually hidden, for screen readers) */
.logo-fallback {
  position   : absolute;
  width      : 1px;
  height     : 1px;
  overflow   : hidden;
  clip       : rect(0,0,0,0);
  white-space: nowrap;
}

/* ── Responsivo ──────────────────────────────────────────── */
@media (min-width: 480px) {
  .logos-grid { grid-template-columns: repeat(3, 1fr); }
}

@media (min-width: 640px) {
  .brands-wrap { padding: 6rem 3rem; }
  .logos-grid  { grid-template-columns: repeat(3, 1fr); }
}

@media (min-width: 1024px) {
  .brands-wrap { padding: 8rem 7rem; }
  .logos-grid  { grid-template-columns: repeat(5, 1fr); }
}

@media (min-width: 1400px) {
  .brands-wrap { padding: 9rem 10rem; }
}

/* ── Keyframes (reutiliza os do Hero) ────────────────────── */
@keyframes pf-up {
  from { opacity: 0; transform: translateY(24px); filter: blur(8px); }
  to   { opacity: 1; transform: translateY(0);    filter: blur(0); }
}

@keyframes pf-pulse {
  0%, 100% { opacity: 1;   transform: scale(1);    }
  50%       { opacity: .3; transform: scale(.75);  }
}
</style>
