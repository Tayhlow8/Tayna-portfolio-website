<template>
  <div :class="['pp-root', `theme-${theme}`]">

    <!-- Ambient -->
    <div class="pp-ambient" aria-hidden="true">
      <div class="pp-glow"></div>
      <div class="pp-glow-bl"></div>
      <div class="pp-grain"></div>
    </div>

    <NavBar v-model:lang="lang" v-model:theme="theme" />

    <!-- ══ HERO ══════════════════════════════════════════════ -->
    <section class="projects-hero">
      <div class="hero-left">
        <div class="hero-eyebrow">
          <span class="pf-dot" aria-hidden="true"></span>
          {{ t.eyebrow }}
        </div>
        <h1 class="hero-title" v-html="t.title"></h1>
        <div class="hero-rule" aria-hidden="true"></div>
      </div>
      <div class="hero-right">
        <p class="hero-desc">{{ t.desc }}</p>
        <div class="hero-stats">
          <div
            v-for="(stat, i) in statDefs"
            :key="i"
            class="hero-stat-item"
            :style="{ '--si': i }"
          >
            <div class="hero-stat-n">
              <span class="hero-stat-prefix">{{ stat.prefix }}</span>{{ statCounts[i] }}
            </div>
            <div class="hero-stat-t">{{ t.statLabels[i].replace(/^[+\d]+\s*/, '') }}</div>
          </div>
        </div>
      </div>
    </section>

    <!-- ══ GRID ══════════════════════════════════════════════ -->
    <section class="projects-section">
      <div class="projects-grid">
        <router-link
          v-for="(project, i) in projects"
          :key="project.slug"
          :to="`/projetos/${project.slug}`"
          class="project-card"
          :class="{ visible: visible[i] }"
          :ref="el => setRef(el, i)"
        >
          <!-- Thumbnail -->
          <div class="card-thumb" :style="{ background: project.bg }">
            <span class="card-index">{{ pad(i + 1) }}</span>
            <img v-if="project.image" :src="project.image" class="card-thumb-img" alt="" />
            <div v-else class="card-thumb-svg" v-html="project.svg"></div>
          </div>

          <!-- Body -->
          <div class="card-body">
            <div class="card-meta">
              <span class="card-client">{{ project.client }}</span>
              <span class="card-year">{{ project.year }}</span>
            </div>
            <h2 class="card-title">{{ project.title[lang] || project.title.EN }}</h2>
            <p class="card-desc">{{ project.desc[lang] || project.desc.EN }}</p>
            <div class="card-tags">
              <span v-for="tag in project.tags" :key="tag" class="card-tag">{{ tag }}</span>
            </div>
          </div>

          <!-- Footer -->
          <div class="card-footer">
            <span class="card-cta">
              {{ t.viewCase }}
              <span class="card-cta-arrow">→</span>
            </span>
            <span class="card-type">{{ project.type }}</span>
          </div>
        </router-link>
      </div>
    </section>

  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import NavBar from './NavBar.vue'

import imgRodobens from '../imagens cases/rodobens/case rodobens cover 1.png'
import imgMaster   from '../imagens cases/master globo/master goblo cover.png'
import imgYSL      from '../imagens cases/YSL Y intense/mobile exp.avif'
import imgLancome  from '../imagens cases/Lancme brazil/foto 1 lancome.avif'
import imgNV8      from '../clientes/nv8 case cover.png'

const props = defineProps({
  lang:  { type: String, default: 'PT' },
  theme: { type: String, default: 'dark' },
})

const lang  = ref(props.lang)
const theme = ref(props.theme)

// ── Helpers ─────────────────────────────────────────────────────
const pad = n => String(n).padStart(2, '0')

// ── Stats definition (prefix + target, labels come from i18n) ───
const statDefs = [
  { prefix: '+', target: 300  },
  { prefix: '+', target: 6    },
  { prefix: '',  target: 2026 },
]

// Displayed values (animated)
const statCounts = ref(statDefs.map(() => 0))

function runCountUp () {
  const duration = 1400 // ms
  const start    = performance.now()

  const ease = t => 1 - Math.pow(1 - t, 4) // ease-out quart

  function tick (now) {
    const progress = Math.min((now - start) / duration, 1)
    const e = ease(progress)
    statDefs.forEach((def, i) => {
      statCounts.value[i] = Math.round(e * def.target)
    })
    if (progress < 1) requestAnimationFrame(tick)
  }
  requestAnimationFrame(tick)
}

// ── i18n ────────────────────────────────────────────────────────
const copy = {
  PT: {
    eyebrow : 'Trabalho selecionado',
    title   : 'PRO<em>JETOS</em>',
    desc    : 'De experiências de marca de luxo a plataformas enterprise — quatro projetos que mostram como o design conecta complexidade de negócio e necessidades humanas reais.',
    count   : '05 projetos',
    sort    : 'Por recência',
    viewCase: 'Ver case',
    statLabels: ['+300 experiências desenhadas', '+6 diferentes setores', '2026 trabalho mais recente'],
  },
  EN: {
    eyebrow : 'Selected work',
    title   : 'PRO<em>JECTS</em>',
    desc    : 'From luxury brand experiences to enterprise platforms — four projects that show how design bridges business complexity and real human needs.',
    count   : '05 projects',
    sort    : 'Sorted by recency',
    viewCase: 'View case study',
    statLabels: ['+300 experiences designed', '+6 different sectors', '2026 latest work'],
  },
  ES: {
    eyebrow : 'Trabajo seleccionado',
    title   : 'PRO<em>YECTOS</em>',
    desc    : 'De experiencias de marca de lujo a plataformas enterprise — cuatro proyectos que demuestran cómo el diseño conecta la complejidad empresarial con las necesidades humanas reales.',
    count   : '05 proyectos',
    sort    : 'Por recencia',
    viewCase: 'Ver caso de estudio',
    statLabels: ['+300 experiencias diseñadas', '+6 sectores diferentes', '2026 trabajo más reciente'],
  },
  DE: {
    eyebrow : 'Ausgewählte Arbeit',
    title   : 'PRO<em>JEKTE</em>',
    desc    : 'Von Luxusmarkenerlebnissen bis zu Enterprise-Plattformen — vier Projekte, die zeigen, wie Design Geschäftskomplexität und menschliche Bedürfnisse verbindet.',
    count   : '05 Projekte',
    sort    : 'Nach Aktualität',
    viewCase: 'Case ansehen',
    statLabels: ['+300 gestaltete Erfahrungen', '+6 verschiedene Sektoren', '2026 neueste Arbeit'],
  },
}

const t = computed(() => copy[lang.value] ?? copy.PT)

// ── SVG thumbnails ───────────────────────────────────────────────
const svgRodobens = `<svg viewBox="0 0 560 315" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" style="width:100%;height:100%;display:block">
  <defs>
    <linearGradient id="r-g" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#F0185A" stop-opacity=".9"/><stop offset="100%" stop-color="#8B2FD4" stop-opacity=".6"/></linearGradient>
    <radialGradient id="r-glow" cx="50%" cy="55%"><stop offset="0%" stop-color="#F0185A" stop-opacity=".18"/><stop offset="100%" stop-color="#F0185A" stop-opacity="0"/></radialGradient>
  </defs>
  <rect width="560" height="315" fill="#070510"/>
  <ellipse cx="280" cy="175" rx="220" ry="140" fill="url(#r-glow)"/>
  <line x1="0" y1="79" x2="560" y2="79" stroke="rgba(240,24,90,.08)" stroke-width="1"/>
  <line x1="0" y1="158" x2="560" y2="158" stroke="rgba(240,24,90,.08)" stroke-width="1"/>
  <line x1="0" y1="237" x2="560" y2="237" stroke="rgba(240,24,90,.08)" stroke-width="1"/>
  <line x1="140" y1="0" x2="140" y2="315" stroke="rgba(240,24,90,.05)" stroke-width="1"/>
  <line x1="280" y1="0" x2="280" y2="315" stroke="rgba(240,24,90,.05)" stroke-width="1"/>
  <line x1="420" y1="0" x2="420" y2="315" stroke="rgba(240,24,90,.05)" stroke-width="1"/>
  <path d="M40,270 C100,270 80,80 160,80 C240,80 220,200 300,175 C380,150 360,100 440,100 C500,100 520,130 540,125" stroke="url(#r-g)" stroke-width="2" fill="none" opacity=".65"/>
  <path d="M40,250 C110,250 100,140 190,140 C270,140 260,195 340,170 C420,145 410,95 500,95" stroke="rgba(240,24,90,.3)" stroke-width="1.5" fill="none"/>
  <path d="M40,235 C120,235 130,170 210,170 C290,170 280,120 370,120 C430,120 460,140 540,135" stroke="rgba(139,47,212,.35)" stroke-width="1.5" fill="none"/>
  <circle cx="160" cy="80"  r="5" fill="none" stroke="#F0185A" stroke-width="1.5"/><circle cx="160" cy="80"  r="2.5" fill="#F0185A"/>
  <circle cx="300" cy="175" r="5" fill="none" stroke="#F0185A" stroke-width="1.5"/><circle cx="300" cy="175" r="2.5" fill="#F0185A"/>
  <circle cx="440" cy="100" r="5" fill="none" stroke="#8B2FD4" stroke-width="1.5"/><circle cx="440" cy="100" r="2.5" fill="#8B2FD4"/>
  <g transform="translate(246,119)">
    <rect width="68" height="68" fill="none" stroke="rgba(240,24,90,.45)" stroke-width="1.5"/>
    <rect x="5" y="5" width="58" height="58" fill="rgba(240,24,90,.05)"/>
    <circle cx="34" cy="34" r="14" fill="none" stroke="rgba(240,24,90,.6)" stroke-width="1.5"/>
    <circle cx="34" cy="34" r="5" fill="#F0185A" opacity=".85"/>
    <line x1="34" y1="20" x2="34" y2="14" stroke="rgba(240,24,90,.5)" stroke-width="1.5"/>
    <line x1="48" y1="34" x2="54" y2="34" stroke="rgba(240,24,90,.5)" stroke-width="1.5"/>
    <line x1="34" y1="48" x2="34" y2="54" stroke="rgba(240,24,90,.5)" stroke-width="1.5"/>
    <line x1="20" y1="34" x2="14" y2="34" stroke="rgba(240,24,90,.5)" stroke-width="1.5"/>
  </g>
  <text x="24" y="299" font-family="monospace" font-size="8" fill="rgba(240,24,90,.35)" letter-spacing="2">CREDIT · LEASING · ENTERPRISE SYSTEM</text>
</svg>`

const svgMaster = `<svg viewBox="0 0 560 315" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" style="width:100%;height:100%;display:block">
  <defs>
    <radialGradient id="g-glow" cx="50%" cy="50%"><stop offset="0%" stop-color="#00C864" stop-opacity=".22"/><stop offset="100%" stop-color="#00C864" stop-opacity="0"/></radialGradient>
  </defs>
  <rect width="560" height="315" fill="#07100a"/>
  <ellipse cx="280" cy="158" rx="200" ry="130" fill="url(#g-glow)"/>
  <line x1="0" y1="52"  x2="560" y2="52"  stroke="rgba(0,200,100,.06)" stroke-width="1"/>
  <line x1="0" y1="104" x2="560" y2="104" stroke="rgba(0,200,100,.06)" stroke-width="1"/>
  <line x1="0" y1="156" x2="560" y2="156" stroke="rgba(0,200,100,.09)" stroke-width="1"/>
  <line x1="0" y1="208" x2="560" y2="208" stroke="rgba(0,200,100,.06)" stroke-width="1"/>
  <line x1="0" y1="260" x2="560" y2="260" stroke="rgba(0,200,100,.06)" stroke-width="1"/>
  <circle cx="280" cy="158" r="30"  fill="none" stroke="rgba(0,200,100,.55)" stroke-width="1.5"/>
  <circle cx="280" cy="158" r="60"  fill="none" stroke="rgba(0,200,100,.28)" stroke-width="1.5" stroke-dasharray="6 4"/>
  <circle cx="280" cy="158" r="95"  fill="none" stroke="rgba(0,200,100,.14)" stroke-width="1" stroke-dasharray="4 6"/>
  <circle cx="280" cy="158" r="140" fill="none" stroke="rgba(0,200,100,.07)" stroke-width="1" stroke-dasharray="3 8"/>
  <line x1="280" y1="158" x2="190" y2="40"  stroke="rgba(0,200,100,.2)" stroke-width="1"/>
  <line x1="280" y1="158" x2="370" y2="40"  stroke="rgba(0,200,100,.2)" stroke-width="1"/>
  <line x1="280" y1="158" x2="490" y2="210" stroke="rgba(0,200,100,.15)" stroke-width="1"/>
  <line x1="280" y1="158" x2="70"  y2="210" stroke="rgba(0,200,100,.15)" stroke-width="1"/>
  <circle cx="280" cy="158" r="10" fill="rgba(0,200,100,.12)" stroke="rgba(0,200,100,.7)" stroke-width="1.5"/>
  <circle cx="280" cy="158" r="4" fill="#00C864"/>
  <g transform="translate(70,268)">
    <rect x="0"   y="-12" width="4" height="14" fill="rgba(0,200,100,.4)" rx="1"/>
    <rect x="10"  y="-7"  width="4" height="9"  fill="rgba(0,200,100,.3)" rx="1"/>
    <rect x="20"  y="-16" width="4" height="18" fill="rgba(0,200,100,.5)" rx="1"/>
    <rect x="30"  y="-10" width="4" height="12" fill="rgba(0,200,100,.35)" rx="1"/>
    <rect x="40"  y="-5"  width="4" height="7"  fill="rgba(0,200,100,.25)" rx="1"/>
    <rect x="50"  y="-14" width="4" height="16" fill="rgba(0,200,100,.45)" rx="1"/>
    <rect x="60"  y="-8"  width="4" height="10" fill="rgba(0,200,100,.3)" rx="1"/>
    <rect x="80"  y="-17" width="4" height="19" fill="rgba(0,200,100,.55)" rx="1"/>
    <rect x="90"  y="-9"  width="4" height="11" fill="rgba(0,200,100,.3)" rx="1"/>
    <rect x="320" y="-12" width="4" height="14" fill="rgba(0,200,100,.4)" rx="1"/>
    <rect x="340" y="-16" width="4" height="18" fill="rgba(0,200,100,.5)" rx="1"/>
    <rect x="360" y="-5"  width="4" height="7"  fill="rgba(0,200,100,.25)" rx="1"/>
    <rect x="380" y="-8"  width="4" height="10" fill="rgba(0,200,100,.3)" rx="1"/>
  </g>
  <text x="24" y="299" font-family="monospace" font-size="8" fill="rgba(0,200,100,.35)" letter-spacing="2">BROADCAST · DASHBOARD · MEDIA PLATFORM</text>
</svg>`

const svgYSL = `<svg viewBox="0 0 560 315" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" style="width:100%;height:100%;display:block">
  <defs>
    <linearGradient id="ysl-gold" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#C9A84C"/><stop offset="50%" stop-color="#F5D98B"/><stop offset="100%" stop-color="#C9A84C"/></linearGradient>
    <radialGradient id="ysl-glow" cx="50%" cy="50%"><stop offset="0%" stop-color="#C9A84C" stop-opacity=".15"/><stop offset="100%" stop-color="#C9A84C" stop-opacity="0"/></radialGradient>
  </defs>
  <rect width="560" height="315" fill="#100707"/>
  <ellipse cx="280" cy="158" rx="180" ry="120" fill="url(#ysl-glow)"/>
  <line x1="0"   y1="315" x2="315" y2="0"   stroke="rgba(201,168,76,.07)" stroke-width="1"/>
  <line x1="80"  y1="315" x2="395" y2="0"   stroke="rgba(201,168,76,.05)" stroke-width="1"/>
  <line x1="165" y1="315" x2="480" y2="0"   stroke="rgba(201,168,76,.04)" stroke-width="1"/>
  <line x1="80"  y1="100" x2="480" y2="100" stroke="rgba(201,168,76,.18)" stroke-width="1"/>
  <line x1="80"  y1="215" x2="480" y2="215" stroke="rgba(201,168,76,.18)" stroke-width="1"/>
  <g transform="translate(220,98)">
    <rect width="120" height="118" fill="none" stroke="url(#ysl-gold)" stroke-width="1"/>
    <rect x="8" y="8" width="104" height="102" fill="rgba(201,168,76,.04)" stroke="rgba(201,168,76,.25)" stroke-width=".5"/>
    <line x1="40" y1="28" x2="60" y2="58" stroke="url(#ysl-gold)" stroke-width="2.5" stroke-linecap="round"/>
    <line x1="80" y1="28" x2="60" y2="58" stroke="url(#ysl-gold)" stroke-width="2.5" stroke-linecap="round"/>
    <line x1="60" y1="58" x2="60" y2="88" stroke="url(#ysl-gold)" stroke-width="2.5" stroke-linecap="round"/>
    <rect x="0"   y="0"   width="6" height="6" fill="url(#ysl-gold)" opacity=".7"/>
    <rect x="114" y="0"   width="6" height="6" fill="url(#ysl-gold)" opacity=".7"/>
    <rect x="0"   y="112" width="6" height="6" fill="url(#ysl-gold)" opacity=".7"/>
    <rect x="114" y="112" width="6" height="6" fill="url(#ysl-gold)" opacity=".7"/>
  </g>
  <circle cx="180" cy="158" r="2"   fill="rgba(201,168,76,.5)"/>
  <circle cx="380" cy="158" r="2"   fill="rgba(201,168,76,.5)"/>
  <line x1="240" y1="240" x2="320" y2="240" stroke="rgba(201,168,76,.4)" stroke-width="1"/>
  <circle cx="280" cy="240" r="2.5" fill="rgba(201,168,76,.6)"/>
  <text x="24" y="299" font-family="monospace" font-size="8" fill="rgba(201,168,76,.35)" letter-spacing="3">LUXURY · DIGITAL EXPERIENCE · YSL</text>
</svg>`

const svgNV8 = `<svg viewBox="0 0 1120 320" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" style="width:100%;height:100%;display:block">
  <defs>
    <linearGradient id="nv-teal" x1="0" y1="0" x2="1" y2="1"><stop offset="0%" stop-color="#0CFDB5" stop-opacity=".8"/><stop offset="100%" stop-color="#0CBFFD" stop-opacity=".5"/></linearGradient>
    <radialGradient id="nv-glow" cx="50%" cy="50%"><stop offset="0%" stop-color="#0CFDB5" stop-opacity=".12"/><stop offset="100%" stop-color="#0CFDB5" stop-opacity="0"/></radialGradient>
    <linearGradient id="nv-code" x1="0" y1="0" x2="1" y2="0"><stop offset="0%" stop-color="#0CFDB5" stop-opacity="0"/><stop offset="20%" stop-color="#0CFDB5" stop-opacity=".6"/><stop offset="80%" stop-color="#0CBFFD" stop-opacity=".6"/><stop offset="100%" stop-color="#0CBFFD" stop-opacity="0"/></linearGradient>
  </defs>
  <rect width="1120" height="320" fill="#07070f"/>
  <ellipse cx="560" cy="160" rx="450" ry="200" fill="url(#nv-glow)"/>
  <g opacity=".1" stroke="rgba(12,253,181,1)" stroke-width=".8">
    <line x1="0" y1="80"  x2="1120" y2="80"/><line x1="0" y1="160" x2="1120" y2="160"/><line x1="0" y1="240" x2="1120" y2="240"/>
    <line x1="0"   y1="0" x2="560"  y2="320"/><line x1="160" y1="0" x2="720"  y2="320"/><line x1="320" y1="0" x2="880"  y2="320"/>
    <line x1="480" y1="0" x2="1040" y2="320"/><line x1="640" y1="0" x2="1120" y2="320"/><line x1="800" y1="0" x2="1120" y2="200"/>
    <line x1="960" y1="0" x2="1120" y2="107"/><line x1="1120" y1="0" x2="560"  y2="320"/><line x1="960"  y1="0" x2="400"  y2="320"/>
    <line x1="800"  y1="0" x2="240"  y2="320"/><line x1="640"  y1="0" x2="80"   y2="320"/><line x1="480"  y1="0" x2="0"    y2="320"/>
    <line x1="320"  y1="0" x2="0"    y2="213"/><line x1="160"  y1="0" x2="0"    y2="107"/>
  </g>
  <text x="100" y="74"  font-family="monospace" font-size="9" fill="url(#nv-code)" letter-spacing="3" opacity=".7">const design = system.build({ tokens, components, motion })</text>
  <text x="300" y="154" font-family="monospace" font-size="9" fill="url(#nv-code)" letter-spacing="3" opacity=".6">export default function NV8({ software, people, craft })</text>
  <text x="180" y="234" font-family="monospace" font-size="9" fill="url(#nv-code)" letter-spacing="3" opacity=".55">import { vision } from './brand' — where technology meets experience</text>
  <g transform="translate(516,112)">
    <rect width="88" height="88" fill="none" stroke="rgba(12,253,181,.5)" stroke-width="1.5"/>
    <rect x="6" y="6" width="76" height="76" fill="rgba(12,253,181,.04)" stroke="rgba(12,253,181,.2)" stroke-width=".5"/>
    <line x1="22" y1="62" x2="22" y2="26" stroke="url(#nv-teal)" stroke-width="2.5" stroke-linecap="round"/>
    <line x1="22" y1="26" x2="66" y2="62" stroke="url(#nv-teal)" stroke-width="2.5" stroke-linecap="round"/>
    <line x1="66" y1="62" x2="66" y2="26" stroke="url(#nv-teal)" stroke-width="2.5" stroke-linecap="round"/>
    <rect x="0"  y="0"  width="5" height="5" fill="#0CFDB5" opacity=".8"/>
    <rect x="83" y="0"  width="5" height="5" fill="#0CFDB5" opacity=".8"/>
    <rect x="0"  y="83" width="5" height="5" fill="#0CFDB5" opacity=".8"/>
    <rect x="83" y="83" width="5" height="5" fill="#0CFDB5" opacity=".8"/>
  </g>
  <circle cx="200" cy="120" r="3" fill="#0CFDB5" opacity=".6"/><circle cx="200" cy="120" r="7" fill="none" stroke="rgba(12,253,181,.3)" stroke-width="1"/>
  <circle cx="920" cy="120" r="3" fill="#0CBFFD" opacity=".6"/><circle cx="920" cy="120" r="7" fill="none" stroke="rgba(12,191,253,.3)" stroke-width="1"/>
  <circle cx="200" cy="200" r="2" fill="#0CFDB5" opacity=".4"/><circle cx="920" cy="200" r="2" fill="#0CBFFD" opacity=".4"/>
  <circle cx="380" cy="60"  r="2" fill="rgba(12,253,181,.5)"/><circle cx="740" cy="60"  r="2" fill="rgba(12,191,253,.5)"/>
  <line x1="207" y1="120" x2="516" y2="156" stroke="rgba(12,253,181,.15)" stroke-width="1" stroke-dasharray="4 4"/>
  <line x1="913" y1="120" x2="604" y2="156" stroke="rgba(12,191,253,.15)" stroke-width="1" stroke-dasharray="4 4"/>
  <text x="24" y="307" font-family="monospace" font-size="8" fill="rgba(12,253,181,.35)" letter-spacing="2">SOFTWARE HOUSE · WEBSITE REDESIGN · NV8 TECNOLOGIA</text>
</svg>`

const svgLancome = `<svg viewBox="0 0 560 315" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" style="width:100%;height:100%;display:block">
  <defs>
    <radialGradient id="lc-g1" cx="40%" cy="40%"><stop offset="0%" stop-color="#E070A0" stop-opacity=".25"/><stop offset="100%" stop-color="#E070A0" stop-opacity="0"/></radialGradient>
    <radialGradient id="lc-g2" cx="65%" cy="65%"><stop offset="0%" stop-color="#9B59B6" stop-opacity=".2"/><stop offset="100%" stop-color="#9B59B6" stop-opacity="0"/></radialGradient>
  </defs>
  <rect width="560" height="315" fill="#100710"/>
  <ellipse cx="210" cy="140" rx="170" ry="120" fill="url(#lc-g1)"/>
  <ellipse cx="380" cy="190" rx="140" ry="100" fill="url(#lc-g2)"/>
  <g transform="translate(280,158)">
    <ellipse cx="0" cy="-44" rx="15" ry="30" fill="none" stroke="rgba(224,112,160,.55)" stroke-width="1.5" transform="rotate(0)"/>
    <ellipse cx="0" cy="-44" rx="15" ry="30" fill="none" stroke="rgba(224,112,160,.4)"  stroke-width="1.5" transform="rotate(45)"/>
    <ellipse cx="0" cy="-44" rx="15" ry="30" fill="none" stroke="rgba(224,112,160,.45)" stroke-width="1.5" transform="rotate(90)"/>
    <ellipse cx="0" cy="-44" rx="15" ry="30" fill="none" stroke="rgba(155,89,182,.4)"   stroke-width="1.5" transform="rotate(135)"/>
    <ellipse cx="0" cy="-44" rx="15" ry="30" fill="none" stroke="rgba(224,112,160,.5)"  stroke-width="1.5" transform="rotate(180)"/>
    <ellipse cx="0" cy="-44" rx="15" ry="30" fill="none" stroke="rgba(224,112,160,.35)" stroke-width="1.5" transform="rotate(225)"/>
    <ellipse cx="0" cy="-44" rx="15" ry="30" fill="none" stroke="rgba(155,89,182,.45)"  stroke-width="1.5" transform="rotate(270)"/>
    <ellipse cx="0" cy="-44" rx="15" ry="30" fill="none" stroke="rgba(224,112,160,.4)"  stroke-width="1.5" transform="rotate(315)"/>
    <ellipse cx="0" cy="-22" rx="8"  ry="17" fill="rgba(224,112,160,.07)" stroke="rgba(224,112,160,.5)"  stroke-width="1" transform="rotate(22.5)"/>
    <ellipse cx="0" cy="-22" rx="8"  ry="17" fill="rgba(224,112,160,.05)" stroke="rgba(155,89,182,.4)"  stroke-width="1" transform="rotate(67.5)"/>
    <ellipse cx="0" cy="-22" rx="8"  ry="17" fill="rgba(224,112,160,.06)" stroke="rgba(224,112,160,.45)" stroke-width="1" transform="rotate(112.5)"/>
    <circle cx="0" cy="0" r="8"   fill="rgba(224,112,160,.15)" stroke="rgba(224,112,160,.7)" stroke-width="1.5"/>
    <circle cx="0" cy="0" r="3.5" fill="#E070A0" opacity=".85"/>
  </g>
  <circle cx="175" cy="88"  r="2"   fill="rgba(224,112,160,.5)"/>
  <circle cx="400" cy="80"  r="1.5" fill="rgba(224,112,160,.4)"/>
  <circle cx="430" cy="225" r="2"   fill="rgba(155,89,182,.5)"/>
  <circle cx="135" cy="235" r="1.5" fill="rgba(224,112,160,.35)"/>
  <line x1="60" y1="262" x2="500" y2="262" stroke="rgba(224,112,160,.12)" stroke-width="1"/>
  <text x="24" y="299" font-family="monospace" font-size="8" fill="rgba(224,112,160,.35)" letter-spacing="2">BEAUTY · E-COMMERCE · LANCÔME BRAZIL</text>
</svg>`

// ── Projects data ────────────────────────────────────────────────
const projects = [
  {
    slug  : 'rodobens',
    client: 'Rodobens',
    year  : '2026',
    title : { PT: 'Sistema de Crédito & Leasing', EN: 'Credit & Leasing System', ES: 'Sistema de Crédito y Leasing', DE: 'Kredit- & Leasing-System' },
    desc  : {
      PT: 'Modernização de uma plataforma enterprise legada para um dos maiores conglomerados financeiros do Brasil — reconstruindo 75 anos de fluxo de crédito em um produto escalável e navegável.',
      EN: 'Modernization of a legacy enterprise platform for one of Brazil\'s largest financial conglomerates — rebuilding 75 years of credit workflow into a scalable, navigable product.',
      ES: 'Modernización de una plataforma enterprise heredada para uno de los mayores conglomerados financieros de Brasil.',
      DE: 'Modernisierung einer Legacy-Enterprise-Plattform für eines der größten Finanzkonglomerate Brasiliens.',
    },
    tags : ['Product Design', 'Design System', 'B2B · Fintech'],
    type : 'Enterprise · Internal tool',
    bg   : '#070510',
    image: imgRodobens,
    svg  : svgRodobens,
  },
  {
    slug  : 'master-globo',
    client: 'Master Globo',
    year  : '2025',
    title : { PT: 'UX Research to product launch', EN: 'UX Research to product launch', ES: 'UX Research to product launch', DE: 'UX Research to product launch' },
    desc  : {
      PT: 'Pesquisa quantitativa e qualitativa com a base de dados da plataforma educacional para lançamento de novo formato de produto.',
      EN: 'Pesquisa quantitativa e qualitativa com a base de dados da plataforma educacional para lançamento de novo formato de produto.',
      ES: 'Pesquisa quantitativa e qualitativa com a base de dados da plataforma educacional para lançamento de novo formato de produto.',
      DE: 'Pesquisa quantitativa e qualitativa com a base de dados da plataforma educacional para lançamento de novo formato de produto.',
    },
    tags : ['UX Research', 'Media & Broadcast', 'B2B'],
    type : 'Enterprise · Media',
    bg   : '#07100a',
    image: imgMaster,
    svg  : svgMaster,
  },
  {
    slug  : 'yves-saint-laurent',
    client: 'Yves Saint Laurent',
    year  : '2023',
    title : { PT: 'Experiência Digital', EN: 'Digital Experience', ES: 'Experiencia Digital', DE: 'Digitale Erfahrung' },
    desc  : {
      PT: "Criação de uma experiência digital à altura para uma das marcas mais icônicas do mundo. Onde o rock'n'roll encontra o luxo.",
      EN: "Criação de uma experiência digital à altura para uma das marcas mais icônicas do mundo. Onde o rock'n'roll encontra o luxo.",
      ES: "Criação de uma experiência digital à altura para uma das marcas mais icônicas do mundo. Onde o rock'n'roll encontra o luxo.",
      DE: "Criação de uma experiência digital à altura para uma das marcas mais icônicas do mundo. Onde o rock'n'roll encontra o luxo.",
    },
    tags : ['Luxury', 'E-commerce', 'Brand Experience'],
    type : 'Retail · Fashion',
    bg   : '#100707',
    image: imgYSL,
    svg  : svgYSL,
  },
  {
    slug  : 'lancome-brazil',
    client: 'Lancôme Brazil',
    year  : '2023',
    title : { PT: "Lancome's sensorial experience", EN: "Lancome's sensorial experience", ES: "Lancome's sensorial experience", DE: "Lancome's sensorial experience" },
    desc  : {
      PT: 'An immersive, invitation-only sensorial exhibition in São Paulo celebrating the history of Lancôme through perfume, jewelry, fashion, sound, and haute cuisine — designed to engage all five human senses.',
      EN: 'An immersive, invitation-only sensorial exhibition in São Paulo celebrating the history of Lancôme through perfume, jewelry, fashion, sound, and haute cuisine — designed to engage all five human senses.',
      ES: 'An immersive, invitation-only sensorial exhibition in São Paulo celebrating the history of Lancôme through perfume, jewelry, fashion, sound, and haute cuisine — designed to engage all five human senses.',
      DE: 'An immersive, invitation-only sensorial exhibition in São Paulo celebrating the history of Lancôme through perfume, jewelry, fashion, sound, and haute cuisine — designed to engage all five human senses.',
    },
    tags : ['Beauty', 'Brand Experience', 'Exhibition'],
    type : 'Retail · Beauty',
    bg   : '#100710',
    image: imgLancome,
    svg  : svgLancome,
  },
  {
    slug  : 'nv8',
    client: 'NV8 Tecnologia',
    year  : '2025',
    title : { PT: 'Redesign do Website', EN: 'Website Redesign', ES: 'Rediseño del Website', DE: 'Website Redesign' },
    desc  : {
      PT: 'Construindo a presença digital de uma software house brasileira do zero — sombria, cinematográfica, maximalista. Um design system, estratégia de motion e site completo para falar com devs e decisores.',
      EN: 'Building the digital presence of a Brazilian software house from the ground up — dark, cinematic, maximalist. A design system, motion strategy, and full website built to speak to developers and decision-makers alike.',
      ES: 'Construyendo la presencia digital de una software house brasileña desde cero — oscura, cinematográfica, maximalista. Un design system, estrategia de motion y sitio completo.',
      DE: 'Aufbau der digitalen Präsenz eines brasilianischen Software-Hauses von Grund auf — dunkel, cinematisch, maximalistisch. Design System, Motion-Strategie und vollständige Website.',
    },
    tags: ['Web Design', 'Design System', 'Motion', 'Software House'],
    type: 'B2B · Software',
    bg   : '#07070f',
    image: imgNV8,
    svg  : svgNV8,
  },
]

// ── Scroll reveal ────────────────────────────────────────────────
const cardRefs = ref([])
const visible  = ref({})

function setRef (el, i) {
  if (el) cardRefs.value[i] = el
}

let observer = null

onMounted(() => {
  // Count-up dispara após a animação de entrada do hero
  setTimeout(runCountUp, 600)

  observer = new IntersectionObserver(
    entries => {
      entries.forEach(entry => {
        const i = cardRefs.value.findIndex(r => r === entry.target || r?.$el === entry.target)
        if (entry.isIntersecting && i !== -1) visible.value = { ...visible.value, [i]: true }
      })
    },
    { threshold: 0.08 }
  )
  cardRefs.value.forEach(el => el && observer.observe(el.$el ?? el))
})

onUnmounted(() => observer?.disconnect())
</script>

<style scoped>
/* ── Tokens ───────────────────────────────────────────────── */
.pp-root {
  font-family : var(--font-body, 'DM Sans', sans-serif);
  min-height  : 100svh;
  position    : relative;
  overflow-x  : hidden;
  background  : var(--bg);
  color       : var(--fg);
  transition  : background .5s ease, color .5s ease;
}

.theme-dark {
  --bg           : #070711;
  --fg           : #F0EFF8;
  --fg-muted     : #6B6A82;
  --fg-faint     : #22213A;
  --border       : rgba(255,255,255,.07);
  --ghost-border : rgba(255,255,255,.11);
  --btn-fill     : #070711;
  --grain-opacity: .04;
  --accent       : #F0185A;
  --accent-glow  : rgba(240,24,90,.12);
  --accent-soft  : rgba(240,24,90,.4);
  --glass-bg     : rgba(7,7,17,.45);
  --glass-border : rgba(255,255,255,.09);
  --glass-hi     : rgba(255,255,255,.06);
  --glass-shadow : rgba(0,0,0,.45);
}
.theme-light {
  --bg           : #F5F3FF;
  --fg           : #0D0C1A;
  --fg-muted     : #62607A;
  --fg-faint     : #D2CFEA;
  --border       : rgba(0,0,0,.08);
  --ghost-border : rgba(13,12,26,.12);
  --btn-fill     : #F5F3FF;
  --grain-opacity: .025;
  --accent       : #F0185A;
  --accent-glow  : rgba(240,24,90,.12);
  --accent-soft  : rgba(240,24,90,.4);
  --glass-bg     : rgba(245,243,255,.52);
  --glass-border : rgba(240,24,90,.13);
  --glass-hi     : rgba(255,255,255,.72);
  --glass-shadow : rgba(13,12,26,.12);
}

/* ── Ambient ──────────────────────────────────────────────── */
.pp-ambient { position:fixed; inset:0; pointer-events:none; z-index:0 }
.pp-glow {
  position   : absolute;
  top        : -15%; right: -8%;
  width      : 65vw; height: 65vw;
  background : radial-gradient(ellipse at 65% 25%, var(--accent-glow) 0%, transparent 62%);
}
.theme-light .pp-glow { opacity: .55 }
.pp-glow-bl {
  position   : absolute;
  bottom     : -10%; left: -5%;
  width      : 50vw; height: 50vw;
  background : radial-gradient(ellipse at 30% 70%, rgba(240,24,90,.05) 0%, transparent 65%);
}
.pp-grain {
  position         : absolute;
  inset            : 0;
  opacity          : var(--grain-opacity);
  background-image : url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");
  background-size  : 180px 180px;
}

/* ── Hero ─────────────────────────────────────────────────── */
/* Padding-top: 56px (navbar) + 5rem breathing room
   Lados: seguem breakpoints do design-system.html
   Mobile 1.5rem · 640 3rem · 1024 4rem */
.projects-hero {
  position        : relative;
  z-index         : 1;
  max-width       : 1120px;
  margin          : 0 auto;
  padding         : calc(56px + var(--sp-20, 5rem)) var(--sp-6, 1.5rem) var(--sp-12, 3rem);
  display         : flex;
  flex-direction  : column;
  gap             : var(--sp-8, 2rem);
}

.hero-eyebrow {
  display        : flex;
  align-items    : center;
  gap            : .5rem;
  font-size      : .6rem;
  font-weight    : 500;
  letter-spacing : .16em;
  text-transform : uppercase;
  color          : var(--fg-muted);
  margin-bottom  : var(--sp-6, 1.5rem);
  animation      : pf-up .8s cubic-bezier(.16,1,.3,1) .1s both;
}
.pf-dot {
  width         : 5px;
  height        : 5px;
  border-radius : 50%;
  background    : var(--accent);
  flex-shrink   : 0;
  animation     : pf-pulse 2.5s ease-in-out infinite;
}

.hero-title {
  font-family    : var(--font-display, 'Clash Display', sans-serif);
  font-weight    : 700;
  font-size      : clamp(2.8rem, 10vw, 5rem);
  line-height    : .88;
  letter-spacing : -.025em;
  margin-bottom  : var(--sp-6, 1.5rem);
  animation      : pf-up .85s cubic-bezier(.16,1,.3,1) .18s both;
}
.hero-title :deep(em) { font-style: italic; color: var(--accent) }

.hero-rule {
  width      : 100%;
  height     : 1px;
  background : linear-gradient(90deg, rgba(240,24,90,.55) 0%, transparent 65%);
  animation  : pf-up .85s cubic-bezier(.16,1,.3,1) .24s both;
}

.hero-right { animation: pf-up .85s cubic-bezier(.16,1,.3,1) .3s both }

.hero-desc {
  font-size     : clamp(.88rem, 1.4vw, .96rem);
  font-weight   : 300;
  line-height   : 1.85;
  color         : var(--fg-muted);
  max-width     : 44ch;
  margin-bottom : var(--sp-8, 2rem);
}

.hero-stats { display: flex; gap: var(--sp-8, 2rem); flex-wrap: wrap }

.hero-stat-item {
  display   : flex;
  flex-direction: column;
  gap       : 4px;
  /* parallax ascending: cada stat sobe com delay escalonado */
  animation : stat-ascend .9s cubic-bezier(.16,1,.3,1) both;
  animation-delay: calc(.45s + var(--si) * .15s);
}

.hero-stat-n {
  font-family  : var(--font-display, 'Clash Display', sans-serif);
  font-size    : clamp(1.6rem, 3vw, 2.2rem);
  font-weight  : 700;
  color        : var(--accent);
  line-height  : 1;
  /* clip para o número ascender dentro do seu container */
  overflow     : hidden;
}

.hero-stat-prefix { color: var(--accent) }

/* o número em si tem o movimento ascendente interno */
.hero-stat-n {
  position: relative;
}

.hero-stat-t {
  font-size      : .5rem;
  font-weight    : 500;
  letter-spacing : .14em;
  text-transform : uppercase;
  color          : var(--fg-muted);
  animation      : stat-label-in .7s cubic-bezier(.16,1,.3,1) both;
  animation-delay: calc(.6s + var(--si) * .15s);
}

@keyframes stat-ascend {
  from {
    opacity   : 0;
    transform : translateY(32px);
    filter    : blur(6px);
  }
  to {
    opacity   : 1;
    transform : translateY(0);
    filter    : blur(0);
  }
}

@keyframes stat-label-in {
  from { opacity: 0; transform: translateY(10px) }
  to   { opacity: 1; transform: translateY(0) }
}

/* ── Projects section ─────────────────────────────────────── */
.projects-section {
  position  : relative;
  z-index   : 1;
  max-width : 1120px;
  margin    : 0 auto;
  padding   : 0 var(--sp-6, 1.5rem) var(--sp-24, 6rem);
}

.projects-bar {
  display         : flex;
  align-items     : center;
  justify-content : space-between;
  padding         : var(--sp-4, 1rem) 0;
  border-top      : 1px solid var(--border);
  margin-bottom   : var(--sp-8, 2rem);
}
.projects-count,
.projects-sort {
  font-size      : .5rem;
  font-weight    : 500;
  letter-spacing : .16em;
  text-transform : uppercase;
  color          : var(--fg-muted);
}

/* ── Grid ─────────────────────────────────────────────────── */
.projects-grid {
  display               : grid;
  grid-template-columns : 1fr;
  gap                   : var(--sp-6, 1.5rem);
}

/* ── Card ─────────────────────────────────────────────────── */
.project-card {
  position        : relative;
  border          : 1px solid var(--border);
  cursor          : pointer;
  display         : flex;
  flex-direction  : column;
  text-decoration : none;
  color           : inherit;
  opacity         : 0;
  transform       : translateY(28px);
  transition      : opacity .65s cubic-bezier(.16,1,.3,1),
                    transform .65s cubic-bezier(.16,1,.3,1),
                    border-color .3s;
}
.project-card.visible   { opacity: 1; transform: translateY(0) }
.project-card:hover     { border-color: var(--accent-soft) }

.project-card:nth-child(1) { transition-delay: .05s }
.project-card:nth-child(2) { transition-delay: .12s }
.project-card:nth-child(3) { transition-delay: .19s }
.project-card:nth-child(4) { transition-delay: .26s }
.project-card:nth-child(5) { transition-delay: .05s }

/* ── Thumbnail ──────────────────────────────────────────────── */
.card-thumb {
  position     : relative;
  width        : 100%;
  aspect-ratio : 16 / 9;
  overflow     : hidden;
  flex-shrink  : 0;
}
.card-thumb-img {
  position   : absolute;
  inset      : 0;
  width      : 100%;
  height     : 100%;
  object-fit : cover;
  display    : block;
  transition : transform .7s cubic-bezier(.16,1,.3,1);
}
.project-card:hover .card-thumb-img { transform: scale(1.04) }

.card-thumb-svg {
  width   : 100%;
  height  : 100%;
  display : block;
  transition: transform .7s cubic-bezier(.16,1,.3,1);
}
.project-card:hover .card-thumb-svg { transform: scale(1.04) }
.card-thumb-svg :deep(svg) { width: 100%; height: 100%; display: block }

.card-thumb::after {
  content    : '';
  position   : absolute;
  inset      : 0;
  background : linear-gradient(135deg, var(--accent-glow) 0%, transparent 55%);
  opacity    : 0;
  transition : opacity .4s;
}
.project-card:hover .card-thumb::after { opacity: 1 }

.card-index {
  position        : absolute;
  top             : var(--sp-4, 1rem);
  left            : var(--sp-4, 1rem);
  font-family     : var(--font-display, 'Clash Display', sans-serif);
  font-size       : .6rem;
  font-weight     : 700;
  color           : var(--accent);
  letter-spacing  : .08em;
  background      : var(--glass-bg);
  border          : 1px solid var(--glass-border);
  backdrop-filter : blur(8px);
  -webkit-backdrop-filter: blur(8px);
  padding         : 3px 9px;
  z-index         : 2;
}

/* ── Card body ──────────────────────────────────────────────── */
.card-body {
  padding        : var(--sp-6, 1.5rem);
  display        : flex;
  flex-direction : column;
  gap            : var(--sp-4, 1rem);
  flex           : 1;
}
.card-meta { display: flex; align-items: center; gap: var(--sp-3, .75rem) }

.card-client {
  font-size      : .5rem;
  font-weight    : 500;
  letter-spacing : .12em;
  text-transform : uppercase;
  color          : var(--fg-muted);
  padding        : 2px 8px;
  border         : 1px solid var(--border);
  transition     : border-color .3s, color .3s;
}
.project-card:hover .card-client { border-color: var(--accent-soft); color: var(--accent) }

.card-year {
  font-size      : .5rem;
  font-weight    : 500;
  letter-spacing : .14em;
  text-transform : uppercase;
  color          : var(--fg-muted);
}

.card-title {
  font-family    : var(--font-display, 'Clash Display', sans-serif);
  font-weight    : 700;
  font-size      : clamp(1.3rem, 2.5vw, 1.9rem);
  line-height    : .95;
  letter-spacing : -.02em;
  transition     : color .3s;
}
.project-card:hover .card-title { color: var(--accent) }

.card-desc {
  font-size   : clamp(.8rem, 1.2vw, .88rem);
  font-weight : 300;
  line-height : 1.85;
  color       : var(--fg-muted);
}

.card-tags {
  display     : flex;
  flex-wrap   : wrap;
  gap         : var(--sp-2, .5rem);
  margin-top  : auto;
  padding-top : var(--sp-2, .5rem);
}
.card-tag {
  font-size      : .48rem;
  font-weight    : 500;
  letter-spacing : .12em;
  text-transform : uppercase;
  color          : var(--fg-muted);
  padding        : 3px 10px;
  border         : 1px solid var(--border);
  transition     : border-color .3s;
}
.project-card:hover .card-tag { border-color: rgba(240,24,90,.2) }

/* ── Card footer ────────────────────────────────────────────── */
.card-footer {
  padding         : var(--sp-4, 1rem) var(--sp-6, 1.5rem);
  border-top      : 1px solid var(--border);
  display         : flex;
  align-items     : center;
  justify-content : space-between;
  transition      : border-color .3s;
}
.project-card:hover .card-footer { border-color: var(--accent-soft) }

.card-cta {
  display        : inline-flex;
  align-items    : center;
  gap            : var(--sp-2, .5rem);
  font-size      : .55rem;
  font-weight    : 500;
  letter-spacing : .13em;
  text-transform : uppercase;
  color          : var(--accent);
}
.card-cta-arrow { transition: transform .3s cubic-bezier(.16,1,.3,1) }
.project-card:hover .card-cta-arrow { transform: translateX(5px) }

.card-type {
  font-size      : .48rem;
  font-weight    : 500;
  letter-spacing : .12em;
  text-transform : uppercase;
  color          : var(--fg-faint);
}

/* ── Responsive — design-system breakpoints ─────────────────── */
/* 5th card spans full width (both mobile and desktop) */
.project-card:last-child { grid-column: 1 / -1 }
.project-card:last-child .card-thumb { aspect-ratio: 21 / 7 }
.project-card:last-child .card-title { font-size: clamp(1.6rem, 3vw, 2.4rem) }

@media (min-width: 640px) {
  .projects-hero    { padding: calc(56px + var(--sp-20, 5rem)) var(--sp-12, 3rem) var(--sp-12, 3rem) }
  .projects-section { padding: 0 var(--sp-12, 3rem) var(--sp-24, 6rem) }
  .projects-grid    { grid-template-columns: 1fr 1fr }
}

@media (min-width: 1024px) {
  .projects-hero {
    padding              : calc(56px + var(--sp-20, 5rem)) var(--sp-16, 4rem) var(--sp-12, 3rem);
    display              : grid;
    grid-template-columns: 1fr 1fr;
    gap                  : var(--sp-16, 4rem);
    align-items          : end;
    flex-direction       : unset;
  }
  .projects-section { padding: 0 var(--sp-16, 4rem) var(--sp-24, 6rem) }
}

/* ── Keyframes ──────────────────────────────────────────────── */
@keyframes pf-up {
  from { opacity: 0; transform: translateY(24px); filter: blur(8px) }
  to   { opacity: 1; transform: translateY(0);    filter: blur(0)   }
}
@keyframes pf-pulse {
  0%, 100% { opacity: 1;  transform: scale(1)   }
  50%      { opacity: .3; transform: scale(.75) }
}
</style>
