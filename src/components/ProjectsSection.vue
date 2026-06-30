<template>
  <div
    :class="['pc-section', `theme-${theme}`]"
    ref="sectionEl"
    @mousemove="onMouseMove"
    @mouseenter="onSectionEnter"
    @mouseleave="onSectionLeave"
  >

    <!-- ── Custom cursor ball (teleported to body so it's never clipped) ── -->
    <Teleport to="body">
      <div
        class="pc-cursor"
        :class="{ 'pc-cursor--show': cursorVisible }"
        :style="{ '--cx': `${cursorX}px`, '--cy': `${cursorY}px` }"
        aria-hidden="true"
      >{{ t.viewProject }}</div>
    </Teleport>

    <!-- ── Sticky header ── -->
    <div class="pc-header" ref="headerEl">
      <div class="pc-eyebrow">
        <span class="pc-eyebrow__dot" aria-hidden="true"></span>
        <span>{{ t.eyebrow }}</span>
      </div>
      <div class="pc-header-row">
        <h2 class="pc-heading">
          {{ t.heading[0] }}<br/>
          <em>{{ t.heading[1] }}</em>
        </h2>
        <router-link to="/projetos" class="pc-all-link">
          {{ t.allProjects }} <span aria-hidden="true">→</span>
        </router-link>
      </div>
    </div>

    <!-- ── Stack ── -->
    <div class="pc-stack" ref="stackEl" :style="{ '--count': projects.length }">
      <div
        v-for="(project, i) in projects"
        :key="project.slug"
        class="pc-item"
        :ref="el => setItemRef(el, i)"
        :style="{
          '--i'       : i,
          zIndex      : i + 1,
          '--card-top': `${cardTop}px`,
          '--card-h'  : `${cardH}px`,
        }"
      >
        <router-link
          :to="`/projetos/${project.slug}`"
          class="pc-card"
          :aria-label="project.client"
        >
          <!-- Left: image -->
          <div class="pc-img-wrap">
            <img
              v-if="project.image"
              :src="project.image"
              class="pc-img"
              loading="lazy"
              alt=""
            />
            <div v-else class="pc-img-svg" v-html="project.visual"></div>
          </div>

          <!-- Right: text -->
          <div class="pc-body">
            <span class="pc-year">({{ project.year }})</span>
            <h3 class="pc-client">{{ project.client }}</h3>
            <p class="pc-desc">{{ project.desc }}</p>
            <div class="pc-footer">
              <span class="pc-category">{{ project.category }}</span>
              <div class="pc-tags">
                <span v-for="tag in project.tags.slice(0, 2)" :key="tag" class="pc-tag">{{ tag }}</span>
              </div>
            </div>
          </div>
        </router-link>
      </div>
    </div>

  </div>
</template>

<script setup>
import { computed, ref, onMounted, onUnmounted } from 'vue'
import rodobensCover  from '../../imagens cases/rodobens/case rodobens cover 1.png'
import iterationCover from '../assets/iteration/Iteration thumb.png'
import masterCover    from '../../imagens cases/master globo/master globo avatars.avif'
import lancomeCover   from '../../imagens cases/Lancme brazil/case desktp.avif'
import nv8Cover       from '../../clientes/nv8 case cover.png'

const props = defineProps({
  theme: { type: String, default: 'light' },
  lang:  { type: String, default: 'PT'  },
})

// ── i18n ─────────────────────────────────────────────────────────
const copy = {
  PT: {
    eyebrow    : 'Projetos Selecionados',
    heading    : ['cases que', 'falam por si'],
    allProjects: 'Ver todos',
    viewProject: 'Ver',
    cats       : { product: 'Product Design', ux: 'UX Design', brand: 'Brand Experience' },
  },
  EN: {
    eyebrow    : 'Selected Projects',
    heading    : ['cases that', 'speak for themselves'],
    allProjects: 'View all',
    viewProject: 'View',
    cats       : { product: 'Product Design', ux: 'UX Design', brand: 'Brand Experience' },
  },
  ES: {
    eyebrow    : 'Proyectos Seleccionados',
    heading    : ['casos que', 'hablan por sí solos'],
    allProjects: 'Ver todos',
    viewProject: 'Ver',
    cats       : { product: 'Product Design', ux: 'UX Design', brand: 'Brand Experience' },
  },
  DE: {
    eyebrow    : 'Ausgewählte Projekte',
    heading    : ['cases, die', 'für sich sprechen'],
    allProjects: 'Alle ansehen',
    viewProject: 'Ansehen',
    cats       : { product: 'Product Design', ux: 'UX Design', brand: 'Brand Experience' },
  },
}
const t = computed(() => copy[props.lang] ?? copy.EN)

// ── SVG fallbacks ─────────────────────────────────────────────────
const svgRodobens = `<svg viewBox="0 0 480 300" fill="none" xmlns="http://www.w3.org/2000/svg"><rect x="30" y="30" width="420" height="240" rx="8" fill="rgba(255,255,255,.04)" stroke="rgba(255,255,255,.08)"/><rect x="50" y="50" width="160" height="10" rx="2" fill="rgba(255,255,255,.1)"/><rect x="50" y="128" width="80" height="80" rx="4" fill="rgba(219,21,82,.12)" stroke="rgba(219,21,82,.25)"/><text x="90" y="173" font-family="sans-serif" font-size="16" font-weight="700" fill="rgba(219,21,82,.8)" text-anchor="middle">R$</text></svg>`
const svgNV8      = `<svg viewBox="0 0 480 300" fill="none" xmlns="http://www.w3.org/2000/svg"><rect x="30" y="30" width="420" height="240" rx="8" fill="rgba(255,255,255,.03)" stroke="rgba(255,255,255,.06)"/><text x="240" y="165" font-family="monospace" font-size="52" font-weight="700" fill="rgba(12,191,253,.25)" text-anchor="middle">NV8</text></svg>`

// ── Projects ──────────────────────────────────────────────────────
const projects = computed(() => {
  const l = props.lang
  const c = t.value.cats
  return [
    {
      slug: 'rodobens', client: 'Rodobens', year: '2026', category: c.product,
      desc: ({ PT: 'Modernização de um ERP legado para um dos maiores conglomerados financeiros do Brasil — reconstruindo 75 anos de fluxo de crédito em uma plataforma escalável.', EN: "Modernization of a legacy ERP for one of Brazil's largest financial conglomerates — rebuilding 75 years of credit workflow into a scalable platform.", ES: 'Modernización de un ERP heredado para uno de los mayores conglomerados financieros de Brasil.', DE: 'Modernisierung eines Legacy-ERP für eines der größten Finanzkonglomerate Brasiliens.' })[l] || '',
      tags: ['Product Design', 'Design System'], image: rodobensCover, visual: svgRodobens,
    },
    {
      slug: 'rodobens-iteration', client: 'Rodobens · Iteration', year: '2024', category: c.product,
      desc: ({ PT: 'Como espelhar intencionalmente um sistema legado quebrado desbloqueou decisões de design que não chegaríamos de outra forma.', EN: 'How intentionally mirroring a broken legacy system unlocked design decisions we could not have reached any other way.', ES: 'Cómo reflejar intencionalmente un sistema legacy roto desbloqueó las decisiones de diseño.', DE: 'Wie das bewusste Spiegeln eines defekten Legacy-Systems Designentscheidungen ermöglichte.' })[l] || '',
      tags: ['Process Design', 'Systems Thinking'], image: iterationCover, visual: svgRodobens,
    },
    {
      slug: 'master-globo', client: 'Master Globo', year: '2025', category: c.ux,
      desc: ({ PT: 'Pesquisa quantitativa e qualitativa usando a base de dados da plataforma educacional para o lançamento de um novo formato de produto.', EN: "Quantitative and qualitative research using the educational platform's database for the launch of a new product format.", ES: 'Investigación cuantitativa y cualitativa usando la base de datos de la plataforma educativa.', DE: 'Quantitative und qualitative Forschung mit der Datenbank der Bildungsplattform.' })[l] || '',
      tags: ['UX Research', 'Media & Broadcast'], image: masterCover, visual: svgRodobens,
    },
    {
      slug: 'lancome-brazil', client: 'Lancôme Brazil', year: '2023', category: c.brand,
      desc: ({ PT: 'Exposição sensorial imersiva e exclusiva em São Paulo celebrando a história da Lancôme por meio de perfume, joias, moda, som e alta gastronomia.', EN: 'An immersive, invitation-only sensorial exhibition in São Paulo celebrating the history of Lancôme through perfume, jewelry, fashion, sound, and haute cuisine.', ES: 'Una exposición sensorial inmersiva y exclusiva en São Paulo que celebra la historia de Lancôme.', DE: 'Eine immersive, exklusive Sinnesausstellung in São Paulo zur Geschichte von Lancôme.' })[l] || '',
      tags: ['Beauty', 'Brand Experience'], image: lancomeCover, visual: svgRodobens,
    },
    {
      slug: 'nv8', client: 'NV8', year: '2025', category: c.ux,
      desc: ({ PT: 'Construindo a presença digital de uma software house brasileira do zero — sombria, cinematográfica, maximalista.', EN: 'Building the digital presence of a Brazilian software house from the ground up — dark, cinematic, maximalist.', ES: 'Construyendo la presencia digital de una software house brasileña desde cero.', DE: 'Aufbau der digitalen Präsenz eines brasilianischen Software-Hauses von Grund auf.' })[l] || '',
      tags: ['Web Design', 'Design System'], image: nv8Cover, visual: svgNV8,
    },
  ]
})

// ── Layout measurements ───────────────────────────────────────────
const headerEl = ref(null)
const sectionEl = ref(null)
const stackEl  = ref(null)
const itemEls  = ref([])
const cardTop  = ref(260)   // 56px navbar + ~200px header
const cardH    = ref(600)   // actual card height = window.innerHeight - cardTop - gap

function setItemRef (el, i) { itemEls.value[i] = el }

let ro = null
function measureHeader () {
  if (headerEl.value) {
    cardTop.value = headerEl.value.offsetHeight + 56
    cardH.value   = window.innerHeight - cardTop.value - 16
  }
}

// ── Card-stacking scroll animation ───────────────────────────────
// CSS sticky handles the "cards pile up" mechanic.
// This JS layer adds the scale-back on buried cards so they visibly
// recede as newer cards land on top — matching the reference exactly.
function onScroll () {
  if (!stackEl.value) return

  const stackRect   = stackEl.value.getBoundingClientRect()
  const scrolled    = -stackRect.top                    // px scrolled into the stack
  const h           = cardH.value                      // height of one card
  const n           = projects.value.length

  for (let i = 0; i < n; i++) {
    const el = itemEls.value[i]
    if (!el) continue

    // How far past card i's "entry" we've scrolled (0 → next card just arriving, 1 → fully on top)
    const cardPassed  = Math.max(0, scrolled - i * h) / h
    const cardsOnTop  = Math.max(0, cardPassed)          // continuous 0-N

    // Scale each card down as more cards pile on it
    const scale  = Math.max(0.86, 1 - cardsOnTop * 0.035)
    const nudgeY = -(cardsOnTop * 12)

    // Apply to the inner card element so sticky position isn't disturbed
    const card = el.querySelector('.pc-card')
    if (card) {
      card.style.transform       = `scale(${scale}) translateY(${nudgeY}px)`
      card.style.transformOrigin = 'top center'
    }
  }
}

// ── Custom cursor ─────────────────────────────────────────────────
const cursorX       = ref(0)
const cursorY       = ref(0)
const cursorVisible = ref(false)

function onMouseMove  (e) { cursorX.value = e.clientX; cursorY.value = e.clientY }
function onSectionEnter () { cursorVisible.value = true  }
function onSectionLeave () { cursorVisible.value = false }

// ── Lifecycle ─────────────────────────────────────────────────────
onMounted(() => {
  measureHeader()
  ro = new ResizeObserver(measureHeader)
  if (headerEl.value) ro.observe(headerEl.value)

  window.addEventListener('resize', measureHeader, { passive: true })
  window.addEventListener('scroll', onScroll,      { passive: true })
  onScroll()
})
onUnmounted(() => {
  ro?.disconnect()
  window.removeEventListener('resize', measureHeader)
  window.removeEventListener('scroll', onScroll)
})
</script>

<style scoped>
/* ════════════════════════════════════════════════
   Theme tokens
   ════════════════════════════════════════════════ */
.theme-light {
  --s-bg      : #F0EEF8;
  --card-bg   : #FFFFFF;
  --card-fg   : #0D0C1A;
  --card-muted: #62607A;
  --card-bdr  : rgba(0,0,0,.07);
}
.theme-dark {
  --s-bg      : #07070F;
  --card-bg   : #0E0D1C;
  --card-fg   : #F0EFF8;
  --card-muted: #6B6986;
  --card-bdr  : rgba(255,255,255,.06);
}

/* ════════════════════════════════════════════════
   Section — hide default cursor when inside
   ════════════════════════════════════════════════ */
.pc-section {
  position   : relative;
  background : var(--s-bg);
  font-family: var(--font-body, 'DM Sans', sans-serif);
  color      : var(--card-fg);
  cursor     : none;          /* replaced by the ball */
}

/* ════════════════════════════════════════════════
   Custom cursor ball
   ════════════════════════════════════════════════ */
.pc-cursor {
  position       : fixed;
  top            : 0;
  left           : 0;
  width          : 88px;
  height         : 88px;
  border-radius  : 50%;
  background     : #DB1552;
  color          : #fff;
  font-family    : var(--font-body, 'DM Sans', sans-serif);
  font-size      : .52rem;
  font-weight    : 600;
  letter-spacing : .14em;
  text-transform : uppercase;
  display        : flex;
  align-items    : center;
  justify-content: center;
  pointer-events : none;
  z-index        : 9000;
  /* translate so the center of the ball is at the cursor */
  translate      : calc(var(--cx) - 44px) calc(var(--cy) - 44px);
  scale          : 0;
  opacity        : 0;
  transition     : scale .35s cubic-bezier(.34,1.56,.64,1),
                   opacity .2s ease;
  /* translate uses no transition so it tracks the cursor instantly */
  will-change    : translate, scale;
}
.pc-cursor--show {
  scale  : 1;
  opacity: 1;
}

/* ════════════════════════════════════════════════
   Header — sticky, floats above the stacked cards
   ════════════════════════════════════════════════ */
.pc-header {
  position  : sticky;
  top       : 56px;
  z-index   : 50;
  background: var(--s-bg);
  padding   : clamp(2.5rem, 6vh, 4rem) clamp(1.5rem, 7vw, 6rem) clamp(1.25rem, 3vh, 2rem);
}

.pc-eyebrow {
  display       : flex;
  align-items   : center;
  gap           : .5rem;
  font-size     : .58rem;
  font-weight   : 500;
  letter-spacing: .18em;
  text-transform: uppercase;
  color         : var(--card-muted);
  margin-bottom : 1rem;
}
.pc-eyebrow__dot {
  width        : 5px;
  height       : 5px;
  border-radius: 50%;
  background   : #DB1552;
  flex-shrink  : 0;
}

.pc-header-row {
  display        : flex;
  align-items    : flex-end;
  justify-content: space-between;
  gap            : 2rem;
}

.pc-heading {
  font-family   : var(--font-display, 'Clash Display', sans-serif);
  font-weight   : 700;
  font-size     : clamp(2rem, 6vw, 4rem);
  line-height   : .94;
  letter-spacing: -.03em;
  margin        : 0;
}
.pc-heading em { font-style: italic; color: #DB1552; }

.pc-all-link {
  font-size     : .55rem;
  font-weight   : 500;
  letter-spacing: .16em;
  text-transform: uppercase;
  color         : var(--card-muted);
  text-decoration: none;
  white-space   : nowrap;
  flex-shrink   : 0;
  padding-bottom: .2rem;
  border-bottom : 1px solid var(--card-bdr);
  transition    : color .2s, border-color .2s;
  cursor        : none;
}
.pc-all-link:hover { color: #DB1552; border-color: #DB1552; }

/* ════════════════════════════════════════════════
   Stack  — height = n × 100vh gives each card
   100vh of scroll budget
   ════════════════════════════════════════════════ */
.pc-stack {
  height  : calc(var(--count, 5) * 100vh);
  position: relative;
}

/* ════════════════════════════════════════════════
   Pin layer
   Each card sticks just below the header and
   fills the remaining viewport height.
   Higher z-index = later card lands on top.
   ════════════════════════════════════════════════ */
.pc-item {
  position  : sticky;
  top       : var(--card-top, 260px);
  height    : var(--card-h, 600px);
  padding   : 0 1.25rem;
  display   : flex;
  box-sizing: border-box;
}

/* ════════════════════════════════════════════════
   Card
   ════════════════════════════════════════════════ */
.pc-card {
  display        : grid;
  grid-template-columns: 62% 38%;
  width          : 100%;
  height         : 100%;
  border-radius  : 14px;
  overflow       : hidden;
  background     : var(--card-bg);
  border         : 1px solid var(--card-bdr);
  text-decoration: none;
  color          : var(--card-fg);
  box-shadow     : 0 4px 40px rgba(0,0,0,.10), 0 1px 6px rgba(0,0,0,.06);
  /* transform is driven by JS (scale-back for buried cards) */
  transform-origin: top center;
  transition     : box-shadow .3s ease;
  cursor         : none;
}
.pc-card:hover { box-shadow: 0 10px 64px rgba(0,0,0,.16); }

/* ════════════════════════════════════════════════
   Left — image
   ════════════════════════════════════════════════ */
.pc-img-wrap {
  position: relative;
  overflow: hidden;
}
.pc-img {
  width     : 100%;
  height    : 100%;
  object-fit: cover;
  display   : block;
  transition: transform .65s cubic-bezier(.16,1,.3,1);
}
.pc-card:hover .pc-img { transform: scale(1.04); }

.pc-img-svg {
  width          : 100%;
  height         : 100%;
  display        : flex;
  align-items    : center;
  justify-content: center;
  background     : #0D0C1A;
  padding        : 2rem;
}
.pc-img-svg :deep(svg) { width: 100%; height: auto; }

/* ════════════════════════════════════════════════
   Right — text
   ════════════════════════════════════════════════ */
.pc-body {
  display       : flex;
  flex-direction: column;
  padding       : clamp(1.5rem, 3.5vh, 2.5rem) clamp(1.5rem, 3vw, 2.5rem);
  gap           : clamp(.5rem, 1.2vh, .85rem);
}

.pc-year {
  font-size     : .7rem;
  font-weight   : 300;
  letter-spacing: .08em;
  color         : var(--card-muted);
  opacity       : .7;
}

.pc-client {
  font-family   : var(--font-display, 'Clash Display', sans-serif);
  font-weight   : 700;
  font-size     : clamp(1.5rem, 2.8vw, 2.4rem);
  line-height   : .95;
  letter-spacing: -.03em;
  margin        : 0;
}

.pc-desc {
  font-size  : clamp(.78rem, 1vw, .9rem);
  font-weight: 300;
  line-height: 1.75;
  color      : var(--card-muted);
  flex-grow  : 1;
  margin     : 0;
}

.pc-footer {
  display       : flex;
  flex-direction: column;
  gap           : .5rem;
  padding-top   : .85rem;
  border-top    : 1px solid var(--card-bdr);
  margin-top    : auto;
}

.pc-category {
  font-size     : .5rem;
  font-weight   : 500;
  letter-spacing: .14em;
  text-transform: uppercase;
  color         : #DB1552;
}

.pc-tags {
  display : flex;
  gap     : .35rem;
  flex-wrap: wrap;
}
.pc-tag {
  font-size     : .48rem;
  font-weight   : 400;
  letter-spacing: .08em;
  text-transform: uppercase;
  color         : var(--card-muted);
  border        : 1px solid var(--card-bdr);
  padding       : .18rem .5rem;
  border-radius : 2px;
}

/* ════════════════════════════════════════════════
   Responsive
   ════════════════════════════════════════════════ */
@media (max-width: 768px) {
  .pc-card {
    grid-template-columns: 1fr;
    grid-template-rows   : 50% 50%;
  }
  .pc-section { cursor: auto; }
  .pc-cursor  { display: none; }
}

/* ════════════════════════════════════════════════
   Reduced motion — no scale-back, no image zoom
   ════════════════════════════════════════════════ */
@media (prefers-reduced-motion: reduce) {
  .pc-img, .pc-card { transition: none !important; }
  .pc-cursor        { transition: opacity .15s ease !important; }
}
</style>
