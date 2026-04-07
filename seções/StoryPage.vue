<template>
  <div :class="['sp-root', `theme-${theme}`]">
    <div class="sp-grain" aria-hidden="true"></div>

    <!-- ── Back link ─────────────────────────────────── -->
    <button class="sp-back" @click="goBack">
      <svg width="12" height="12" viewBox="0 0 24 24" fill="none"
        stroke="currentColor" stroke-width="2"
        stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
        <path d="M19 12H5M12 5l-7 7 7 7"/>
      </svg>
      {{ t.back }}
    </button>

    <div class="sp-layout">

    <!-- ── Hero da página ─────────────────────────────── -->
    <header class="sp-hero">
      <div class="sp-eyebrow">
        <span class="sp-dot" aria-hidden="true"></span>
        {{ t.eyebrow }}
      </div>
      <h1 class="sp-title" v-html="t.title"></h1>
      <p class="sp-lead">{{ t.lead }}</p>
    </header>

    <div class="sp-right">

    <!-- ── Timeline ──────────────────────────────────── -->
    <ol class="sp-timeline" aria-label="Timeline de carreira">

      <li
        v-for="(chapter, i) in t.chapters"
        :key="i"
        :class="['sp-chapter', { 'sp-chapter--visible': visible[i] }]"
        :ref="el => setRef(el, i)"
      >
        <!-- Linha vertical + nó -->
        <div class="sp-node-col" aria-hidden="true">
          <div class="sp-node">
            <span class="sp-node-dot"></span>
            <span class="sp-node-ring"></span>
          </div>
          <span class="sp-vline"></span>
        </div>

        <!-- Conteúdo do capítulo -->
        <div class="sp-content">

          <!-- Ano / período -->
          <span class="sp-period">{{ chapter.period }}</span>

          <!-- Título do capítulo -->
          <h2 class="sp-ch-title" v-html="chapter.title"></h2>

          <!-- Subtítulo / empresa -->
          <span v-if="chapter.company" class="sp-company">
            {{ chapter.company }}
          </span>

          <!-- Texto narrativo -->
          <div class="sp-text">
            <p v-for="(para, pi) in chapter.paras" :key="pi" v-html="para"></p>
          </div>

          <!-- Highlights (conquistas / números) -->
          <div v-if="chapter.highlights" class="sp-highlights">
            <div
              v-for="h in chapter.highlights"
              :key="h.label"
              class="sp-highlight"
            >
              <b class="sp-hl-num">{{ h.num }}</b>
              <span class="sp-hl-label">{{ h.label }}</span>
            </div>
          </div>

          <!-- Tags de skills usadas nessa fase -->
          <div v-if="chapter.tags" class="sp-tags">
            <span v-for="tag in chapter.tags" :key="tag" class="sp-tag">
              {{ tag }}
            </span>
          </div>

        </div>
      </li>

    </ol>

    <!-- ── CTA final ──────────────────────────────────── -->
    <div class="sp-cta-wrap">
      <p class="sp-cta-label" v-html="t.ctaLabel"></p>
      <PfButton
        variant="solid"
        :href="`mailto:tayna.schultz@gmail.com?subject=${encodeURIComponent(t.mailSubject)}`"
      >
        {{ t.cta }}
        <svg width="12" height="12" viewBox="0 0 24 24" fill="none"
          stroke="currentColor" stroke-width="2"
          stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"
          style="margin-left: 0.45rem">
          <path d="M5 12h14M12 5l7 7-7 7"/>
        </svg>
      </PfButton>
    </div>

    </div><!-- /.sp-right -->
    </div><!-- /.sp-layout -->

  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { useRouter } from 'vue-router'
import PfButton from '../src/components/PfButton.vue'

const props = defineProps({
  lang  : { type: String, default: 'PT' },
  theme : { type: String, default: 'dark' },
})

const router = useRouter()
const goBack = () => router.push({ path: '/', query: { lang: props.lang } })

// ── Scroll reveal ─────────────────────────────────────────────
const chapterRefs = ref([])
const visible     = ref([])

const setRef = (el, i) => {
  if (el) chapterRefs.value[i] = el
}

let observer = null
onMounted(() => {
  observer = new IntersectionObserver(
    (entries) => {
      entries.forEach(entry => {
        const i = chapterRefs.value.indexOf(entry.target)
        if (entry.isIntersecting && i !== -1) visible.value[i] = true
      })
    },
    { threshold: 0.12 }
  )
  chapterRefs.value.forEach(el => el && observer.observe(el))
})
onUnmounted(() => observer?.disconnect())

// ── Copies ────────────────────────────────────────────────────
const copy = {
  PT: {
    back        : 'Voltar ao portfólio',
    eyebrow     : 'Minha história',
    title       : 'De repórter a designer.<br><em>A viagem que nunca parei.</em>',
    lead        : 'Cinco anos, três grandes viradas e uma certeza: design é o lugar onde eu decido fazer parte das causas, não só registrar as consequências.',
    ctaLabel    : 'Essa história ainda está sendo escrita <em>quer fazer parte do <span class="sp-pink">próximo capítulo</span>?</em>',
    cta         : 'Vamos conversar',
    mailSubject : 'Olá, Tayná — vi sua história e quero conversar',
    chapters: [
      {
        period  : '2014 — 2020',
        title   : 'Era uma vez<br><em>uma jornalista.</em>',
        company : null,
        paras: [
          'Desde o início da minha graduação na Pontifícia Universidade Católica do Rio Grande do Sul, em 2014, passei cinco anos fazendo o que me ensinaram a amar: contar histórias, investigar, comunicar. Mas com o tempo percebi que o jornalismo me colocava sempre do lado das <strong>consequências</strong> — eu chegava depois que os problemas já tinham acontecido.',
          'Queria estar do lado das <strong>causas</strong>. Queria construir coisas que mudassem como as pessoas vivem, não só narrar essa mudança de longe.',
        ],
        highlights: null,
        tags: ['Jornalismo', 'Comunicação', 'Narrativa', 'Pesquisa'],
      },
      {
        period  : '2020',
        title   : 'A pandemia,<br><em>e uma nova tela.</em>',
        company : null,
        paras: [
          'A crise que parou o mundo me deu, paradoxalmente, o espaço que eu precisava pra respirar e olhar pra dentro. Cruzei com a formação de Product Design do Leandro Rezende e encontrei a profissão que eu não sabia que estava procurando.',
          'Design e jornalismo tinham mais em comum do que eu imaginava: <strong>pesquisa profunda, empatia estruturada, narrativa com propósito</strong>. Só que aqui eu podia intervir antes do problema virar manchete. E podia ser a causa de uma manchete positiva no mundo.',
        ],
        highlights: null,
        tags: ['Product Design', 'UX', 'Transição de Carreira'],
      },
      {
        period  : '2020 — 2024',
        title   : 'L\'Oréal, e-commerce<br><em>e 150 designs depois.</em>',
        company : 'Agência — Grupo L\'Oréal & +30 marcas',
        paras: [
          'Minha primeira experiência profissional já veio grande: o Grupo L\'Oréal. Marcas que eu já amava como consumidora, agora como designer responsável pelas experiências digitais delas. Por cerca de um ano, construí UIs orientadas à conversão, aumentando significativamente o NPS e os principais KPIs da marca.',
          'Em quatro anos na agência do grupo Wunderman Thompson, mergulhei fundo em otimizações de e-commerces, plataformas educacionais, sites institucionais utilizando uma abordagem de design suportado por base de dados, unificando o trabalho de BI e CRO ao design. Testes A/B, otimização de funil, landing pages estratégicas — aprendi que design bonito sem conversão é só arte, e que resultado de verdade nasce da intersecção entre <strong>estética e intenção</strong>.',
          'Virei <strong>líder da equipe</strong> de design. Fui mentora dos juniores, produzi e também deleguei projetos. Atuei em mais de 30 marcas — moda, educação, financeiro, casa, B2B, B2C.',
        ],
        highlights: [
          { num: '150+', label: 'designs entregues' },
          { num: '30+',  label: 'marcas atendidas' },
          { num: '4',    label: 'anos de e-commerce' },
        ],
        tags: ['E-commerce', 'CRO', 'Testes A/B', 'Liderança', 'Design System', 'L\'Oréal'],
      },
      {
        period  : '2025 — 2026',
        title   : 'Rodobens:<br><em>o projeto que mudou tudo.</em>',
        company : 'Freelance — Grupo Rodobens via NV8 Tecnologia',
        paras: [
          'Depois do período de agência, fui pro mercado por conta própria. O projeto que definiu essa nova fase foi a modernização do sistema interno de locação e leasing do <strong>Grupo Rodobens</strong> — uma empresa de 75 anos do setor financeiro e varejo automotivo que possuía processos complexos e regras de negócio específicas.',
          'O desafio: unir tudo isso numa plataforma intuitiva para <strong>mais de 100 perfis de acesso diferentes</strong>. Foi onde eu entendi de verdade o que é Business Design — não é fazer tela bonita, é traduzir lógica de negócio em clareza para quem usa.',
          '<strong>Entregamos além</strong> do escopo contratado. Wireframes viraram high level designs. Solucionamos + de 84 dores dos usuários e entregamos um sistema interno unificado e com navegação simplificada.',
        ],
        highlights: [
          { num: '100+', label: 'perfis de usuário' },
          { num: '75',   label: 'anos de empresa modernizados' },
        ],
        tags: ['Business Design', 'UX Research', 'Systems Design', 'Stakeholders', 'Freelance'],
      },
      {
        period  : '2025 →',
        title   : 'Vibe coding,<br><em>e o mundo como escritório.</em>',
        company : 'NV8 Tecnologia & projetos próprios',
        paras: [
          'Depois da Rodobens, construí o site da própria NV8 Tecnologia — <strong>inteiramente usando IAs</strong>. Foi minha entrada definitiva no <strong>vibe coding</strong>.',
          'Hoje entrego sites simples a complexos, com banco de dados e APIs, em tempo muito menor do que qualquer fluxo tradicional de dev. Não dependo de ninguém pra tirar uma ideia do papel — e isso mudou completamente minha proposta de valor como designer.',
          'Falo inglês fluente desde os 13 anos. Sempre foi meu sonho trabalhar de qualquer lugar do mundo. Esse sonho virou plano — e o plano virou realidade que estou construindo agora, um projeto e um voo de cada vez.',
        ],
        highlights: [
          { num: 'EN',  label: 'fluente desde os 13' },
          { num: '∞',   label: 'fusos horários possíveis' },
        ],
        tags: ['Vibe Coding', 'AI-assisted Design', 'Vue', 'Antigravity', 'Nômade Digital', 'Internacional'],
      },
    ],
  },

  EN: {
    back        : 'Back to portfolio',
    eyebrow     : 'My story',
    title       : 'From reporter to designer.<br><em>The trip I never stopped.</em>',
    lead        : 'Five years, three major turning points, and one certainty: design is where I decided to be part of the causes — not just report the consequences.',
    ctaLabel    : 'This story is still being written — want to be part of the next chapter?',
    cta         : 'Let\'s talk',
    mailSubject : 'Hi Tayná — I read your story and want to connect',
    chapters: [
      {
        period  : '2010 — 2020',
        title   : 'Once upon a time,<br><em>a journalist.</em>',
        company : null,
        paras: [
          'I spent a decade doing what I was taught to love: telling stories, investigating, communicating. But over time I realized journalism always placed me on the side of <strong>consequences</strong> — I arrived after the problems had already happened.',
          'I wanted to be on the side of <strong>causes</strong>. I wanted to build things that changed how people live, not just narrate that change from a distance.',
        ],
        highlights: null,
        tags: ['Journalism', 'Communication', 'Narrative', 'Research'],
      },
      {
        period  : '2020',
        title   : 'A pandemic,<br><em>and a new screen.</em>',
        company : null,
        paras: [
          'The crisis that stopped the world gave me, paradoxically, the space I needed to breathe and look inward. I stumbled upon a Product Design program and it felt like finding the profession I didn\'t know I was looking for.',
          'Design and journalism had more in common than I imagined: <strong>deep research, structured empathy, purposeful narrative</strong>. Except here I could intervene before the problem became a headline.',
        ],
        highlights: null,
        tags: ['Product Design', 'UX', 'Career Transition'],
      },
      {
        period  : '2020 — 2024',
        title   : 'L\'Oréal, e-commerce,<br><em>and 150 designs later.</em>',
        company : 'Agency — L\'Oréal Group & 30+ brands',
        paras: [
          'My first professional experience came big: the L\'Oréal Group. Brands I already loved as a consumer, now as the designer responsible for their digital experiences.',
          'Over four years, I dove deep into <strong>data-driven e-commerce</strong>. A/B tests, funnel optimization, strategic landing pages — I learned that beautiful design without conversion is just art, and that real results come from the intersection of <strong>aesthetics and intention</strong>.',
          'I became the design team lead. I mentored juniors, delegated projects, and delivered the most complex cases. I worked across 30+ brands — fashion, education, finance, home, B2B, B2C.',
        ],
        highlights: [
          { num: '150+', label: 'designs delivered' },
          { num: '30+',  label: 'brands served' },
          { num: '4',    label: 'years in e-commerce' },
        ],
        tags: ['E-commerce', 'CRO', 'A/B Testing', 'Leadership', 'Design System', 'L\'Oréal'],
      },
      {
        period  : '2025',
        title   : 'Rodobens:<br><em>the project that changed everything.</em>',
        company : 'Freelance — Rodobens Group via NV8 Tecnologia',
        paras: [
          'I left the agency and went independent. The project that defined this new phase was the modernization of the internal leasing system for <strong>Rodobens Group</strong> — a 75-year-old company with complex processes and business rules that felt like labyrinths.',
          'The challenge: bring it all together in an intuitive platform for <strong>over 100 different access profiles</strong>. That\'s where I truly understood Business Design — it\'s not about making pretty screens, it\'s about translating business logic into clarity for the people who use it.',
          'We delivered beyond the contracted scope. Wireframes became final navigable layouts. We invested in a long-term client relationship, and it came back as more projects.',
        ],
        highlights: [
          { num: '100+', label: 'user profiles' },
          { num: '75',   label: 'years of legacy modernized' },
        ],
        tags: ['Business Design', 'UX Research', 'Systems Design', 'Stakeholders', 'Freelance'],
      },
      {
        period  : '2025 →',
        title   : 'Vibe coding,<br><em>and the world as my office.</em>',
        company : 'NV8 Tecnologia & own projects',
        paras: [
          'After Rodobens, I built NV8 Tecnologia\'s own website — <strong>entirely using AI</strong>. That was my definitive entry into vibe coding.',
          'Today I deliver websites from simple to complex, with databases and APIs, in much less time than any traditional dev workflow. I don\'t depend on anyone to bring an idea to life — and that completely changed my value proposition as a designer.',
          'I\'ve spoken fluent English since I was 13. Working from anywhere in the world has always been my dream. That dream became a plan — and the plan became a reality I\'m building right now, one project and one flight at a time.',
        ],
        highlights: [
          { num: 'EN',  label: 'fluent since age 13' },
          { num: '∞',   label: 'possible time zones' },
        ],
        tags: ['Vibe Coding', 'AI-assisted Design', 'Vue', 'Digital Nomad', 'International'],
      },
    ],
  },

  ES: {
    back        : 'Volver al portfolio',
    eyebrow     : 'Mi historia',
    title       : 'De reportera a diseñadora.<br><em>El viaje que nunca detuve.</em>',
    lead        : 'Cinco años, tres grandes giros y una certeza: el diseño es el lugar donde decidí ser parte de las causas — no solo registrar las consecuencias.',
    ctaLabel    : 'Esta historia todavía se está escribiendo — ¿quieres ser parte del próximo capítulo?',
    cta         : 'Hablemos',
    mailSubject : 'Hola Tayná — leí tu historia y quiero conectar',
    chapters: [
      {
        period: '2010 — 2020', title: 'Había una vez<br><em>una periodista.</em>', company: null,
        paras: ['Pasé una década haciendo lo que me enseñaron a amar: contar historias, investigar, comunicar. Pero con el tiempo me di cuenta de que el periodismo siempre me colocaba del lado de las <strong>consecuencias</strong>.','Quería estar del lado de las <strong>causas</strong>. Quería construir cosas que cambiaran cómo vive la gente, no solo narrar ese cambio desde lejos.'],
        highlights: null, tags: ['Periodismo', 'Comunicación', 'Narrativa', 'Investigación'],
      },
      {
        period: '2020', title: 'Una pandemia,<br><em>y una nueva pantalla.</em>', company: null,
        paras: ['La crisis que detuvo al mundo me dio, paradójicamente, el espacio que necesitaba para respirar y mirarme por dentro. Me topé con una formación en Product Design y fue como encontrar la profesión que no sabía que buscaba.','Diseño y periodismo tenían más en común de lo que imaginaba: <strong>investigación profunda, empatía estructurada, narrativa con propósito</strong>.'],
        highlights: null, tags: ['Product Design', 'UX', 'Cambio de Carrera'],
      },
      {
        period: '2020 — 2024', title: 'L\'Oréal, e-commerce<br><em>y 150 diseños después.</em>', company: 'Agencia — Grupo L\'Oréal & +30 marcas',
        paras: ['Mi primera experiencia profesional llegó grande: el Grupo L\'Oréal. Marcas que ya amaba como consumidora, ahora como diseñadora responsable de sus experiencias digitales.','En cuatro años, me sumergí en <strong>e-commerce orientado a datos</strong>. Tests A/B, optimización de embudo, landing pages estratégicas.','Me convertí en líder del equipo de diseño. Mentoreé juniors, delegué proyectos. Trabajé con más de 30 marcas — moda, educación, finanzas, hogar, B2B, B2C.'],
        highlights: [{num:'150+',label:'diseños entregados'},{num:'30+',label:'marcas atendidas'},{num:'4',label:'años en e-commerce'}],
        tags: ['E-commerce', 'CRO', 'Tests A/B', 'Liderazgo', 'Design System'],
      },
      {
        period: '2025', title: 'Rodobens:<br><em>el proyecto que cambió todo.</em>', company: 'Freelance — Grupo Rodobens vía NV8 Tecnologia',
        paras: ['El proyecto que definió esta nueva etapa fue la modernización del sistema interno de arrendamiento del <strong>Grupo Rodobens</strong> — una empresa de 75 años con reglas de negocio que parecían laberintos.','El desafío: reunir todo en una plataforma intuitiva para <strong>más de 100 perfiles de acceso diferentes</strong>. Ahí entendí de verdad qué es Business Design.'],
        highlights: [{num:'100+',label:'perfiles de usuario'},{num:'75',label:'años de legado modernizados'}],
        tags: ['Business Design', 'UX Research', 'Stakeholders', 'Freelance'],
      },
      {
        period: '2025 →', title: 'Vibe coding,<br><em>y el mundo como oficina.</em>', company: 'NV8 Tecnologia & proyectos propios',
        paras: ['Después de Rodobens, construí el propio sitio de NV8 Tecnologia — <strong>enteramente usando IA</strong>. Fue mi entrada definitiva al vibe coding.','Hoy entrego sitios de simple a complejo, con bases de datos y APIs, en mucho menos tiempo. No dependo de nadie para materializar una idea.','Hablo inglés fluido desde los 13 años. Trabajar desde cualquier lugar del mundo siempre fue mi sueño — y ese sueño se está haciendo realidad.'],
        highlights: [{num:'EN',label:'fluida desde los 13'},{num:'∞',label:'husos horarios posibles'}],
        tags: ['Vibe Coding', 'AI-assisted Design', 'Nómada Digital', 'Internacional'],
      },
    ],
  },

  DE: {
    back        : 'Zurück zum Portfolio',
    eyebrow     : 'Meine Geschichte',
    title       : 'Von der Reporterin zur Designerin.<br><em>Die Reise, die ich nie aufhörte.</em>',
    lead        : 'Fünf Jahre, drei große Wendepunkte und eine Gewissheit: Design ist der Ort, wo ich entschied, Teil der Ursachen zu sein — nicht nur die Folgen zu berichten.',
    ctaLabel    : 'Diese Geschichte wird noch geschrieben — möchtest du Teil des nächsten Kapitels sein?',
    cta         : 'Lass uns reden',
    mailSubject : 'Hallo Tayná — ich habe deine Geschichte gelesen und möchte mich vernetzen',
    chapters: [
      {
        period: '2010 — 2020', title: 'Es war einmal<br><em>eine Journalistin.</em>', company: null,
        paras: ['Ich verbrachte ein Jahrzehnt damit, zu tun, was ich zu lieben gelernt hatte: Geschichten erzählen, recherchieren, kommunizieren. Doch mit der Zeit merkte ich, dass der Journalismus mich immer auf die Seite der <strong>Folgen</strong> stellte.','Ich wollte auf der Seite der <strong>Ursachen</strong> sein. Ich wollte Dinge bauen, die verändern, wie Menschen leben.'],
        highlights: null, tags: ['Journalismus', 'Kommunikation', 'Narrativ', 'Recherche'],
      },
      {
        period: '2020', title: 'Eine Pandemie,<br><em>und ein neuer Bildschirm.</em>', company: null,
        paras: ['Die Krise, die die Welt anhielt, gab mir paradoxerweise den Raum, den ich brauchte. Ich stieß auf eine Product-Design-Ausbildung — und es fühlte sich an, als hätte ich den Beruf gefunden, den ich nicht wusste, dass ich suchte.','Design und Journalismus hatten mehr gemeinsam als ich dachte: <strong>tiefe Recherche, strukturierte Empathie, zweckgerichtete Narrative</strong>.'],
        highlights: null, tags: ['Product Design', 'UX', 'Karrierewechsel'],
      },
      {
        period: '2020 — 2024', title: 'L\'Oréal, E-Commerce<br><em>und 150 Designs später.</em>', company: 'Agentur — L\'Oréal-Gruppe & 30+ Marken',
        paras: ['Meine erste Berufserfahrung kam groß: die L\'Oréal-Gruppe. Marken, die ich als Konsumentin bereits liebte, nun als Designerin.','In vier Jahren tauchte ich tief in <strong>datengetriebenen E-Commerce</strong> ein. A/B-Tests, Funnel-Optimierung, strategische Landing Pages.','Ich wurde Designteam-Leiterin. Ich mentorte Junioren und lieferte die komplexesten Projekte. Ich arbeitete mit über 30 Marken.'],
        highlights: [{num:'150+',label:'Designs geliefert'},{num:'30+',label:'Marken betreut'},{num:'4',label:'Jahre E-Commerce'}],
        tags: ['E-Commerce', 'CRO', 'A/B-Tests', 'Teamleitung', 'Design System'],
      },
      {
        period: '2025', title: 'Rodobens:<br><em>das Projekt, das alles veränderte.</em>', company: 'Freelance — Rodobens-Gruppe über NV8 Tecnologia',
        paras: ['Das Projekt, das diese neue Phase definierte, war die Modernisierung des internen Leasing-Systems der <strong>Rodobens-Gruppe</strong> — ein 75 Jahre altes Unternehmen mit komplexen Geschäftsregeln.','Die Herausforderung: alles in einer intuitiven Plattform für <strong>über 100 verschiedene Zugriffsprofile</strong> zusammenzubringen. Dort verstand ich wirklich, was Business Design bedeutet.'],
        highlights: [{num:'100+',label:'Nutzerprofile'},{num:'75',label:'Jahre Legacy modernisiert'}],
        tags: ['Business Design', 'UX Research', 'Stakeholder-Management', 'Freelance'],
      },
      {
        period: '2025 →', title: 'Vibe Coding<br><em>und die Welt als Büro.</em>', company: 'NV8 Tecnologia & eigene Projekte',
        paras: ['Nach Rodobens baute ich die eigene Website von NV8 Tecnologia — <strong>komplett mit KI</strong>. Das war mein definitiver Einstieg ins Vibe Coding.','Heute liefere ich Websites von einfach bis komplex, mit Datenbanken und APIs, in viel kürzerer Zeit. Ich bin von niemandem abhängig.','Ich spreche fließend Englisch seit ich 13 bin. Die Welt als Büro zu nutzen war immer mein Traum — und dieser Traum wird gerade wahr.'],
        highlights: [{num:'EN',label:'fließend seit 13'},{num:'∞',label:'mögliche Zeitzonen'}],
        tags: ['Vibe Coding', 'KI-gestütztes Design', 'Digitale Nomadin', 'International'],
      },
    ],
  },
}

const t = computed(() => copy[props.lang])
</script>

<style>
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500&display=swap');

/* ── Root ───────────────────────────────────────────── */
.sp-root {
  font-family : 'DM Sans', sans-serif;
  min-height  : 100svh;
  position    : relative;
  overflow-x  : clip; /* clip instead of hidden — allows position:sticky on children */
  transition  : background 0.5s ease, color 0.5s ease;
}
.theme-dark  { background: #070711; color: #F0EFF8; }
.theme-light { background: #F5F3FF; color: #0D0C1A; }

/* Grain */
.sp-grain {
  position         : fixed;
  inset            : 0;
  z-index          : 0;
  pointer-events   : none;
  opacity          : 0.035;
  background-image : url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");
  background-size  : 180px;
}

/* ── Back button ────────────────────────────────────── */
.sp-back {
  position       : fixed;
  top            : 1.5rem;
  left           : 1.5rem;
  z-index        : 100;
  display        : inline-flex;
  align-items    : center;
  gap            : 0.4rem;
  font-size      : 0.6rem;
  font-weight    : 500;
  letter-spacing : 0.12em;
  text-transform : uppercase;
  cursor         : pointer;
  color          : var(--fg-muted, #6B6A82);
  border         : 1px solid var(--border, rgba(255,255,255,.07));
  padding        : 0.4rem 0.75rem;
  transition     : color 0.2s, border-color 0.2s;
  background     : var(--bg, #070711);
  font-family    : 'DM Sans', sans-serif;
}
.sp-back:hover {
  color        : #F0185A;
  border-color : rgba(240,24,90,.35);
}

/* ── Hero ───────────────────────────────────────────── */
.sp-hero {
  position      : relative;
  z-index       : 1;
  padding       : 8rem 1.5rem 5rem;
  max-width     : 900px;
  margin        : 0 auto;
}

.sp-eyebrow {
  display        : flex;
  align-items    : center;
  gap            : 0.5rem;
  font-size      : 0.6rem;
  font-weight    : 500;
  letter-spacing : 0.18em;
  text-transform : uppercase;
  color          : #F0185A;
  margin-bottom  : 1.25rem;
}
.sp-dot {
  width         : 5px;
  height        : 5px;
  border-radius : 50%;
  background    : #F0185A;
  animation     : sp-pulse 2.5s ease-in-out infinite;
  flex-shrink   : 0;
}

.sp-title {
  font-family    : 'Clash Display', sans-serif;
  font-weight    : 700;
  font-size      : clamp(2.25rem, 8vw, 5rem);
  line-height    : 1.05;
  letter-spacing : -0.03em;
  margin-bottom  : 1.5rem;
}
.sp-title em {
  font-style : italic;
  color      : #F0185A;
}

.sp-lead {
  font-size   : clamp(0.9rem, 2vw, 1.1rem);
  font-weight : 300;
  line-height : 1.8;
  color       : var(--fg-muted, #6B6A82);
  max-width   : 60ch;
}

/* ── Timeline ───────────────────────────────────────── */
.sp-timeline {
  position   : relative;
  z-index    : 1;
  list-style : none;
  padding    : 0 1.5rem 4rem;
  max-width  : 900px;
  margin     : 0 auto;
  display    : flex;
  flex-direction: column;
  gap        : 0;
}

/* ── Capítulo ───────────────────────────────────────── */
.sp-chapter {
  display   : flex;
  gap       : 1.5rem;
  opacity   : 0;
  transform : translateX(-20px);
  transition: opacity 0.7s ease, transform 0.7s cubic-bezier(.16,1,.3,1);
}
.sp-chapter--visible {
  opacity   : 1;
  transform : translateX(0);
}

/* Coluna do nó + linha vertical */
.sp-node-col {
  display        : flex;
  flex-direction : column;
  align-items    : center;
  flex-shrink    : 0;
  padding-top    : 0.3rem;
}

.sp-node {
  position    : relative;
  width       : 12px;
  height      : 12px;
  flex-shrink : 0;
}
.sp-node-dot {
  position      : absolute;
  inset         : 3px;
  border-radius : 50%;
  background    : #F0185A;
  display       : block;
}
.sp-node-ring {
  position      : absolute;
  inset         : 0;
  border-radius : 50%;
  border        : 1px solid #F0185A;
  opacity       : 0;
  animation     : sp-ring 2.8s ease-in-out infinite;
}
.sp-chapter:nth-child(2) .sp-node-ring { animation-delay: 0.56s; }
.sp-chapter:nth-child(3) .sp-node-ring { animation-delay: 1.12s; }
.sp-chapter:nth-child(4) .sp-node-ring { animation-delay: 1.68s; }
.sp-chapter:nth-child(5) .sp-node-ring { animation-delay: 2.24s; }

.sp-vline {
  flex       : 1;
  width      : 1px;
  background : linear-gradient(to bottom, rgba(240,24,90,.3), rgba(240,24,90,.05));
  margin-top : 0.5rem;
  min-height : 3rem;
}
.sp-chapter:last-child .sp-vline { display: none; }

/* ── Conteúdo ───────────────────────────────────────── */
.sp-content {
  padding-bottom : 4rem;
  flex           : 1;
  min-width      : 0;
}

.sp-period {
  display        : block;
  font-size      : 0.58rem;
  font-weight    : 500;
  letter-spacing : 0.18em;
  text-transform : uppercase;
  color          : #F0185A;
  opacity        : 0.7;
  margin-bottom  : 0.75rem;
}

.sp-ch-title {
  font-family    : 'Clash Display', sans-serif;
  font-weight    : 700;
  font-size      : clamp(1.5rem, 5vw, 2.75rem);
  line-height    : 1.1;
  letter-spacing : -0.025em;
  margin-bottom  : 0.6rem;
}
.sp-ch-title em {
  font-style : italic;
  color      : #F0185A;
}

.sp-company {
  display        : inline-block;
  font-size      : 0.65rem;
  font-weight    : 500;
  letter-spacing : 0.1em;
  text-transform : uppercase;
  color          : var(--fg-muted, #6B6A82);
  border         : 1px solid var(--border, rgba(255,255,255,.07));
  padding        : 0.25rem 0.6rem;
  margin-bottom  : 1.25rem;
}

.sp-text {
  display       : flex;
  flex-direction: column;
  gap           : 0.85rem;
  margin-bottom : 1.5rem;
}
.sp-text p {
  font-size   : clamp(0.875rem, 2vw, 1rem);
  font-weight : 300;
  line-height : 1.9;
  color       : var(--fg-muted, #6B6A82);
  max-width   : 65ch;
}
.sp-text p strong {
  font-weight : 500;
  color       : var(--fg, #F0EFF8);
}

/* Highlights numéricos */
.sp-highlights {
  display        : flex;
  flex-wrap      : wrap;
  gap            : 1rem;
  margin-bottom  : 1.5rem;
}
.sp-highlight {
  display        : flex;
  flex-direction : column;
  gap            : 0.2rem;
  border-left    : 2px solid #F0185A;
  padding-left   : 0.75rem;
}
.sp-hl-num {
  font-family    : 'Clash Display', sans-serif;
  font-weight    : 700;
  font-size      : clamp(1.5rem, 4vw, 2rem);
  color          : #F0185A;
  line-height    : 1;
}
.sp-hl-label {
  font-size      : 0.6rem;
  font-weight    : 500;
  letter-spacing : 0.1em;
  text-transform : uppercase;
  color          : var(--fg-muted, #6B6A82);
}

/* Tags */
.sp-tags {
  display   : flex;
  flex-wrap : wrap;
  gap       : 0.35rem;
}
.sp-tag {
  font-size      : 0.58rem;
  font-weight    : 500;
  letter-spacing : 0.08em;
  text-transform : uppercase;
  color          : var(--fg-muted, #6B6A82);
  border         : 1px solid var(--border, rgba(255,255,255,.07));
  padding        : 0.25rem 0.6rem;
  transition     : color 0.2s, border-color 0.2s;
}
.sp-tag:hover {
  color        : #F0185A;
  border-color : rgba(240,24,90,.35);
}

/* ── CTA final ──────────────────────────────────────── */
.sp-cta-wrap {
  position        : relative;
  z-index         : 1;
  display         : flex;
  flex-direction  : column;
  align-items     : center;
  text-align      : center;
  gap             : 1.75rem;
  padding         : 5rem 1.5rem 6rem;
  border-top      : 1px solid var(--border, rgba(255,255,255,.07));
  max-width       : 900px;
  margin          : 0 auto;
}

.sp-cta-label {
  font-family    : 'Clash Display', sans-serif;
  font-weight    : 600;
  font-size      : clamp(1.25rem, 4vw, 2rem);
  line-height    : 1.25;
  letter-spacing : -0.02em;
  max-width      : 36ch;
}
.sp-cta-label em   { font-style: italic; }
.sp-pink           { color: #F0185A; }

/* Botão (mesmo padrão das outras seções) */
.sp-btn {
  position         : relative;
  display          : inline-flex;
  align-items      : center;
  justify-content  : center;
  height           : 54px;
  padding          : 0 2rem;
  overflow         : hidden;
  outline          : none;
  cursor           : pointer;
  text-decoration  : none;
  transition       : transform 0.15s ease;
  min-width        : 210px;
  border-radius    : 0;
}
.sp-btn:active { transform: scale(0.97); }

.sp-btn-ring {
  position   : absolute;
  inset      : -100%;
  animation  : sp-spin 3s linear infinite;
  opacity    : 0;
  transition : opacity 0.4s ease;
  background : conic-gradient(from 90deg at 50% 50%, transparent 0%, transparent 75%, rgba(255,255,255,.9) 100%);
  pointer-events: none;
}
.sp-btn:hover .sp-btn-ring { opacity: 1; }

.sp-btn-veil {
  position   : absolute;
  inset      : 0;
  background : #F0185A;
  pointer-events: none;
}
.sp-btn-core {
  position       : absolute;
  inset          : 1px;
  z-index        : 1;
  background     : #F0185A;
  pointer-events : none;
  transition     : background 0.3s;
}
.sp-btn:hover .sp-btn-core { background: #f5326d; }

.sp-btn-lbl {
  position       : relative;
  z-index        : 2;
  font-size      : 0.65rem;
  font-weight    : 500;
  letter-spacing : 0.14em;
  text-transform : uppercase;
  color          : #fff;
  display        : flex;
  align-items    : center;
  gap            : 0.5rem;
}
.sp-btn-lbl svg { transition: transform 0.25s cubic-bezier(.16,1,.3,1); }
.sp-btn:hover .sp-btn-lbl svg { transform: translateX(4px); }

/* ── Keyframes ──────────────────────────────────────── */
@keyframes sp-pulse {
  0%, 100% { opacity: 1; transform: scale(1); }
  50%      { opacity: 0.3; transform: scale(0.7); }
}
@keyframes sp-ring {
  0%   { transform: scale(1);   opacity: 0.8; }
  60%  { transform: scale(2.8); opacity: 0;   }
  100% { transform: scale(2.8); opacity: 0;   }
}
@keyframes sp-spin { to { transform: rotate(360deg); } }

/* ── Responsivo ─────────────────────────────────────── */
@media (min-width: 640px) {
  .sp-hero     { padding: 9rem 3rem 5rem; }
  .sp-timeline { padding: 0 3rem 4rem; }
  .sp-chapter  { gap: 2.5rem; }
  .sp-back     { left: 3rem; }
}

/* ── Desktop: two-column sticky layout ─────────────── */
@media (min-width: 1024px) {

  .sp-back { left: 2.5rem; top: 2rem; }

  /* Grid: fixed hero left | scrollable timeline right */
  .sp-layout {
    display             : grid;
    grid-template-columns: 44% 56%;
    align-items         : start;
    position            : relative;
    z-index             : 1;
  }

  /* Left column — sticks to viewport while right scrolls */
  .sp-hero {
    position        : sticky;
    top             : 0;
    height          : 100svh;
    display         : flex;
    flex-direction  : column;
    justify-content : center;
    padding         : 2rem 3.5rem 2rem 5rem;
    max-width       : none;
    margin          : 0;
    border-right    : 1px solid rgba(240, 24, 90, 0.1);
  }

  .sp-title { font-size: clamp(2rem, 3.5vw, 3.75rem); }

  .sp-lead { max-width: 44ch; }

  /* Right column — normal page scroll */
  .sp-right { min-height: 100svh; }

  .sp-timeline {
    padding    : 8rem 5rem 2rem 4rem;
    max-width  : none;
    margin     : 0;
  }

  .sp-cta-wrap {
    max-width : none;
    margin    : 0;
    padding   : 4rem 5rem 7rem 4rem;
  }
}

@media (min-width: 1400px) {
  .sp-back     { left: 3rem; }
  .sp-hero     { padding: 2rem 4rem 2rem 8rem; }
  .sp-title    { font-size: clamp(2.25rem, 3.2vw, 4rem); }
  .sp-timeline { padding: 9rem 7rem 2rem 5rem; }
  .sp-cta-wrap { padding: 4rem 7rem 7rem 5rem; }
}
</style>
