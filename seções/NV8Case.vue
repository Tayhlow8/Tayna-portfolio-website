<template>
  <div :class="['nv-root', `theme-${theme}`]">
    <div class="nv-grain" aria-hidden="true" />

    <NavBar v-model:lang="lang" v-model:theme="theme" />

    <!-- BACK -->
    <button class="nv-back" @click="$router.push('/projetos')">← {{ t.back }}</button>

    <!-- HERO -->
    <section class="nv-hero">
      <div class="nv-hero-inner">
        <div class="nv-hero-left">
          <div class="nv-eyebrow">
            <span class="nv-pulse" aria-hidden="true" />
            {{ t.tag }}
          </div>
          <h1 class="nv-title" v-html="t.title" />
          <p class="nv-subtitle">{{ t.subtitle }}</p>
          <p class="nv-accent">{{ t.accentLine }}</p>
          <div class="nv-roles">
            <span v-for="r in t.roles" :key="r" class="nv-role">{{ r }}</span>
          </div>
        </div>
        <div class="nv-hero-right">
          <div class="nv-stats-grid">
            <div class="nv-stat"><b class="nv-sn" style="color:#F0185A">1</b><span class="nv-sl">{{ t.stats.week }}</span></div>
            <div class="nv-stat"><b class="nv-sn" style="color:#0CBFFD">6</b><span class="nv-sl">{{ t.stats.products }}</span></div>
            <div class="nv-stat"><b class="nv-sn" style="color:#0CFDB5">Vue</b><span class="nv-sl">{{ t.stats.stack }}</span></div>
            <div class="nv-stat"><b class="nv-sn" style="color:#F0185A">AI</b><span class="nv-sl">{{ t.stats.method }}</span></div>
          </div>
          <div class="nv-browser-frame">
            <div class="nv-browser-bar">
              <span class="nv-bd nv-bd--r" /><span class="nv-bd nv-bd--y" /><span class="nv-bd nv-bd--g" />
              <span class="nv-burl">nv8-website.vercel.app</span>
            </div>
            <img :src="coverImg" alt="NV8 Website — new version" class="nv-browser-img" loading="eager" />
          </div>
        </div>
      </div>
    </section>

    <!-- 01 BEFORE / AFTER -->
    <section class="nv-section">
      <div class="nv-rule"><span class="nv-rule-label">01 — {{ t.baLabel }}</span><span class="nv-rule-line" /></div>
      <h2 class="nv-sh" v-html="t.baTitle" />
      <p class="nv-sd">{{ t.baDesc }}</p>
      <div class="nv-ba-grid">
        <figure class="nv-ba-fig">
          <div class="nv-ba-badge nv-ba-badge--before">{{ t.baBefore }}</div>
          <img :src="oldImg" alt="NV8 old website" class="nv-ba-img" loading="lazy" />
          <figcaption class="nv-ba-cap">{{ t.baOldCap }}</figcaption>
        </figure>
        <figure class="nv-ba-fig">
          <div class="nv-ba-badge nv-ba-badge--after">{{ t.baAfter }}</div>
          <img :src="coverImg" alt="NV8 new website" class="nv-ba-img" loading="lazy" />
          <figcaption class="nv-ba-cap">{{ t.baNewCap }}</figcaption>
        </figure>
      </div>
    </section>

    <!-- 02 CHALLENGES -->
    <section class="nv-section">
      <div class="nv-rule"><span class="nv-rule-label">02 — {{ t.challengesLabel }}</span><span class="nv-rule-line" /></div>
      <h2 class="nv-sh" v-html="t.challengesTitle" />
      <p class="nv-sd">{{ t.challengesDesc }}</p>
      <div class="nv-challenges-grid">
        <div v-for="c in t.challenges" :key="c.num" class="nv-challenge">
          <span class="nv-challenge-num">{{ c.num }}</span>
          <h3 class="nv-challenge-title">{{ c.title }}</h3>
          <p class="nv-challenge-text">{{ c.text }}</p>
        </div>
      </div>
    </section>

    <!-- 03 DESIGN DECISIONS -->
    <section class="nv-section">
      <div class="nv-rule"><span class="nv-rule-label">03 — {{ t.decisionsLabel }}</span><span class="nv-rule-line" /></div>
      <h2 class="nv-sh" v-html="t.decisionsTitle" />
      <p class="nv-sd">{{ t.decisionsDesc }}</p>

      <img :src="websiteImg" alt="NV8 website — design decisions" class="nv-decisions-img" loading="lazy" />

      <div class="nv-decisions">
        <div v-for="d in t.decisions" :key="d.tag" class="nv-decision">
          <div class="nv-decision-left">
            <span class="nv-decision-tag">{{ d.tag }}</span>
            <h3 class="nv-decision-title">{{ d.title }}</h3>
          </div>
          <p class="nv-decision-result" v-html="d.result" />
        </div>
      </div>
    </section>

    <!-- 04 PROCESS -->
    <section class="nv-section">
      <div class="nv-rule"><span class="nv-rule-label">04 — {{ t.timelineLabel }}</span><span class="nv-rule-line" /></div>
      <h2 class="nv-sh" v-html="t.timelineTitle" />
      <p class="nv-sd">{{ t.timelineDesc }}</p>
      <div class="nv-timeline">
        <div v-for="(item, i) in t.timeline" :key="i" class="nv-tl-item">
          <div class="nv-tl-day">{{ item.day }}</div>
          <div class="nv-tl-content">
            <h3 class="nv-tl-title">{{ item.title }}</h3>
            <p class="nv-tl-text">{{ item.text }}</p>
            <div class="nv-chips">
              <span v-for="chip in item.chips" :key="chip" class="nv-chip">{{ chip }}</span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 05 RESULTS -->
    <section class="nv-section">
      <div class="nv-rule"><span class="nv-rule-label">05 — {{ t.resultsLabel }}</span><span class="nv-rule-line" /></div>
      <h2 class="nv-sh" v-html="t.resultsTitle" />
      <div class="nv-results-grid">
        <div v-for="r in t.results" :key="r.num" class="nv-result">
          <b class="nv-result-num" :style="{ color: r.color || 'var(--accent)' }">{{ r.num }}</b>
          <h3 class="nv-result-label">{{ r.label }}</h3>
          <p class="nv-result-desc">{{ r.desc }}</p>
        </div>
      </div>
      <blockquote class="nv-quote">{{ t.resultsQuote }}</blockquote>
    </section>

    <!-- 06 LEARNINGS -->
    <section class="nv-section">
      <div class="nv-rule"><span class="nv-rule-label">06 — {{ t.learningsLabel }}</span><span class="nv-rule-line" /></div>
      <h2 class="nv-sh" v-html="t.learningsTitle" />
      <div class="nv-learnings-grid">
        <div v-for="l in t.learnings" :key="l.title" class="nv-learning">
          <h3 class="nv-learning-title">{{ l.title }}</h3>
          <p class="nv-learning-text">{{ l.text }}</p>
        </div>
      </div>
    </section>

    <!-- FOOTER -->
    <footer class="nv-footer">
      <button class="nv-footer-back" @click="$router.push('/projetos')">← {{ t.back }}</button>
      <span class="nv-footer-tag">{{ t.footerTag }}</span>
    </footer>

  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import NavBar from './NavBar.vue'
import coverImg   from '../clientes/nv8 case cover.png'
import oldImg     from '../clientes/nv8 antigo.png'
import websiteImg from '../clientes/nv8 website case.png'

const props = defineProps({
  lang:  { type: String, default: 'EN' },
  theme: { type: String, default: 'dark' },
})

const lang  = ref(props.lang)
const theme = ref(props.theme)

const copy = {
  PT: {
    back: 'Voltar ao portfólio',
    tag: 'UX/UI · Design System · Frontend · 2025',
    title: 'Redesign que<br><em>virou produto.</em>',
    subtitle: 'Reformulação completa da identidade visual, arquitetura de informação e stack técnica do site da NV8 — inteiramente conduzida com IA e Claude Code em 1 semana.',
    accentLine: 'De HTML estático e identidade genérica a Vue.js com design system próprio, 6 produtos com páginas dedicadas e UI interativa',
    roles: ['UX/UI Design', 'Design System', 'Frontend', 'AI-Driven'],
    stats: { week: 'semana de entrega', products: 'produtos destacados', stack: 'stack modernizada', method: 'AI-driven' },
    baLabel: 'Antes & Depois',
    baTitle: 'De institucional genérico<br><em>a presença de mercado.</em>',
    baDesc: 'O site antigo comunicava serviços de forma flat e sem hierarquia. O novo posiciona a NV8 como empresa de tecnologia premium — portfólio de produtos próprios, linguagem autoritária e motion design que não pesa.',
    baBefore: 'ANTES', baAfter: 'DEPOIS',
    baOldCap: 'Site antigo — HTML estático, sem hierarquia visual',
    baNewCap: 'NV8 2026 — Vue.js, design system, UI interativa',
    challengesLabel: 'Desafios',
    challengesTitle: 'O que estava freando<br><em>a NV8 no digital.</em>',
    challengesDesc: 'Quatro problemas estruturais que o redesign precisava resolver simultaneamente — sem perder o histórico de clientes e sem downtime.',
    challenges: [
      { num: '01', title: 'Identidade sem diferenciação', text: 'O site anterior usava estética corporativa genérica — ícones stock, paleta azul padrão, tipografia sem personalidade. Empresas concorrentes eram visualmente idênticas.' },
      { num: '02', title: 'Portfólio invisível', text: 'Soluções proprietárias como Wallet Passes e WhatsApp API não tinham presença. O site listava parceiros (Salesforce, Zendesk) mais do que os próprios produtos da NV8.' },
      { num: '03', title: 'Stack engessada', text: 'HTML estático dificultava atualizações, não suportava i18n e impossibilitava animações performáticas. Cada mudança exigia intervenção técnica.' },
      { num: '04', title: 'Linguagem sem autoridade', text: 'Copywriting genérico ("parceiro estratégico", "transformação digital") não transmitia especialização técnica nem posicionamento premium no mercado B2B.' },
    ],
    decisionsLabel: 'Decisões de Design',
    decisionsTitle: 'Por que cada escolha<br><em>importou.</em>',
    decisionsDesc: 'Cada decisão foi orientada por posicionamento de mercado, não apenas por estética.',
    decisions: [
      { tag: 'IDENTIDADE', title: 'Dark mode maximalista com Blue Sky + grid', result: 'Fundo escuro comunica robustez técnica e sofisticação — referência de Vercel e Linear. O <em>Blue Sky #0CBFFD</em> como acento cria contraste forte. A textura de grid reforça o universo de software sem ser literal.' },
      { tag: 'TIPOGRAFIA', title: 'Unbounded + Geist como par tipográfico', result: '<em>Unbounded</em> para headings: geométrica, wide, sem concessões — transmite que a NV8 ocupa espaço. <em>Geist</em> para corpo: legibilidade técnica com associação ao universo dev. Combinação incomum no B2B brasileiro.' },
      { tag: 'ARQUITETURA', title: 'Produtos próprios à frente, parceiros depois', result: 'Hierarquia invertida: <em>Wallet Passes, WhatsApp API, Software Factory</em> ganham seções com UI interativa antes dos logos de parceiros. Posiciona a NV8 como empresa de produto.' },
      { tag: 'MOTION', title: 'Animações que demonstram, não decoram', result: 'Cada animação é uma demonstração: o code editor no hero da Software Factory mostra o produto em uso. O boarding pass da seção Wallet Passes <em>é</em> o produto. <em>Motion como argumento de venda.</em>' },
      { tag: 'STACK', title: 'Vue.js + Design Tokens via Tokens Studio', result: 'Migração para <em>Vue.js</em> deu componentização real. Tokens (Blue Sky, Acid Blue, Teal, Mustard) sincronizados via JSON — ajustes de tema sem retrabalho de código.' },
    ],
    timelineLabel: 'Processo em 1 Semana',
    timelineTitle: '7 dias.<br><em>Site completo no ar.</em>',
    timelineDesc: 'Usando Claude Code como parceiro de desenvolvimento, o ciclo design → código foi comprimido radicalmente.',
    timeline: [
      { day: 'Dia 1–2', title: 'Discovery + Design System', text: 'Análise competitiva, posicionamento, criação dos tokens de design e configuração do Tokens Studio sincronizado ao GitHub.', chips: ['FigJam sitemap', 'Token Studio JSON', 'Paleta NV8', 'Tipografia'] },
      { day: 'Dia 3', title: 'Wireframes + Copywriting', text: 'Homepage wireframed no Figma. Redação de todo o conteúdo em inglês com posicionamento técnico-premium. Estrutura com hierarquia de produtos.', chips: ['Homepage wireframe', 'Copy EN', 'IA copy review'] },
      { day: 'Dia 4–5', title: 'Desenvolvimento Vue.js + Componentes', text: 'Claude Code implementando componentes a partir dos wireframes. Hero com code editor animado, seções com UI interativa, timeline com scroll-reveal.', chips: ['Vue 3 SFC', 'Claude Code', 'CSS animations', 'i18n'] },
      { day: 'Dia 6', title: 'Páginas de Serviços + Motion', text: 'Páginas dedicadas para Software Factory, UX/UI Design, Wallet Passes, WhatsApp API, Dedicated Teams — cada uma com UI mockup animado.', chips: ['Wallet Passes UI', 'Squad diagram', 'Tech layer viz'] },
      { day: 'Dia 7', title: 'QA + Deploy', text: 'Revisão de responsividade, performance, acessibilidade e SEO. Deploy em produção antes do prazo.', chips: ['Mobile QA', 'Performance', 'Deploy', '✓ No ar'] },
    ],
    resultsLabel: 'Resultados',
    resultsTitle: 'O que <em>mudou.</em>',
    results: [
      { num: '1 sem', label: 'Site completo', desc: 'Da concepção ao deploy — design system, desenvolvimento e conteúdo em 7 dias com IA como parceira de execução.', color: '#F0185A' },
      { num: '6', label: 'Produtos destacados', desc: 'Software Factory, CRM, Dedicated Teams, UX/UI Design, WhatsApp API e Wallet Passes — cada um com página e UI demonstrativa.', color: '#0CBFFD' },
      { num: 'Vue', label: 'Stack modernizada', desc: 'Migração de HTML estático para Vue.js com componentes reutilizáveis, design tokens e suporte nativo a i18n.', color: '#0CFDB5' },
    ],
    resultsQuote: 'Este projeto provou que IA e design system não são atalhos — são multiplicadores. O trabalho estratégico ficou mais humano, não menos.',
    learningsLabel: 'Aprendizados',
    learningsTitle: 'O que esse projeto<br><em>provou.</em>',
    learnings: [
      { title: 'IA comprime ciclos sem cortar qualidade', text: 'Claude Code permitiu ir de wireframe para componente Vue funcional em horas. O papel humano ficou no que importa: direção criativa e decisões estratégicas.' },
      { title: 'Design System primeiro é investimento', text: 'Os 2 dias gastos em tokens e tipografia se pagaram em velocidade de desenvolvimento. Consistência visual surgiu naturalmente — sem revisões de estilo.' },
      { title: 'Motion como argumento, não decoração', text: 'Cada animação no site novo é uma demonstração do produto. O boarding pass no hover da seção Wallet Passes vende o serviço sem uma linha de texto extra.' },
    ],
    footerTag: 'NV8 Tecnologia · 2026',
  },
  EN: {
    back: 'Back to portfolio',
    tag: 'UX/UI · Design System · Frontend · 2025',
    title: 'Redesign that<br><em>became product.</em>',
    subtitle: 'Complete overhaul of NV8\'s visual identity, information architecture, and tech stack — entirely AI-assisted and shipped in 1 week.',
    accentLine: 'From static HTML and generic identity to Vue.js with a proprietary design system, 6 products with dedicated pages and interactive UI',
    roles: ['UX/UI Design', 'Design System', 'Frontend', 'AI-Driven'],
    stats: { week: 'week delivery', products: 'products showcased', stack: 'modernized stack', method: 'AI-driven' },
    baLabel: 'Before & After',
    baTitle: 'From generic institutional<br><em>to market presence.</em>',
    baDesc: 'The old site communicated services flat and without hierarchy. The new one positions NV8 as a premium tech company — proprietary product portfolio, authoritative language, and performant motion design.',
    baBefore: 'BEFORE', baAfter: 'AFTER',
    baOldCap: 'Old site — static HTML, no visual hierarchy',
    baNewCap: 'NV8 2026 — Vue.js, design system, interactive UI',
    challengesLabel: 'Challenges',
    challengesTitle: 'What was holding<br><em>NV8 back online.</em>',
    challengesDesc: 'Four structural problems the redesign needed to solve simultaneously — without losing client history and without downtime.',
    challenges: [
      { num: '01', title: 'Identity without differentiation', text: 'The previous site used generic corporate aesthetics — stock icons, standard blue palette, characterless typography. Competing companies were visually identical.' },
      { num: '02', title: 'Invisible product portfolio', text: 'Proprietary solutions like Wallet Passes and WhatsApp API had no presence. The site listed partners (Salesforce, Zendesk) more than NV8\'s own products.' },
      { num: '03', title: 'Rigid tech stack', text: 'Static HTML made updates difficult, didn\'t support i18n, and made performant animations impossible. Every change required technical intervention.' },
      { num: '04', title: 'Language without authority', text: 'Generic copywriting ("strategic partner", "digital transformation") conveyed neither technical expertise nor a premium B2B market positioning.' },
    ],
    decisionsLabel: 'Design Decisions',
    decisionsTitle: 'Why each choice<br><em>mattered.</em>',
    decisionsDesc: 'Every decision was guided by market positioning, not just aesthetics.',
    decisions: [
      { tag: 'IDENTITY', title: 'Maximalist dark mode with Blue Sky + grid', result: 'Dark background communicates technical robustness — visual reference from Vercel and Linear. <em>Blue Sky #0CBFFD</em> as accent creates strong contrast. The grid texture reinforces the software universe without being literal.' },
      { tag: 'TYPOGRAPHY', title: 'Unbounded + Geist as typographic pair', result: '<em>Unbounded</em> for headings: geometric, wide, uncompromising — signals NV8 owns space. <em>Geist</em> for body: technical readability with dev-world association. An unusual combination in Brazilian B2B.' },
      { tag: 'ARCHITECTURE', title: 'Own products first, partners after', result: 'Information hierarchy inverted: <em>Wallet Passes, WhatsApp API, Software Factory</em> get dedicated sections with interactive UI before partner logos. Positions NV8 as a product company.' },
      { tag: 'MOTION', title: 'Animations that demonstrate, not decorate', result: 'Every animation demonstrates the service: the code editor in the Software Factory hero shows the product in use. The boarding pass in Wallet Passes <em>is</em> the product. <em>Motion as a sales argument.</em>' },
      { tag: 'STACK', title: 'Vue.js + Design Tokens via Tokens Studio', result: 'Migration to <em>Vue.js</em> enabled real componentization. Token system (Blue Sky, Acid Blue, Teal, Mustard) synchronized via JSON — theme adjustments without code rework.' },
    ],
    timelineLabel: 'Process in 1 Week',
    timelineTitle: '7 days.<br><em>Full site shipped.</em>',
    timelineDesc: 'Using Claude Code as a development partner, the design → code cycle was radically compressed.',
    timeline: [
      { day: 'Day 1–2', title: 'Discovery + Design System', text: 'Competitive analysis, positioning definition, design token creation, and Tokens Studio configuration synced to GitHub.', chips: ['FigJam sitemap', 'Token Studio JSON', 'NV8 palette', 'Typography'] },
      { day: 'Day 3', title: 'Wireframes + Copywriting', text: 'Homepage wireframed in Figma. All content written in English with technical-premium positioning. Section structure defined with product hierarchy.', chips: ['Homepage wireframe', 'Copy EN', 'AI copy review'] },
      { day: 'Day 4–5', title: 'Vue.js Development + Components', text: 'Claude Code implementing components from wireframes. Hero with animated code editor, service sections with interactive UI, scroll-reveal timeline.', chips: ['Vue 3 SFC', 'Claude Code', 'CSS animations', 'i18n'] },
      { day: 'Day 6', title: 'Service Pages + Motion', text: 'Dedicated pages for Software Factory, UX/UI Design, Wallet Passes, WhatsApp API, Dedicated Teams — each with animated UI mockup.', chips: ['Wallet Passes UI', 'Squad diagram', 'Tech layer viz'] },
      { day: 'Day 7', title: 'QA + Deploy', text: 'Responsiveness, performance, accessibility, and SEO review. Production deploy. Site live before deadline.', chips: ['Mobile QA', 'Performance', 'Deploy', '✓ Live'] },
    ],
    resultsLabel: 'Results',
    resultsTitle: 'What <em>changed.</em>',
    results: [
      { num: '1 wk', label: 'Full site delivered', desc: 'From concept to production deploy — design system, development, and content in 7 days with AI as execution partner.', color: '#F0185A' },
      { num: '6', label: 'Products showcased', desc: 'Software Factory, CRM, Dedicated Teams, UX/UI Design, WhatsApp API, and Wallet Passes — each with dedicated page and demo UI.', color: '#0CBFFD' },
      { num: 'Vue', label: 'Stack modernized', desc: 'Migration from static HTML to Vue.js with reusable components, synchronized design tokens, and native i18n support.', color: '#0CFDB5' },
    ],
    resultsQuote: 'This project proved that AI and design systems aren\'t shortcuts — they\'re multipliers. The strategic work became more human, not less.',
    learningsLabel: 'Learnings',
    learningsTitle: 'What this project<br><em>proved.</em>',
    learnings: [
      { title: 'AI compresses cycles without cutting quality', text: 'Claude Code allowed going from wireframe to functional Vue component in hours. The human role stayed on what matters: creative direction and strategic decisions.' },
      { title: 'Design System first is investment, not overhead', text: 'The 2 days spent on tokens and typography paid off in development speed. Visual consistency emerged naturally — no style revisions needed.' },
      { title: 'Motion as argument, not decoration', text: 'Every animation on the new site is a product demonstration. The boarding pass on hover in the Wallet Passes section sells the service without a single extra line of copy.' },
    ],
    footerTag: 'NV8 Technology · 2026',
  },
  ES: {
    back: 'Volver al portafolio',
    tag: 'UX/UI · Design System · Frontend · 2025',
    title: 'Rediseño que<br><em>se volvió producto.</em>',
    subtitle: 'Reformulación completa de la identidad visual, arquitectura de información y stack técnica del sitio de NV8 — íntegramente con IA y Claude Code en 1 semana.',
    accentLine: 'De HTML estático e identidad genérica a Vue.js con design system propio, 6 productos con páginas dedicadas y UI interactiva',
    roles: ['UX/UI Design', 'Design System', 'Frontend', 'AI-Driven'],
    stats: { week: 'semana de entrega', products: 'productos destacados', stack: 'stack modernizada', method: 'AI-driven' },
    baLabel: 'Antes & Después',
    baTitle: 'De institucional genérico<br><em>a presencia de mercado.</em>',
    baDesc: 'El sitio anterior comunicaba servicios de forma plana y sin jerarquía. El nuevo posiciona a NV8 como empresa de tecnología premium — portafolio de productos propios, lenguaje autoritario y motion design de alto rendimiento.',
    baBefore: 'ANTES', baAfter: 'DESPUÉS',
    baOldCap: 'Sitio antiguo — HTML estático, sin jerarquía visual',
    baNewCap: 'NV8 2026 — Vue.js, design system, UI interactiva',
    challengesLabel: 'Desafíos',
    challengesTitle: 'Lo que frenaba<br><em>a NV8 en digital.</em>',
    challengesDesc: 'Cuatro problemas estructurales que el rediseño debía resolver simultáneamente — sin perder historial de clientes y sin tiempo de inactividad.',
    challenges: [
      { num: '01', title: 'Identidad sin diferenciación', text: 'El sitio anterior usaba estética corporativa genérica — iconos stock, paleta azul estándar, tipografía sin personalidad. Las empresas competidoras eran visualmente idénticas.' },
      { num: '02', title: 'Portafolio invisible', text: 'Soluciones propietarias como Wallet Passes y WhatsApp API no tenían presencia. El sitio listaba socios (Salesforce, Zendesk) más que los propios productos de NV8.' },
      { num: '03', title: 'Stack rígida', text: 'El HTML estático dificultaba las actualizaciones, no soportaba i18n e imposibilitaba animaciones performáticas. Cada cambio requería intervención técnica.' },
      { num: '04', title: 'Lenguaje sin autoridad', text: 'El copywriting genérico ("socio estratégico", "transformación digital") no transmitía especialización técnica ni posicionamiento premium en el mercado B2B.' },
    ],
    decisionsLabel: 'Decisiones de Diseño',
    decisionsTitle: 'Por qué cada elección<br><em>importó.</em>',
    decisionsDesc: 'Cada decisión estuvo guiada por el posicionamiento de mercado, no solo por la estética.',
    decisions: [
      { tag: 'IDENTIDAD', title: 'Dark mode maximalista con Blue Sky + grid', result: 'Fondo oscuro comunica robustez técnica — referencia de Vercel y Linear. <em>Blue Sky #0CBFFD</em> como acento crea contraste fuerte. La textura de grid refuerza el universo del software.' },
      { tag: 'TIPOGRAFÍA', title: 'Unbounded + Geist como par tipográfico', result: '<em>Unbounded</em> para headings: geométrica, wide, sin concesiones — transmite que NV8 ocupa espacio. <em>Geist</em> para cuerpo: legibilidad técnica con asociación al universo dev. Combinación inusual en el B2B latinoamericano.' },
      { tag: 'ARQUITECTURA', title: 'Productos propios primero, socios después', result: 'Jerarquía invertida: <em>Wallet Passes, WhatsApp API, Software Factory</em> obtienen secciones con UI interactiva antes de logos de socios. Posiciona a NV8 como empresa de producto.' },
      { tag: 'MOTION', title: 'Animaciones que demuestran, no decoran', result: 'Cada animación es una demostración: el code editor en el hero de Software Factory muestra el producto en uso. El boarding pass de Wallet Passes <em>es</em> el producto. <em>Motion como argumento de venta.</em>' },
      { tag: 'STACK', title: 'Vue.js + Design Tokens via Tokens Studio', result: 'Migración a <em>Vue.js</em> dio componentización real. Tokens (Blue Sky, Acid Blue, Teal, Mustard) sincronizados via JSON — ajustes de tema sin retrabajar código.' },
    ],
    timelineLabel: 'Proceso en 1 Semana',
    timelineTitle: '7 días.<br><em>Sitio completo en vivo.</em>',
    timelineDesc: 'Usando Claude Code como socio de desarrollo, el ciclo diseño → código fue comprimido radicalmente.',
    timeline: [
      { day: 'Día 1–2', title: 'Discovery + Design System', text: 'Análisis competitivo, definición de posicionamiento, creación de tokens de diseño y configuración del Tokens Studio sincronizado a GitHub.', chips: ['FigJam sitemap', 'Token Studio JSON', 'Paleta NV8', 'Tipografía'] },
      { day: 'Día 3', title: 'Wireframes + Copywriting', text: 'Homepage wireframed en Figma. Redacción de contenido en inglés con posicionamiento técnico-premium. Estructura definida con jerarquía de productos.', chips: ['Homepage wireframe', 'Copy EN', 'AI copy review'] },
      { day: 'Día 4–5', title: 'Desarrollo Vue.js + Componentes', text: 'Claude Code implementando componentes desde wireframes. Hero con code editor animado, secciones con UI interactiva, timeline con scroll-reveal.', chips: ['Vue 3 SFC', 'Claude Code', 'CSS animations', 'i18n'] },
      { day: 'Día 6', title: 'Páginas de Servicios + Motion', text: 'Páginas dedicadas para Software Factory, UX/UI Design, Wallet Passes, WhatsApp API, Dedicated Teams — cada una con UI mockup animado.', chips: ['Wallet Passes UI', 'Squad diagram', 'Tech layer viz'] },
      { day: 'Día 7', title: 'QA + Deploy', text: 'Revisión de responsividad, performance, accesibilidad y SEO. Deploy en producción antes del plazo.', chips: ['Mobile QA', 'Performance', 'Deploy', '✓ En vivo'] },
    ],
    resultsLabel: 'Resultados',
    resultsTitle: 'Lo que <em>cambió.</em>',
    results: [
      { num: '1 sem', label: 'Sitio completo', desc: 'De la concepción al deploy — design system, desarrollo y contenido en 7 días con IA como socia de ejecución.', color: '#F0185A' },
      { num: '6', label: 'Productos destacados', desc: 'Software Factory, CRM, Dedicated Teams, UX/UI Design, WhatsApp API y Wallet Passes — cada uno con página y UI demostrativa.', color: '#0CBFFD' },
      { num: 'Vue', label: 'Stack modernizada', desc: 'Migración de HTML estático a Vue.js con componentes reutilizables, design tokens y soporte nativo de i18n.', color: '#0CFDB5' },
    ],
    resultsQuote: 'Este proyecto demostró que la IA y los design systems no son atajos — son multiplicadores. El trabajo estratégico se volvió más humano, no menos.',
    learningsLabel: 'Aprendizajes',
    learningsTitle: 'Lo que este proyecto<br><em>demostró.</em>',
    learnings: [
      { title: 'La IA comprime ciclos sin perder calidad', text: 'Claude Code permitió pasar de wireframe a componente Vue funcional en horas. El rol humano se mantuvo en lo que importa: dirección creativa y decisiones estratégicas.' },
      { title: 'Design System primero es inversión, no sobrecarga', text: 'Los 2 días en tokens y tipografía se amortizaron en velocidad de desarrollo. La consistencia visual surgió naturalmente — sin revisiones de estilo.' },
      { title: 'Motion como argumento, no decoración', text: 'Cada animación es una demostración del producto. El boarding pass al hover en la sección Wallet Passes vende el servicio sin una línea extra de texto.' },
    ],
    footerTag: 'NV8 Tecnología · 2026',
  },
  DE: {
    back: 'Zurück zum Portfolio',
    tag: 'UX/UI · Design System · Frontend · 2025',
    title: 'Redesign, das zum<br><em>Produkt wurde.</em>',
    subtitle: 'Vollständige Überarbeitung von NV8s visueller Identität, Informationsarchitektur und Tech-Stack — vollständig KI-gestützt und in 1 Woche ausgeliefert.',
    accentLine: 'Von statischem HTML und generischer Identität zu Vue.js mit eigenem Design System, 6 Produkten mit dedizierten Seiten und interaktiver UI',
    roles: ['UX/UI Design', 'Design System', 'Frontend', 'AI-Driven'],
    stats: { week: 'Woche Lieferzeit', products: 'vorgestellte Produkte', stack: 'modernisierter Stack', method: 'KI-gesteuert' },
    baLabel: 'Vorher & Nachher',
    baTitle: 'Von generisch institutionell<br><em>zur Marktpräsenz.</em>',
    baDesc: 'Die alte Website kommunizierte Dienstleistungen flach und ohne Hierarchie. Die neue positioniert NV8 als Premium-Tech-Unternehmen — proprietäres Produktportfolio, autoritäre Sprache und performantes Motion Design.',
    baBefore: 'VORHER', baAfter: 'NACHHER',
    baOldCap: 'Alte Website — statisches HTML, keine visuelle Hierarchie',
    baNewCap: 'NV8 2026 — Vue.js, Design System, interaktive UI',
    challengesLabel: 'Herausforderungen',
    challengesTitle: 'Was NV8 online<br><em>gebremst hat.</em>',
    challengesDesc: 'Vier strukturelle Probleme, die das Redesign gleichzeitig lösen musste — ohne Kundenhistorie zu verlieren und ohne Ausfallzeiten.',
    challenges: [
      { num: '01', title: 'Identität ohne Differenzierung', text: 'Die alte Website verwendete generische Corporate-Ästhetik — Stock-Icons, Standard-Blaupalette, persönlichkeitslose Typografie. Wettbewerber sahen visuell identisch aus.' },
      { num: '02', title: 'Unsichtbares Produktportfolio', text: 'Proprietäre Lösungen wie Wallet Passes und WhatsApp API hatten keine Präsenz. Die Website listete Partner (Salesforce, Zendesk) mehr als NV8s eigene Produkte.' },
      { num: '03', title: 'Starrer Tech-Stack', text: 'Statisches HTML erschwerte Updates, unterstützte kein i18n und machte performante Animationen unmöglich. Jede Änderung erforderte technische Intervention.' },
      { num: '04', title: 'Sprache ohne Autorität', text: 'Generisches Copywriting ("strategischer Partner", "digitale Transformation") vermittelte weder technische Expertise noch Premium-B2B-Positionierung.' },
    ],
    decisionsLabel: 'Design-Entscheidungen',
    decisionsTitle: 'Warum jede Wahl<br><em>zählte.</em>',
    decisionsDesc: 'Jede Entscheidung wurde von Marktpositionierung geleitet, nicht nur von Ästhetik.',
    decisions: [
      { tag: 'IDENTITÄT', title: 'Maximalistischer Dark Mode mit Blue Sky + Grid', result: 'Dunkler Hintergrund kommuniziert technische Robustheit — Referenz von Vercel und Linear. <em>Blue Sky #0CBFFD</em> als Akzent schafft starken Kontrast. Die Grid-Textur verstärkt das Software-Universum.' },
      { tag: 'TYPOGRAFIE', title: 'Unbounded + Geist als typografisches Paar', result: '<em>Unbounded</em> für Überschriften: geometrisch, breit, kompromisslos — NV8 nimmt Raum ein. <em>Geist</em> für Fließtext: technische Lesbarkeit mit Dev-Assoziation. Ungewöhnliche Kombination im B2B-Markt.' },
      { tag: 'ARCHITEKTUR', title: 'Eigene Produkte zuerst, Partner danach', result: 'Informationshierarchie umgekehrt: <em>Wallet Passes, WhatsApp API, Software Factory</em> erhalten Sektionen mit interaktiver UI vor Partner-Logos. NV8 als Produktunternehmen positioniert.' },
      { tag: 'MOTION', title: 'Animationen, die demonstrieren, nicht dekorieren', result: 'Jede Animation demonstriert den Service: der Code-Editor im Software Factory Hero zeigt das Produkt im Einsatz. Der Boarding Pass in Wallet Passes <em>ist</em> das Produkt. <em>Motion als Verkaufsargument.</em>' },
      { tag: 'STACK', title: 'Vue.js + Design Tokens via Tokens Studio', result: 'Migration zu <em>Vue.js</em> ermöglichte echte Komponentisierung. Token-System (Blue Sky, Acid Blue, Teal, Mustard) via JSON synchronisiert — Theme-Anpassungen ohne Code-Überarbeitung.' },
    ],
    timelineLabel: 'Prozess in 1 Woche',
    timelineTitle: '7 Tage.<br><em>Vollständige Website online.</em>',
    timelineDesc: 'Mit Claude Code als Entwicklungspartner wurde der Design → Code Zyklus radikal komprimiert.',
    timeline: [
      { day: 'Tag 1–2', title: 'Discovery + Design System', text: 'Wettbewerbsanalyse, Positionierung, Design-Token-Erstellung und Tokens Studio-Konfiguration synchronisiert mit GitHub.', chips: ['FigJam sitemap', 'Token Studio JSON', 'NV8-Palette', 'Typografie'] },
      { day: 'Tag 3', title: 'Wireframes + Copywriting', text: 'Homepage in Figma wireframed. Alle Inhalte auf Englisch mit technisch-premiumem Positionierung. Sektionsstruktur mit Produkthierarchie definiert.', chips: ['Homepage wireframe', 'Copy EN', 'KI Copy Review'] },
      { day: 'Tag 4–5', title: 'Vue.js-Entwicklung + Komponenten', text: 'Claude Code implementiert Komponenten aus Wireframes. Hero mit animiertem Code-Editor, Service-Sektionen mit interaktiver UI, Scroll-Reveal-Timeline.', chips: ['Vue 3 SFC', 'Claude Code', 'CSS animations', 'i18n'] },
      { day: 'Tag 6', title: 'Service-Seiten + Motion', text: 'Dedizierte Seiten für Software Factory, UX/UI Design, Wallet Passes, WhatsApp API, Dedicated Teams — jede mit animiertem UI-Mockup.', chips: ['Wallet Passes UI', 'Squad diagram', 'Tech layer viz'] },
      { day: 'Tag 7', title: 'QA + Deploy', text: 'Überprüfung von Responsivität, Performance, Barrierefreiheit und SEO. Produktions-Deploy vor Ablauf der Frist.', chips: ['Mobile QA', 'Performance', 'Deploy', '✓ Online'] },
    ],
    resultsLabel: 'Ergebnisse',
    resultsTitle: 'Was sich <em>verändert hat.</em>',
    results: [
      { num: '1 W.', label: 'Vollständige Website', desc: 'Von der Konzeption zum Deploy — Design System, Entwicklung und Inhalte in 7 Tagen mit KI als Ausführungspartnerin.', color: '#F0185A' },
      { num: '6', label: 'Produkte präsentiert', desc: 'Software Factory, CRM, Dedicated Teams, UX/UI Design, WhatsApp API und Wallet Passes — jedes mit eigener Seite und Demo-UI.', color: '#0CBFFD' },
      { num: 'Vue', label: 'Stack modernisiert', desc: 'Migration von statischem HTML zu Vue.js mit wiederverwendbaren Komponenten, synchronisierten Design-Tokens und nativem i18n.', color: '#0CFDB5' },
    ],
    resultsQuote: 'Dieses Projekt bewies, dass KI und Design Systems keine Abkürzungen sind — sie sind Multiplikatoren. Die strategische Arbeit wurde menschlicher, nicht weniger.',
    learningsLabel: 'Erkenntnisse',
    learningsTitle: 'Was dieses Projekt<br><em>bewiesen hat.</em>',
    learnings: [
      { title: 'KI komprimiert Zyklen ohne Qualitätsverlust', text: 'Claude Code ermöglichte es, in Stunden statt Tagen vom Wireframe zur Vue-Komponente zu gelangen. Die menschliche Rolle blieb auf das Wesentliche: kreative Leitung und strategische Entscheidungen.' },
      { title: 'Design System zuerst ist Investition, nicht Overhead', text: 'Die 2 Tage für Tokens und Typografie amortisierten sich in Entwicklungsgeschwindigkeit. Visuelle Konsistenz entstand natürlich — ohne Stil-Revisionen.' },
      { title: 'Motion als Argument, nicht Dekoration', text: 'Jede Animation ist eine Produktdemonstration. Der Boarding Pass beim Hover in der Wallet Passes-Sektion verkauft den Service ohne eine zusätzliche Textzeile.' },
    ],
    footerTag: 'NV8 Technologie · 2026',
  },
}

const t = computed(() => copy[lang.value] ?? copy.EN)
</script>

<style scoped>
/* ── Root ── */
.nv-root {
  background: var(--bg);
  color: var(--fg);
  font-family: var(--font-body);
  min-height: 100svh;
  position: relative;
  overflow-x: hidden;
}

.nv-grain {
  position: fixed; inset: 0; z-index: 0; pointer-events: none;
  opacity: var(--grain-opacity, .04);
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");
  background-size: 180px 180px;
}

/* ── Back button ── */
.nv-back {
  position: fixed; top: 72px; left: 1.25rem; z-index: 100;
  font-family: var(--font-body); font-size: .58rem; font-weight: 500;
  letter-spacing: .13em; text-transform: uppercase;
  color: var(--fg-muted); background: none; border: none; cursor: pointer;
  padding: .35rem .6rem;
  border: 1px solid var(--ghost-border);
  transition: color .2s, border-color .2s;
}
.nv-back:hover { color: var(--accent); border-color: rgba(240,24,90,.4); }

/* ── Hero ── */
.nv-hero {
  padding: 5rem 1.25rem 3rem;
  position: relative; z-index: 1;
}
.nv-hero-inner {
  max-width: 1100px; margin: 0 auto;
  display: flex; flex-direction: column; gap: 3rem;
}
.nv-hero-left { display: flex; flex-direction: column; gap: 1.25rem; }

.nv-eyebrow {
  display: flex; align-items: center; gap: .5rem;
  font-size: .6rem; font-weight: 500; letter-spacing: .16em;
  text-transform: uppercase; color: var(--fg-muted);
}
.nv-pulse {
  width: 6px; height: 6px; border-radius: 50%;
  background: var(--accent); flex-shrink: 0;
  animation: nv-pulse 2.5s ease-in-out infinite;
}

.nv-title {
  font-family: var(--font-display);
  font-size: clamp(2.8rem, 9vw, 6rem);
  font-weight: 700; line-height: .92; letter-spacing: -.03em;
}
.nv-title :deep(em) { font-style: italic; color: var(--accent); }

.nv-subtitle {
  font-size: clamp(.9rem, 2vw, 1.05rem); font-weight: 300;
  line-height: 1.75; color: var(--fg-muted); max-width: 52ch;
}

.nv-accent {
  font-size: clamp(.8rem, 1.6vw, .95rem); font-weight: 400;
  line-height: 1.6; color: var(--fg);
  border-left: 2px solid var(--accent);
  padding-left: 1rem; margin-top: .25rem;
}

.nv-roles { display: flex; flex-wrap: wrap; gap: .5rem; }
.nv-role {
  font-size: .55rem; font-weight: 500; letter-spacing: .12em;
  text-transform: uppercase; color: var(--fg-muted);
  border: 1px solid var(--ghost-border); padding: .35rem .75rem;
}

/* Stats grid */
.nv-stats-grid {
  display: grid; grid-template-columns: 1fr 1fr; gap: 1px;
  background: var(--ghost-border); border: 1px solid var(--ghost-border);
  margin-bottom: 1.5rem;
}
.nv-stat {
  background: var(--bg); padding: 1.25rem 1rem;
  display: flex; flex-direction: column; gap: .35rem;
}
.nv-sn { font-family: var(--font-display); font-size: 1.8rem; font-weight: 700; line-height: 1; }
.nv-sl { font-size: .5rem; font-weight: 500; letter-spacing: .12em; text-transform: uppercase; color: var(--fg-muted); }

/* Browser frame */
.nv-browser-frame {
  border: 1px solid var(--ghost-border);
  border-radius: 10px; overflow: hidden;
}
.nv-browser-bar {
  display: flex; align-items: center; gap: 5px;
  background: var(--fg-faint); padding: 8px 12px;
}
.nv-bd { width: 10px; height: 10px; border-radius: 50%; flex-shrink: 0; }
.nv-bd--r { background: #FF5F57; }
.nv-bd--y { background: #FEBC2E; }
.nv-bd--g { background: #28C840; }
.nv-burl {
  font-size: .6rem; letter-spacing: .06em; color: var(--fg-muted);
  margin-left: .5rem; font-family: var(--font-body);
}
.nv-browser-img { width: 100%; display: block; }

/* ── Sections ── */
.nv-section {
  padding: 3.5rem 1.25rem;
  max-width: 1100px; margin: 0 auto;
  position: relative; z-index: 1;
  border-top: 1px solid var(--border);
}

.nv-rule {
  display: flex; align-items: center; gap: 1rem; margin-bottom: 1.75rem;
}
.nv-rule-label {
  font-size: .58rem; font-weight: 500; letter-spacing: .16em;
  text-transform: uppercase; color: var(--accent); white-space: nowrap;
}
.nv-rule-line {
  flex: 1; height: 1px;
  background: linear-gradient(90deg, rgba(240,24,90,.4) 0%, transparent 70%);
}

.nv-sh {
  font-family: var(--font-display);
  font-size: clamp(1.6rem, 4vw, 2.8rem);
  font-weight: 600; line-height: 1.1; letter-spacing: -.02em;
  margin-bottom: 1rem;
}
.nv-sh :deep(em) { font-style: italic; color: var(--accent); }

.nv-sd {
  font-size: clamp(.85rem, 2vw, 1rem); font-weight: 300;
  line-height: 1.8; color: var(--fg-muted);
  max-width: 58ch; margin-bottom: 2.5rem;
}

/* ── Before / After ── */
.nv-ba-grid {
  display: grid; grid-template-columns: 1fr; gap: 1.25rem;
}
.nv-ba-fig { margin: 0; display: flex; flex-direction: column; gap: .75rem; position: relative; }
.nv-ba-badge {
  position: absolute; top: .75rem; left: .75rem; z-index: 2;
  font-size: .5rem; font-weight: 600; letter-spacing: .14em;
  padding: .3rem .65rem;
}
.nv-ba-badge--before { background: var(--fg-faint); color: var(--fg-muted); }
.nv-ba-badge--after  { background: var(--accent);   color: #fff; }
.nv-ba-img {
  width: 100%; aspect-ratio: 16/9; object-fit: cover; object-position: top left;
  border-radius: 8px; border: 1px solid var(--ghost-border); display: block;
}
.nv-ba-cap {
  font-size: .72rem; font-weight: 400; letter-spacing: .05em;
  color: var(--fg-muted); text-align: center;
}

/* ── Challenges ── */
.nv-challenges-grid {
  display: grid; grid-template-columns: 1fr; gap: 1px;
  background: var(--ghost-border); border: 1px solid var(--ghost-border);
}
.nv-challenge {
  background: var(--bg); padding: 1.5rem;
  display: flex; flex-direction: column; gap: .75rem;
  transition: background .2s;
}
.nv-challenge:hover { background: var(--fg-faint); }
.nv-challenge-num {
  font-family: var(--font-display); font-size: .6rem; font-weight: 700;
  color: var(--accent); letter-spacing: .1em;
}
.nv-challenge-title {
  font-family: var(--font-display); font-size: 1rem; font-weight: 600;
  line-height: 1.25; color: var(--fg);
}
.nv-challenge-text { font-size: .85rem; font-weight: 300; line-height: 1.7; color: var(--fg-muted); }

/* ── Decisions image ── */
.nv-decisions-img {
  width: 100%; display: block; border-radius: 10px;
  border: 1px solid var(--ghost-border);
  margin-bottom: 2.5rem;
}

/* ── Decisions ── */
.nv-decisions { display: flex; flex-direction: column; gap: 0; }
.nv-decision {
  display: flex; flex-direction: column; gap: .75rem;
  padding: 1.5rem 0; border-bottom: 1px solid var(--border);
}
.nv-decision:last-child { border-bottom: none; }
.nv-decision-left { display: flex; flex-direction: column; gap: .4rem; }
.nv-decision-tag {
  font-size: .5rem; font-weight: 600; letter-spacing: .18em;
  color: var(--accent); text-transform: uppercase;
}
.nv-decision-title {
  font-family: var(--font-display); font-size: 1.05rem; font-weight: 600;
  line-height: 1.2; color: var(--fg);
}
.nv-decision-result {
  font-size: .875rem; font-weight: 300; line-height: 1.75; color: var(--fg-muted);
}
.nv-decision-result :deep(em) { font-style: normal; color: var(--fg); font-weight: 500; }

/* ── Timeline ── */
.nv-timeline { display: flex; flex-direction: column; gap: 0; }
.nv-tl-item {
  display: flex; flex-direction: column; gap: .75rem;
  padding: 1.5rem 0; border-bottom: 1px solid var(--border);
}
.nv-tl-item:last-child { border-bottom: none; }
.nv-tl-day {
  font-size: .58rem; font-weight: 600; letter-spacing: .15em;
  text-transform: uppercase; color: var(--accent);
}
.nv-tl-content { display: flex; flex-direction: column; gap: .5rem; }
.nv-tl-title { font-family: var(--font-display); font-size: 1rem; font-weight: 600; color: var(--fg); }
.nv-tl-text { font-size: .875rem; font-weight: 300; line-height: 1.7; color: var(--fg-muted); }
.nv-chips { display: flex; flex-wrap: wrap; gap: .4rem; margin-top: .25rem; }
.nv-chip {
  font-size: .5rem; font-weight: 500; letter-spacing: .1em; text-transform: uppercase;
  padding: .3rem .65rem; border: 1px solid var(--ghost-border); color: var(--fg-muted);
}

/* ── Results ── */
.nv-results-grid {
  display: grid; grid-template-columns: 1fr; gap: 1px;
  background: var(--ghost-border); border: 1px solid var(--ghost-border);
  margin-bottom: 2rem;
}
.nv-result {
  background: var(--bg); padding: 2rem 1.5rem;
  display: flex; flex-direction: column; gap: .5rem;
}
.nv-result-num { font-family: var(--font-display); font-size: 2.5rem; font-weight: 700; line-height: 1; }
.nv-result-label { font-family: var(--font-display); font-size: .9rem; font-weight: 600; color: var(--fg); }
.nv-result-desc { font-size: .8rem; font-weight: 300; line-height: 1.65; color: var(--fg-muted); }

.nv-quote {
  font-size: clamp(.95rem, 2vw, 1.1rem); font-weight: 300; line-height: 1.75;
  color: var(--fg); border-left: 2px solid var(--accent); padding-left: 1.25rem;
  font-style: italic; margin: 0;
}

/* ── Learnings ── */
.nv-learnings-grid { display: grid; grid-template-columns: 1fr; gap: 1.25rem; }
.nv-learning {
  padding: 1.5rem; border: 1px solid var(--ghost-border);
  display: flex; flex-direction: column; gap: .75rem;
  transition: border-color .25s;
}
.nv-learning:hover { border-color: rgba(240,24,90,.35); }
.nv-learning-title { font-family: var(--font-display); font-size: .95rem; font-weight: 600; color: var(--fg); line-height: 1.3; }
.nv-learning-text { font-size: .85rem; font-weight: 300; line-height: 1.7; color: var(--fg-muted); }

/* ── Footer ── */
.nv-footer {
  padding: 2rem 1.25rem;
  border-top: 1px solid var(--border);
  max-width: 1100px; margin: 0 auto;
  display: flex; align-items: center; justify-content: space-between; gap: 1rem;
  flex-wrap: wrap; position: relative; z-index: 1;
}
.nv-footer-back {
  font-family: var(--font-body); font-size: .58rem; font-weight: 500;
  letter-spacing: .13em; text-transform: uppercase;
  color: var(--fg-muted); background: none;
  border: 1px solid var(--ghost-border); cursor: pointer;
  padding: .5rem 1rem; transition: color .2s, border-color .2s;
}
.nv-footer-back:hover { color: var(--accent); border-color: rgba(240,24,90,.4); }
.nv-footer-tag {
  font-size: .55rem; font-weight: 500; letter-spacing: .14em;
  text-transform: uppercase; color: var(--fg-muted);
}

/* ── Animations ── */
@keyframes nv-pulse {
  0%, 100% { opacity: 1; transform: scale(1); }
  50%       { opacity: .3; transform: scale(.75); }
}

/* ── Responsive: 640px ── */
@media (min-width: 640px) {
  .nv-hero     { padding: 6rem 3rem 4rem; }
  .nv-back     { left: 3rem; }
  .nv-section  { padding: 4.5rem 3rem; }
  .nv-ba-grid  { grid-template-columns: 1fr 1fr; gap: 1.5rem; }
  .nv-challenges-grid { grid-template-columns: 1fr 1fr; }
  .nv-results-grid    { grid-template-columns: repeat(3, 1fr); }
  .nv-learnings-grid  { grid-template-columns: repeat(3, 1fr); }
  .nv-footer   { padding: 2.5rem 3rem; }
}

/* ── Responsive: 1024px ── */
@media (min-width: 1024px) {
  .nv-hero    { padding: 7rem 7rem 5rem; }
  .nv-back    { left: 7rem; }
  .nv-section { padding: 6rem 7rem; }
  .nv-hero-inner { flex-direction: row; align-items: flex-start; gap: 5rem; }
  .nv-hero-left  { flex: 1; }
  .nv-hero-right { flex: 0 0 420px; }
  .nv-decision { flex-direction: row; gap: 2rem; }
  .nv-decision-left { flex: 0 0 220px; }
  .nv-tl-item   { flex-direction: row; gap: 2.5rem; }
  .nv-tl-day    { flex: 0 0 90px; padding-top: .15rem; }
  .nv-footer    { padding: 2.5rem 7rem; }
}

/* ── Responsive: 1400px ── */
@media (min-width: 1400px) {
  .nv-hero    { padding: 8rem 10rem 5rem; }
  .nv-back    { left: 10rem; }
  .nv-section { padding: 7rem 10rem; }
  .nv-footer  { padding: 3rem 10rem; }
}
</style>
