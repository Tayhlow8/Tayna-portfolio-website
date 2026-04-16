<template>
  <section id="projetos" :class="['projects-root', `theme-${theme}`]" aria-labelledby="projects-heading">

    <div class="pf-grain" aria-hidden="true"></div>

    <div class="projects-wrap">

      <!-- Eyebrow -->
      <div class="pf-eyebrow">
        <span class="pf-dot" aria-hidden="true"></span>
        <span>{{ t.eyebrow }}</span>
      </div>

      <!-- Heading -->
      <div class="projects-header">
        <h2 id="projects-heading" class="projects-heading">
          {{ t.heading[0] }}<br/>
          <em>{{ t.heading[1] }}</em>
        </h2>
        <router-link to="/projetos" class="pf-btn pf-btn--ghost projects-all-link">
          <span class="pf-ring"  aria-hidden="true"></span>
          <span class="pf-veil"  aria-hidden="true"></span>
          <span class="pf-core"  aria-hidden="true"></span>
          <span class="pf-btn-lbl">{{ t.allProjects }} <span class="pf-arr" aria-hidden="true">→</span></span>
        </router-link>
      </div>

      <div class="pf-rule" aria-hidden="true"></div>

      <!-- Grid: 1 featured + 3 smaller -->
      <div class="projects-grid">

        <!-- ── Featured card ── -->
        <router-link
          :to="`/projetos/${featured.slug}`"
          class="card card--featured"
          :aria-label="featured.client"
        >
          <!-- Image area -->
          <div class="card-img-wrap">
            <div class="card-img" :style="{ background: featured.bg }" aria-hidden="true">
              <img v-if="featured.image" :src="featured.image" class="card-img-photo" loading="lazy" alt="" />
              <div v-else class="card-img-inner" v-html="featured.visual"></div>
            </div>
            <div class="card-img-overlay" aria-hidden="true"></div>
          </div>

          <!-- Content -->
          <div class="card-body">
            <div class="card-meta">
              <span class="card-tag">{{ featured.category }}</span>
              <span class="card-year">{{ featured.year }}</span>
            </div>
            <h3 class="card-client">{{ featured.client }}</h3>
            <p class="card-case-title">{{ featured.title }}</p>
            <p class="card-desc">{{ featured.desc }}</p>
            <div class="card-tags">
              <span v-for="tag in featured.tags" :key="tag" class="card-tag-item">{{ tag }}</span>
            </div>
            <div class="card-cta">
              <span class="card-cta-label">{{ t.viewProject }}</span>
              <span class="card-cta-arr">→</span>
            </div>
          </div>

          <!-- Corner accent -->
          <div class="card-corner" aria-hidden="true"></div>
        </router-link>

        <!-- ── Smaller cards ── -->
        <router-link
          v-for="(project, i) in secondary"
          :key="project.slug"
          :to="`/projetos/${project.slug}`"
          class="card card--small"
          :style="{ '--delay': `${0.15 + i * 0.1}s` }"
          :aria-label="project.client"
        >
          <!-- Image area -->
          <div class="card-img-wrap">
            <div class="card-img" :style="{ background: project.bg }" aria-hidden="true">
              <img v-if="project.image" :src="project.image" class="card-img-photo" loading="lazy" alt="" />
              <div v-else class="card-img-inner" v-html="project.visual"></div>
            </div>
            <div class="card-img-overlay" aria-hidden="true"></div>
          </div>

          <!-- Content -->
          <div class="card-body">
            <div class="card-meta">
              <span class="card-tag">{{ project.category }}</span>
              <span class="card-year">{{ project.year }}</span>
            </div>
            <h3 class="card-client">{{ project.client }}</h3>
            <p class="card-case-title">{{ project.title }}</p>
            <p class="card-desc">{{ project.desc }}</p>
            <div class="card-tags">
              <span v-for="tag in project.tags" :key="tag" class="card-tag-item">{{ tag }}</span>
            </div>
            <div class="card-cta">
              <span class="card-cta-label">{{ t.viewProject }}</span>
              <span class="card-cta-arr">→</span>
            </div>
          </div>

          <div class="card-corner" aria-hidden="true"></div>
        </router-link>

      </div>
    </div>
  </section>
</template>

<script setup>
import { computed } from 'vue'
import rodobensCover from '../../imagens cases/rodobens/case rodobens cover 1.png'
import masterCover   from '../../imagens cases/master globo/master globo avatars.avif'
import lancomeCover  from '../../imagens cases/Lancme brazil/case desktp.avif'
import yslCover      from '../../imagens cases/YSL Y intense/mobile exp.avif'
import nv8Cover      from '../../clientes/nv8 case cover.png'

const props = defineProps({
  theme: { type: String, default: 'light' },
  lang:  { type: String, default: 'PT'  },
})

// ── i18n ────────────────────────────────────────────────────────
const copy = {
  PT: {
    eyebrow    : 'Projetos Selecionados',
    heading    : ['cases que', 'falam por si'],
    allProjects: 'Ver todos',
    viewProject: 'Ver projeto',
    categories : {
      ux       : 'UX Design',
      research : 'Research',
      product  : 'Product Design',
      brand    : 'Brand Experience',
    },
    impacts: {
      rodobens : 'Como transformei um sistema legado antigo, lento, não escalável e dependente de processos externos em uma plataforma única, escalável, rápida e intuitiva para seus mais de 600 usuários.',
      master   : 'Pesquisa quantitativa e qualitativa com a base de dados da plataforma educacional para lançamento de novo formato de produto.',
      lancome  : 'E-commerce de beleza com aumento de 52% na conversão',
      ysl      : 'Experiência de marca digital para lançamento global',
      nv8      : 'Redesign completo de identidade, arquitetura e stack — de HTML estático a Vue.js com design system próprio, entregue em 1 semana com IA.',
    },
  },
  EN: {
    eyebrow    : 'Selected Projects',
    heading    : ['cases that', 'speak for themselves'],
    allProjects: 'View all',
    viewProject: 'View project',
    categories : {
      ux       : 'UX Design',
      research : 'Research',
      product  : 'Product Design',
      brand    : 'Brand Experience',
    },
    impacts: {
      rodobens : 'How I transformed an old, slow, non-scalable legacy system dependent on external processes into a single, scalable, fast and intuitive platform for its 600+ users.',
      master   : 'Educational platform serving 120k students at Grupo Globo',
      lancome  : 'Beauty e-commerce with a 52% conversion uplift',
      ysl      : 'Digital brand experience for a global launch',
      nv8      : 'Full redesign of identity, architecture, and stack — from static HTML to Vue.js with a custom design system, shipped in 1 week with AI.',
    },
  },
  ES: {
    eyebrow    : 'Proyectos Seleccionados',
    heading    : ['casos que', 'hablan por sí solos'],
    allProjects: 'Ver todos',
    viewProject: 'Ver proyecto',
    categories : {
      ux       : 'UX Design',
      research : 'Research',
      product  : 'Product Design',
      brand    : 'Brand Experience',
    },
    impacts: {
      rodobens : 'Cómo transformé un sistema legado antiguo, lento, no escalable y dependiente de procesos externos en una plataforma única, escalable, rápida e intuitiva para sus más de 600 usuarios.',
      master   : 'Plataforma educativa para 120 mil alumnos de Grupo Globo',
      lancome  : 'E-commerce de belleza con +52% de conversión',
      ysl      : 'Experiencia de marca digital para lanzamiento global',
      nv8      : 'Rediseño completo de identidad, arquitectura y stack — de HTML estático a Vue.js con design system propio, entregado en 1 semana con IA.',
    },
  },
  DE: {
    eyebrow    : 'Ausgewählte Projekte',
    heading    : ['cases, die', 'für sich sprechen'],
    allProjects: 'Alle ansehen',
    viewProject: 'Projekt ansehen',
    categories : {
      ux       : 'UX Design',
      research : 'Research',
      product  : 'Product Design',
      brand    : 'Brand Experience',
    },
    impacts: {
      rodobens : 'Wie ich ein altes, langsames, nicht skalierbares Legacy-System, das von externen Prozessen abhängig war, in eine einheitliche, skalierbare, schnelle und intuitive Plattform für über 600 Nutzer verwandelt habe.',
      master   : 'Bildungsplattform für 120.000 Grupo-Globo-Studierende',
      lancome  : 'Beauty-E-Commerce mit 52 % mehr Conversions',
      ysl      : 'Digitales Markenerlebnis für globalen Launch',
      nv8      : 'Komplettes Redesign von Identität, Architektur und Stack — von statischem HTML zu Vue.js mit eigenem Design-System, in 1 Woche mit KI umgesetzt.',
    },
  },
}

const t = computed(() => copy[props.lang] ?? copy.PT)

// ── Visual placeholders (SVG mockups por projeto) ────────────────
const visualRodobens = `
  <svg viewBox="0 0 360 220" fill="none" xmlns="http://www.w3.org/2000/svg">
    <rect x="20" y="20" width="320" height="180" rx="8" fill="rgba(255,255,255,0.04)" stroke="rgba(255,255,255,0.08)" stroke-width="1"/>
    <rect x="36" y="36" width="120" height="8" rx="2" fill="rgba(255,255,255,0.12)"/>
    <rect x="36" y="52" width="80" height="6" rx="2" fill="rgba(255,255,255,0.06)"/>
    <rect x="36" y="80" width="288" height="1" fill="rgba(255,255,255,0.06)"/>
    <rect x="36" y="96" width="60" height="60" rx="4" fill="rgba(240,24,90,0.15)" stroke="rgba(240,24,90,0.3)" stroke-width="1"/>
    <text x="66" y="131" font-family="sans-serif" font-size="14" font-weight="700" fill="rgba(240,24,90,0.8)" text-anchor="middle">R$</text>
    <rect x="112" y="96" width="212" height="12" rx="2" fill="rgba(255,255,255,0.06)"/>
    <rect x="112" y="116" width="160" height="8" rx="2" fill="rgba(255,255,255,0.04)"/>
    <rect x="112" y="132" width="180" height="8" rx="2" fill="rgba(255,255,255,0.04)"/>
    <rect x="36" y="172" width="100" height="28" rx="2" fill="rgba(240,24,90,0.9)"/>
    <rect x="148" y="172" width="100" height="28" rx="2" fill="rgba(255,255,255,0.06)" stroke="rgba(255,255,255,0.1)" stroke-width="1"/>
    <!-- progress bar -->
    <rect x="36" y="158" width="288" height="4" rx="2" fill="rgba(255,255,255,0.05)"/>
    <rect x="36" y="158" width="180" height="4" rx="2" fill="rgba(240,24,90,0.6)"/>
  </svg>`

const visualMaster = `
  <svg viewBox="0 0 360 220" fill="none" xmlns="http://www.w3.org/2000/svg">
    <rect x="20" y="20" width="220" height="180" rx="6" fill="rgba(255,255,255,0.04)" stroke="rgba(255,255,255,0.07)" stroke-width="1"/>
    <rect x="36" y="36" width="90" height="7" rx="2" fill="rgba(255,255,255,0.1)"/>
    <rect x="36" y="52" width="60" height="5" rx="2" fill="rgba(255,255,255,0.05)"/>
    <!-- course cards -->
    <rect x="36" y="68" width="188" height="44" rx="4" fill="rgba(240,24,90,0.12)" stroke="rgba(240,24,90,0.2)" stroke-width="1"/>
    <rect x="48" y="78" width="80" height="6" rx="2" fill="rgba(255,255,255,0.15)"/>
    <rect x="48" y="90" width="55" height="5" rx="2" fill="rgba(255,255,255,0.06)"/>
    <rect x="36" y="120" width="188" height="44" rx="4" fill="rgba(255,255,255,0.04)" stroke="rgba(255,255,255,0.07)" stroke-width="1"/>
    <rect x="48" y="130" width="70" height="6" rx="2" fill="rgba(255,255,255,0.1)"/>
    <rect x="48" y="142" width="50" height="5" rx="2" fill="rgba(255,255,255,0.05)"/>
    <rect x="36" y="172" width="188" height="20" rx="2" fill="rgba(255,255,255,0.03)" stroke="rgba(255,255,255,0.06)" stroke-width="1"/>
    <!-- sidebar right -->
    <rect x="256" y="20" width="84" height="180" rx="6" fill="rgba(255,255,255,0.03)" stroke="rgba(255,255,255,0.06)" stroke-width="1"/>
    <circle cx="298" cy="60" r="20" fill="rgba(240,24,90,0.15)" stroke="rgba(240,24,90,0.25)" stroke-width="1"/>
    <text x="298" y="65" font-family="sans-serif" font-size="10" font-weight="700" fill="rgba(240,24,90,0.9)" text-anchor="middle">78%</text>
    <rect x="270" y="92" width="56" height="5" rx="2" fill="rgba(255,255,255,0.08)"/>
    <rect x="270" y="105" width="42" height="5" rx="2" fill="rgba(255,255,255,0.05)"/>
    <rect x="270" y="118" width="50" height="5" rx="2" fill="rgba(255,255,255,0.05)"/>
  </svg>`

const visualLancome = `
  <svg viewBox="0 0 360 220" fill="none" xmlns="http://www.w3.org/2000/svg">
    <!-- Product card hero -->
    <rect x="20" y="20" width="160" height="180" rx="4" fill="rgba(255,255,255,0.04)" stroke="rgba(255,255,255,0.07)" stroke-width="1"/>
    <!-- product image placeholder -->
    <rect x="36" y="36" width="128" height="100" rx="2" fill="rgba(240,24,90,0.07)"/>
    <ellipse cx="100" cy="86" rx="28" ry="36" fill="rgba(240,24,90,0.2)" stroke="rgba(240,24,90,0.4)" stroke-width="1"/>
    <rect x="36" y="148" width="90" height="6" rx="2" fill="rgba(255,255,255,0.12)"/>
    <rect x="36" y="162" width="60" height="5" rx="2" fill="rgba(255,255,255,0.06)"/>
    <rect x="36" y="176" width="50" height="16" rx="2" fill="rgba(240,24,90,0.9)"/>
    <!-- List -->
    <rect x="196" y="20" width="144" height="180" rx="4" fill="rgba(255,255,255,0.03)" stroke="rgba(255,255,255,0.06)" stroke-width="1"/>
    <rect x="208" y="36" width="80" height="6" rx="2" fill="rgba(255,255,255,0.1)"/>
    <rect x="208" y="52" width="120" height="30" rx="2" fill="rgba(255,255,255,0.04)" stroke="rgba(255,255,255,0.06)" stroke-width="1"/>
    <rect x="208" y="90" width="120" height="30" rx="2" fill="rgba(240,24,90,0.1)" stroke="rgba(240,24,90,0.2)" stroke-width="1"/>
    <rect x="208" y="128" width="120" height="30" rx="2" fill="rgba(255,255,255,0.04)" stroke="rgba(255,255,255,0.06)" stroke-width="1"/>
    <rect x="208" y="168" width="120" height="24" rx="2" fill="rgba(255,255,255,0.04)" stroke="rgba(255,255,255,0.06)" stroke-width="1"/>
  </svg>`

const visualYSL = `
  <svg viewBox="0 0 360 220" fill="none" xmlns="http://www.w3.org/2000/svg">
    <!-- Full bleed editorial -->
    <rect x="20" y="20" width="320" height="180" rx="4" fill="rgba(255,255,255,0.03)" stroke="rgba(255,255,255,0.06)" stroke-width="1"/>
    <!-- editorial image block -->
    <rect x="20" y="20" width="180" height="180" rx="4" fill="rgba(240,24,90,0.08)"/>
    <text x="110" y="115" font-family="serif" font-size="36" font-weight="700" fill="rgba(240,24,90,0.25)" text-anchor="middle">YSL</text>
    <!-- text side -->
    <rect x="216" y="44" width="100" height="8" rx="1" fill="rgba(255,255,255,0.1)"/>
    <rect x="216" y="60" width="80" height="6" rx="1" fill="rgba(255,255,255,0.06)"/>
    <rect x="216" y="76" width="112" height="1" fill="rgba(255,255,255,0.06)"/>
    <rect x="216" y="88" width="108" height="5" rx="1" fill="rgba(255,255,255,0.05)"/>
    <rect x="216" y="100" width="90" height="5" rx="1" fill="rgba(255,255,255,0.05)"/>
    <rect x="216" y="112" width="100" height="5" rx="1" fill="rgba(255,255,255,0.05)"/>
    <rect x="216" y="148" width="90" height="28" rx="0" fill="rgba(240,24,90,0.85)"/>
    <!-- nav dots -->
    <circle cx="236" cy="188" r="3" fill="rgba(240,24,90,0.9)"/>
    <circle cx="248" cy="188" r="2" fill="rgba(255,255,255,0.2)"/>
    <circle cx="258" cy="188" r="2" fill="rgba(255,255,255,0.2)"/>
  </svg>`

const visualNV8 = `
  <svg viewBox="0 0 360 220" fill="none" xmlns="http://www.w3.org/2000/svg">
    <!-- Browser frame -->
    <rect x="20" y="20" width="320" height="180" rx="6" fill="rgba(255,255,255,0.03)" stroke="rgba(255,255,255,0.07)" stroke-width="1"/>
    <!-- Browser bar -->
    <rect x="20" y="20" width="320" height="22" rx="6" fill="rgba(255,255,255,0.05)"/>
    <circle cx="36" cy="31" r="3" fill="rgba(255,80,80,0.5)"/>
    <circle cx="48" cy="31" r="3" fill="rgba(255,200,0,0.4)"/>
    <circle cx="60" cy="31" r="3" fill="rgba(0,200,80,0.4)"/>
    <rect x="90" y="26" width="160" height="10" rx="3" fill="rgba(255,255,255,0.06)"/>
    <!-- Hero area -->
    <rect x="36" y="52" width="140" height="10" rx="2" fill="rgba(12,191,253,0.6)"/>
    <rect x="36" y="70" width="200" height="7" rx="2" fill="rgba(255,255,255,0.1)"/>
    <rect x="36" y="84" width="160" height="7" rx="2" fill="rgba(255,255,255,0.06)"/>
    <rect x="36" y="104" width="80" height="22" rx="3" fill="rgba(12,191,253,0.85)"/>
    <!-- Grid texture -->
    <line x1="20" y1="44" x2="340" y2="44" stroke="rgba(12,191,253,0.08)" stroke-width="1"/>
    <line x1="20" y1="98" x2="340" y2="98" stroke="rgba(12,191,253,0.05)" stroke-width="1"/>
    <!-- Right visual block -->
    <rect x="220" y="48" width="104" height="140" rx="4" fill="rgba(12,191,253,0.06)" stroke="rgba(12,191,253,0.15)" stroke-width="1"/>
    <text x="272" y="125" font-family="monospace" font-size="18" font-weight="700" fill="rgba(12,191,253,0.4)" text-anchor="middle">NV8</text>
    <!-- Footer -->
    <text x="36" y="196" font-family="monospace" font-size="7" fill="rgba(12,191,253,0.25)" letter-spacing="2">UX · DESIGN SYSTEM · FRONTEND · AI-DRIVEN</text>
  </svg>`

// ── Projects data ────────────────────────────────────────────────
const projects = computed(() => {
  const l = props.lang
  return [
    {
      slug    : 'rodobens',
      client  : 'Credit & Leasing ERP system',
      year    : '2026',
      category: t.value.categories.product,
      title   : 'DISCOVERY, MAPPING AND PRODUCT',
      desc    : ({ PT: "Modernização de um ERP legado para um dos maiores conglomerados financeiros do Brasil — reconstruindo 75 anos de fluxo de crédito em um produto escalável e navegável.", EN: "Modernization of a legacy ERP for one of Brazil's largest finantial conglomerates - rebuilding 75 years of credit workflow into a scalable, navigable product.", ES: 'Modernización de un ERP heredado para uno de los mayores conglomerados financieros de Brasil — reconstruyendo 75 años de flujo de crédito en un producto escalable y navegable.', DE: 'Modernisierung eines Legacy-ERP für eines der größten Finanzkonglomerate Brasiliens — 75 Jahre Kreditworkflow in ein skalierbares, navigierbares Produkt umgebaut.' })[l] || '',
      tags    : ['Product Design', 'Design System', 'B2B · Fintech'],
      bg      : 'linear-gradient(135deg, #0c0b1e 0%, #16122e 100%)',
      visual  : visualRodobens,
      image   : rodobensCover,
      featured: true,
    },
    {
      slug    : 'master-globo',
      client  : 'Master Globo',
      year    : '2025',
      category: t.value.categories.ux,
      title   : ({ PT: 'UX Research para lançamento de produto', EN: 'UX research to product launch', ES: 'UX Research al lanzamiento de producto', DE: 'UX Research zum Produktlaunch' })[l] || 'UX research to product launch',
      desc    : ({ PT: 'Pesquisa quantitativa e qualitativa e dashboard usando a base de dados da plataforma educacional para o lançamento de um novo formato de produto.', EN: "Quantitative and qualitative research and dashboard using the educational platform's database for the launch of a new product format.", ES: 'Investigación cuantitativa y cualitativa y dashboard usando la base de datos de la plataforma educativa para el lanzamiento de un nuevo formato de producto.', DE: 'Quantitative und qualitative Forschung sowie Dashboard mit der Datenbank der Bildungsplattform für den Launch eines neuen Produktformats.' })[l] || '',
      tags    : ['UX Research', 'Media & Broadcast', 'B2B'],
      bg      : 'linear-gradient(135deg, #0a0a18 0%, #121224 100%)',
      visual  : visualMaster,
      image   : masterCover,
      featured: false,
    },
    {
      slug    : 'lancome-brazil',
      client  : 'Lancôme Brazil',
      year    : '2023',
      category: t.value.categories.ux,
      title   : ({ PT: 'Experiência Sensorial Lancôme', EN: "Lancôme's Sensorial Experience", ES: 'Experiencia Sensorial Lancôme', DE: 'Lancôme Sensorisches Erlebnis' })[l] || "Lancôme's Sensorial Experience",
      desc    : ({ PT: 'Exposição sensorial imersiva e exclusiva em São Paulo celebrando a história da Lancôme por meio de perfume, joias, moda, som e alta gastronomia — projetada para engajar os cinco sentidos.', EN: 'An immersive, invitation-only sensorial exhibition in São Paulo celebrating the history of Lancôme through perfume, jewelry, fashion, sound, and haute cuisine — designed to engage all five human senses.', ES: 'Una exposición sensorial inmersiva y exclusiva en São Paulo que celebra la historia de Lancôme a través del perfume, las joyas, la moda, el sonido y la alta gastronomía.', DE: 'Eine immersive, exklusive Sinnesausstellung in São Paulo zur Geschichte von Lancôme — durch Parfum, Schmuck, Mode, Klang und Haute Cuisine.' })[l] || '',
      tags    : ['Beauty', 'Brand Experience', 'Exhibition'],
      bg      : 'linear-gradient(135deg, #110810 0%, #1a0d18 100%)',
      visual  : visualLancome,
      image   : lancomeCover,
      featured: false,
    },
    {
      slug    : 'yves-saint-laurent',
      client  : 'Yves Saint Laurent',
      year    : '2023',
      category: t.value.categories.brand,
      title   : ({ PT: 'Experiência Digital YSL', EN: 'YSL Digital Experience', ES: 'Experiencia Digital YSL', DE: 'YSL Digitale Erfahrung' })[l] || 'YSL Digital Experience',
      desc    : ({ PT: "Criação de uma experiência digital à altura para uma das marcas mais icônicas do mundo. Onde o rock'n'roll encontra o luxo.", EN: "Crafting a digital experience worthy of one of the world's most iconic brands — where rock'n'roll meets luxury.", ES: "Creación de una experiencia digital a la altura de una de las marcas más icónicas del mundo. Donde el rock'n'roll se encuentra con el lujo.", DE: "Gestaltung eines digitalen Erlebnisses für eine der ikonischsten Marken der Welt — wo Rock'n'Roll auf Luxus trifft." })[l] || '',
      tags    : ['Luxury', 'E-commerce', 'Brand Experience'],
      bg      : 'linear-gradient(135deg, #0d0d0d 0%, #1a1010 100%)',
      visual  : visualYSL,
      image   : yslCover,
      featured: false,
    },
    {
      slug    : 'nv8',
      client  : 'NV8',
      year    : '2025',
      category: t.value.categories.ux,
      title   : ({ PT: 'Redesign do Website', EN: 'Website Redesign', ES: 'Rediseño del Website', DE: 'Website Redesign' })[l] || 'Website Redesign',
      desc    : ({ PT: 'Construindo a presença digital de uma software house brasileira do zero — sombria, cinematográfica, maximalista. Um design system, estratégia de motion e site completo para falar com devs e decisores.', EN: 'Building the digital presence of a Brazilian software house from the ground up — dark, cinematic, maximalist. A design system, motion strategy, and full website built to speak to developers and decision-makers alike.', ES: 'Construyendo la presencia digital de una software house brasileña desde cero — oscura, cinematográfica, maximalista. Un design system, estrategia de motion y sitio completo.', DE: 'Aufbau der digitalen Präsenz eines brasilianischen Software-Hauses von Grund auf — dunkel, cinematisch, maximalistisch. Design System, Motion-Strategie und vollständige Website.' })[l] || '',
      tags    : ['Web Design', 'Design System', 'Motion'],
      bg      : 'linear-gradient(135deg, #050d18 0%, #0a1a2e 100%)',
      visual  : visualNV8,
      image   : nv8Cover,
      featured: false,
    },
  ]
})

const featured  = computed(() => projects.value.find(p => p.featured))
const secondary = computed(() => projects.value.filter(p => !p.featured))
</script>

<style scoped>
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500&display=swap');

:root {
  --accent      : #F0185A;
  --accent-glow : rgba(240,24,90,.12);
  --accent-soft : rgba(240,24,90,.4);
  --font-display: 'Clash Display', sans-serif;
  --font-body   : 'DM Sans', sans-serif;
  --ease-expo   : cubic-bezier(.16,1,.3,1);
}
.theme-dark {
  --bg          : #070711;
  --fg          : #F0EFF8;
  --fg-muted    : #6B6A82;
  --fg-faint    : #22213A;
  --border      : rgba(255,255,255,.07);
  --ghost-border: rgba(255,255,255,.11);
  --btn-fill    : #070711;
  --grain-opacity: .04;
}
.theme-light {
  --bg          : #F5F3FF;
  --fg          : #0D0C1A;
  --fg-muted    : #62607A;
  --fg-faint    : #D2CFEA;
  --border      : rgba(0,0,0,.08);
  --ghost-border: rgba(13,12,26,.12);
  --btn-fill    : #F5F3FF;
  --grain-opacity: .025;
}

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
a { color: inherit; text-decoration: none; }

/* ── Root ── */
.projects-root {
  background  : var(--bg);
  color       : var(--fg);
  font-family : var(--font-body);
  position    : relative;
  overflow-x  : hidden;
  transition  : background .5s ease, color .5s ease;
}
.pf-grain {
  position         : absolute;
  inset            : 0;
  z-index          : 1;
  pointer-events   : none;
  opacity          : var(--grain-opacity);
  background-image : url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");
  background-size  : 180px 180px;
}

/* ── Layout ── */
.projects-wrap {
  position  : relative;
  z-index   : 2;
  padding   : 5rem 1.5rem;
}

/* ── Eyebrow ── */
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

/* ── Header row (heading + CTA) ── */
.projects-header {
  display         : flex;
  align-items     : flex-end;
  justify-content : space-between;
  gap             : 2rem;
  margin-bottom   : 1.75rem;
  animation       : pf-up .85s var(--ease-expo) both;
  animation-delay : .1s;
}
.projects-heading {
  font-family    : var(--font-display);
  font-weight    : 600;
  font-size      : clamp(2rem, 7vw, 4.5rem);
  line-height    : .92;
  letter-spacing : -.025em;
  color          : var(--fg);
}
.projects-heading em { font-style: italic; color: var(--accent); }

.projects-all-link {
  flex-shrink    : 0;
  display        : none; /* shown at 640px+ */
}

/* ── pf-rule ── */
.pf-rule {
  width        : 100%;
  height       : 1px;
  background   : linear-gradient(90deg, rgba(240,24,90,.55) 0%, transparent 65%);
  margin-bottom: 3rem;
  animation    : pf-up .85s var(--ease-expo) both;
  animation-delay: .2s;
}

/* ── Ghost button (same as DS) ── */
.pf-btn {
  position        : relative;
  display         : inline-flex;
  align-items     : center;
  justify-content : center;
  height          : 44px;
  padding         : 0 1.5rem;
  overflow        : hidden;
  outline         : none;
  transition      : transform .15s ease;
  border-radius   : 0;
  min-width       : 140px;
}
.pf-btn:active { transform: scale(.97); }
.pf-ring {
  position    : absolute;
  inset       : -100%;
  animation   : pf-spin-ring 3s linear infinite;
  opacity     : 0;
  transition  : opacity .4s ease;
  pointer-events: none;
}
.pf-btn:hover .pf-ring { opacity: 1; }
.pf-veil {
  position       : absolute;
  inset          : 0;
  transition     : opacity .4s ease;
  pointer-events : none;
}
.pf-btn:hover .pf-veil { opacity: 0; }
.pf-core {
  position       : absolute;
  inset          : 1px;
  z-index        : 1;
  pointer-events : none;
}
.pf-btn-lbl {
  position       : relative;
  z-index        : 2;
  font-size      : .6rem;
  font-weight    : 500;
  letter-spacing : .14em;
  text-transform : uppercase;
  transition     : color .2s;
}
.pf-arr {
  display    : inline-block;
  transition : transform .2s ease;
}
.pf-btn:hover .pf-arr { transform: translateX(4px); }
.pf-btn--ghost .pf-ring  { background: conic-gradient(from 90deg at 50% 50%, transparent 0%, transparent 75%, var(--accent) 100%); }
.pf-btn--ghost .pf-veil  { background: var(--ghost-border); }
.pf-btn--ghost .pf-core  { background: var(--btn-fill); }
.pf-btn--ghost .pf-btn-lbl { color: var(--fg); }

/* ── Grid layout ── */
.projects-grid {
  display               : grid;
  grid-template-columns : 1fr;
  gap                   : 1px;
  background            : var(--border);
  border                : 1px solid var(--border);
  animation             : pf-up .9s var(--ease-expo) both;
  animation-delay       : .25s;
}

/* ── Card base ── */
.card {
  position        : relative;
  display         : flex;
  flex-direction  : column;
  background      : var(--bg);
  overflow        : hidden;
  cursor          : pointer;
  transition      : background .3s ease;
  text-decoration : none;
  color           : inherit;
}
.card:focus-visible { outline: 2px solid var(--accent); outline-offset: -2px; }

/* Corner accent (top-right) */
.card-corner {
  position         : absolute;
  top              : 0;
  right            : 0;
  width            : 0;
  height           : 0;
  border-style     : solid;
  border-width     : 0 28px 28px 0;
  border-color     : transparent var(--accent) transparent transparent;
  opacity          : 0;
  transition       : opacity .3s ease;
}
.card:hover .card-corner { opacity: 1; }

/* ── Image area ── */
.card-img-wrap {
  position : relative;
  overflow : hidden;
  flex-shrink: 0;
}
.card-img {
  width      : 100%;
  display    : flex;
  align-items: center;
  justify-content: center;
  transition : transform .6s var(--ease-expo);
}
.card:hover .card-img { transform: scale(1.03); }

.card-img-photo {
  width      : 100%;
  height     : 100%;
  object-fit : cover;
  display    : block;
}
.card-img-inner {
  width    : 100%;
  padding  : 1rem;
}
.card-img-inner :deep(svg) {
  width   : 100%;
  height  : auto;
  display : block;
}

/* Gradient overlay at bottom of image */
.card-img-overlay {
  position   : absolute;
  inset      : 0;
  background : linear-gradient(to bottom, transparent 50%, rgba(7,7,17,.85) 100%);
  pointer-events: none;
}
.theme-light .card-img-overlay {
  background: linear-gradient(to bottom, transparent 50%, rgba(245,243,255,.85) 100%);
}

/* Accent glow on hover */
.card::before {
  content        : '';
  position       : absolute;
  inset          : 0;
  background     : var(--accent-glow);
  opacity        : 0;
  transition     : opacity .35s ease;
  pointer-events : none;
  z-index        : 1;
}
.card:hover::before { opacity: 1; }

/* Bottom accent line */
.card::after {
  content          : '';
  position         : absolute;
  bottom           : 0; left: 0; right: 0;
  height           : 2px;
  background       : var(--accent);
  transform        : scaleX(0);
  transform-origin : left;
  transition       : transform .4s var(--ease-expo);
  z-index          : 2;
}
.card:hover::after { transform: scaleX(1); }

/* ── Card body ── */
.card-body {
  position : relative;
  z-index  : 2;
  padding  : 1.5rem;
  display  : flex;
  flex-direction: column;
  gap      : .6rem;
  flex     : 1;
}

.card-meta {
  display    : flex;
  align-items: center;
  gap        : .75rem;
}
.card-tag {
  font-size      : .52rem;
  font-weight    : 500;
  letter-spacing : .14em;
  text-transform : uppercase;
  color          : var(--accent);
  border         : 1px solid rgba(240,24,90,.25);
  padding        : .2rem .55rem;
}

.card-client {
  font-family    : var(--font-display);
  font-weight    : 600;
  line-height    : 1.1;
  letter-spacing : -.01em;
  color          : var(--fg);
  transition     : color .2s;
}
.card:hover .card-client { color: var(--fg); }

.card-year {
  font-size      : .52rem;
  font-weight    : 500;
  letter-spacing : .1em;
  color          : var(--fg-muted);
  opacity        : .6;
}

.card-case-title {
  font-size   : .7rem;
  font-weight : 500;
  letter-spacing: .08em;
  text-transform: uppercase;
  color       : var(--accent);
  margin-bottom: .1rem;
}

.card-desc {
  font-size   : .95rem;
  font-weight : 300;
  line-height : 1.7;
  color       : var(--fg-muted);
}

.card-tags {
  display   : flex;
  flex-wrap : wrap;
  gap       : .35rem;
}

.card-tag-item {
  font-size      : .5rem;
  font-weight    : 500;
  letter-spacing : .1em;
  text-transform : uppercase;
  color          : var(--fg-muted);
  border         : 1px solid var(--ghost-border);
  padding        : .2rem .55rem;
  border-radius  : 2px;
  opacity        : .7;
}

.card-cta {
  display        : flex;
  align-items    : center;
  gap            : .5rem;
  margin-top     : auto;
  padding-top    : .75rem;
  border-top     : 1px solid var(--border);
  font-size      : .55rem;
  font-weight    : 500;
  letter-spacing : .14em;
  text-transform : uppercase;
  color          : var(--fg-muted);
  transition     : color .2s;
}
.card:hover .card-cta { color: var(--accent); }
.card-cta-arr {
  display    : inline-block;
  transition : transform .2s ease;
}
.card:hover .card-cta-arr { transform: translateX(4px); }

/* ── Featured card specifics ── */
.card--featured .card-img { height: 280px; }
.card--featured .card-client { font-size: clamp(1.4rem, 4vw, 2rem); }
.card--featured .card-desc   { font-size: 1.025rem; max-width: 52ch; }

/* ── Small card specifics ── */
.card--small {
  animation      : pf-up .9s var(--ease-expo) both;
  animation-delay: var(--delay, .3s);
}
.card--small .card-img  { height: 180px; }
.card--small .card-client { font-size: clamp(1rem, 3vw, 1.3rem); }

/* ── Responsive ── */
@media (min-width: 640px) {
  .projects-wrap { padding: var(--sp-24) 3rem; }
  .projects-all-link { display: inline-flex; }
  .card--featured .card-img { height: 340px; }
}

@media (min-width: 768px) {
  .projects-grid {
    grid-template-columns : 1fr 1fr;
    grid-template-rows    : auto auto;
  }
  .card--featured {
    grid-column : 1 / 2;
    grid-row    : 1 / 3;
  }
  .card--small .card-img { height: 160px; }
}

@media (min-width: 1024px) {
  .projects-wrap { padding: var(--sp-24) 7rem; }
  .card--featured .card-img { height: 420px; }
  .card--small .card-img    { height: 180px; }
}

@media (min-width: 1400px) {
  .projects-wrap { padding: var(--sp-24) 10rem; }
}

/* ── Keyframes ── */
@keyframes pf-up {
  from { opacity: 0; transform: translateY(24px); filter: blur(8px); }
  to   { opacity: 1; transform: translateY(0);    filter: blur(0); }
}
@keyframes pf-spin-ring {
  to { transform: rotate(360deg); }
}
@keyframes pf-pulse {
  0%, 100% { opacity: 1;  transform: scale(1);   }
  50%      { opacity: .3; transform: scale(.75); }
}
</style>
