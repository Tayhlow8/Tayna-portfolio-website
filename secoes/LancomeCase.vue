<template>
  <div :class="['lc-root', `theme-${theme}`]">
    <div class="lc-grain" aria-hidden="true"></div>
    <div class="lc-glow"  aria-hidden="true"></div>

    <NavBar v-model:lang="lang" v-model:theme="theme" />

    <!-- ══════════════════════════════════════
         HERO
         ══════════════════════════════════════ -->
    <section class="lc-hero">
      <div class="lc-wrap lc-hero-inner">

        <!-- Left: text -->
        <div class="lc-hero-text">
          <div class="lc-eyebrow">
            <span class="lc-dot" aria-hidden="true"></span>
            <span>{{ t.eyebrow }}</span>
          </div>

          <h1 class="lc-title">Lancôme<br><em>{{ t.titleEm }}</em></h1>

          <div class="lc-hero-meta">
            <div class="lc-meta-item">
              <span class="lc-meta-label">{{ t.metaLabels.client }}</span>
              <span class="lc-meta-value">{{ t.metaValues.client }}</span>
            </div>
            <div class="lc-meta-item">
              <span class="lc-meta-label">{{ t.metaLabels.scope }}</span>
              <span class="lc-meta-value">{{ t.metaValues.scope }}</span>
            </div>
            <div class="lc-meta-item">
              <span class="lc-meta-label">{{ t.metaLabels.deliverable }}</span>
              <span class="lc-meta-value">{{ t.metaValues.deliverable }}</span>
            </div>
            <div class="lc-meta-item">
              <span class="lc-meta-label">{{ t.metaLabels.location }}</span>
              <span class="lc-meta-value">{{ t.metaValues.location }}</span>
            </div>
          </div>

          <div class="lc-rule" aria-hidden="true"></div>

          <p class="lc-hero-desc">
            {{ t.heroDesc }}
          </p>
        </div>

        <!-- Right: hero image -->
        <div class="lc-hero-img">
          <img :src="foto1" :alt="t.heroImgAlt" />
        </div>

      </div>
    </section>

    <!-- ══════════════════════════════════════
         OVERVIEW
         ══════════════════════════════════════ -->
    <section class="lc-wrap lc-section lc-reveal">
      <div class="lc-section-eyebrow">{{ t.overviewEyebrow }}</div>
      <h2 class="lc-section-title" v-html="t.overviewTitle"></h2>
      <p class="lc-section-body">
        {{ t.overviewBody }}
      </p>

      <div class="lc-overview-grid">
        <div class="lc-overview-card" v-for="card in t.overviewCards" :key="card.label">
          <div class="lc-overview-label">{{ card.label }}</div>
          <div class="lc-overview-body" v-html="card.body"></div>
        </div>
      </div>
    </section>

    <!-- ══════════════════════════════════════
         GOALS
         ══════════════════════════════════════ -->
    <section class="lc-wrap lc-section lc-reveal">
      <div class="lc-section-eyebrow">{{ t.goalsEyebrow }}</div>
      <h2 class="lc-section-title">{{ t.goalsTitle }}</h2>

      <ul class="lc-goals-list">
        <li v-for="(goal, i) in t.goals" :key="i">
          <span class="lc-goals-num">{{ String(i + 1).padStart(2, '0') }}</span>
          <span v-html="goal"></span>
        </li>
      </ul>
    </section>

    <!-- ══════════════════════════════════════
         USER FLOWS
         ══════════════════════════════════════ -->
    <section class="lc-wrap lc-section lc-reveal">
      <div class="lc-section-eyebrow">{{ t.flowsEyebrow }}</div>
      <h2 class="lc-section-title">{{ t.flowsTitle }}</h2>
      <p class="lc-section-body">
        {{ t.flowsBody }}
      </p>

      <div class="lc-flow-grid">
        <div class="lc-flow-card">
          <div class="lc-flow-icon">✦</div>
          <div class="lc-flow-title">{{ t.guestTitle }}</div>
          <ul class="lc-flow-steps">
            <li v-for="(step, i) in t.guestSteps" :key="i">{{ step }}</li>
          </ul>
        </div>
        <div class="lc-flow-card">
          <div class="lc-flow-icon">◈</div>
          <div class="lc-flow-title">{{ t.promoterTitle }}</div>
          <ul class="lc-flow-steps">
            <li v-for="(step, i) in t.promoterSteps" :key="i">{{ step }}</li>
          </ul>
        </div>
      </div>

      <div class="lc-flow-diagram">
        <img :src="foto2" :alt="t.flowDiagramAlt" />
      </div>
    </section>

    <!-- ══════════════════════════════════════
         PROCESS
         ══════════════════════════════════════ -->
    <section class="lc-wrap lc-section lc-reveal">
      <div class="lc-section-eyebrow">{{ t.processEyebrow }}</div>
      <h2 class="lc-section-title">{{ t.processTitle }}</h2>

      <div class="lc-process-list">
        <div class="lc-process-item" v-for="item in t.processItems" :key="item.num">
          <div class="lc-process-num">{{ item.num }}</div>
          <div class="lc-process-content">
            <div class="lc-process-title">{{ item.title }}</div>
            <p class="lc-process-body">
              {{ item.body }}
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- ══════════════════════════════════════
         UI SCREENS
         ══════════════════════════════════════ -->
    <section class="lc-wrap lc-section lc-reveal">
      <div class="lc-section-eyebrow">{{ t.screensEyebrow }}</div>
      <h2 class="lc-section-title">{{ t.screensTitle }}</h2>

      <div class="lc-photos-grid">
        <img :src="foto3" :alt="t.altWireframes" class="lc-photo" />
        <img :src="foto4" :alt="t.altFinalUI" class="lc-photo" />
      </div>
    </section>

    <!-- ══════════════════════════════════════
         LEARNINGS
         ══════════════════════════════════════ -->
    <section class="lc-wrap lc-section lc-reveal">
      <div class="lc-section-eyebrow">{{ t.learningsEyebrow }}</div>
      <h2 class="lc-section-title">{{ t.learningsTitle }}</h2>

      <div class="lc-learnings-grid">
        <div class="lc-learning-card" v-for="card in t.learningCards" :key="card.num">
          <div class="lc-learning-num">{{ card.num }}</div>
          <div class="lc-learning-title">{{ card.title }}</div>
          <p class="lc-learning-body">
            {{ card.body }}
          </p>
        </div>
      </div>
    </section>

    <!-- ══════════════════════════════════════
         FOOTER / CTA
         ══════════════════════════════════════ -->
    <div class="lc-wrap lc-reveal">
      <div class="lc-case-footer">
        <div>
          <div class="lc-footer-label">{{ t.footerLabel }}</div>
          <div class="lc-footer-title" v-html="t.footerTitle"></div>
        </div>
        <div class="lc-footer-btns">
          <router-link to="/projetos/rodobens" class="lc-btn lc-btn--solid">
            {{ t.footerNext }} <span class="lc-arr">→</span>
          </router-link>
          <router-link to="/projetos" class="lc-btn lc-btn--ghost">
            {{ t.footerAll }}
          </router-link>
        </div>
      </div>
    </div>

    <footer class="lc-footer">
      <span class="lc-footer-tag">{{ t.footerBar }}</span>
      <span class="lc-footer-copy">© 2026 Tayná Schultz</span>
    </footer>

  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import NavBar from './NavBar.vue'
import { useLang } from '../src/composables/useLang'

import foto1 from '../imagens cases/Lancme brazil/foto 1 lancome.avif'
import foto2 from '../imagens cases/Lancme brazil/foto 2 lancome.avif'
import foto3 from '../imagens cases/Lancme brazil/foto 3 lancome.avif'
import foto4 from '../imagens cases/Lancme brazil/foto 4 lancome.avif'

const props = defineProps({
  lang  : { type: String, default: 'PT' },
  theme : { type: String, default: 'light' },
})

const { lang } = useLang()
const theme = ref(props.theme)

// ── Translations ──────────────────────────────────────────────
const copy = {
  EN: {
    eyebrow  : 'UX/UI Design · Brand Activation · 2024',
    titleEm  : 'Brazil.',
    metaLabels: { client: 'Client', scope: 'Scope', deliverable: 'Deliverable', location: 'Location' },
    metaValues: {
      client: 'Lancôme Brazil',
      scope: 'UX/UI Design',
      deliverable: 'Landing Page + Promoter Flow',
      location: 'São Paulo, Brazil',
    },
    heroDesc: 'An immersive, invitation-only sensorial exhibition in São Paulo celebrating the history of Lancôme through perfume, jewelry, fashion, sound, and haute cuisine — designed to engage all five human senses.',
    heroImgAlt: 'Lancôme Brazil — sensorial experience',

    overviewEyebrow: 'Overview',
    overviewTitle  : 'A multi-sensory experience<br>demanded a dual-purpose design.',
    overviewBody   : 'Inspired by La Galerie Dior in Paris, this exclusive São Paulo activation required a digital touchpoint that worked for two completely different audiences — guests managing RSVPs and promoters validating tickets on-site.',
    overviewCards: [
      { label: 'The Challenge', body: 'Design a single product that serves <strong>two distinct users</strong> with opposing needs: guests seeking an elegant brand experience, and promoters needing a fast, frictionless operational tool.' },
      { label: 'The Approach',  body: 'Map each journey independently, then <strong>unify them</strong> under a single visual system aligned with the campaign key visual — ensuring consistency without compromise.' },
      { label: 'My Role',       body: '<strong>Lead UX/UI Designer</strong> — responsible for discovery, user flow mapping, wireframing, prototyping, and final UI delivery in close collaboration with marketing and event production teams.' },
      { label: 'Impact',        body: 'Delivered a <strong>clickable prototype</strong> approved by stakeholders, balancing luxury aesthetics with mobile-first operational usability for a high-profile, live event.' },
    ],

    goalsEyebrow: 'Project Goals',
    goalsTitle  : 'What success looked like',
    goals: [
      "Design a landing page that aligns with the event's high-end positioning and campaign key visual (KV), ensuring the digital experience mirrors the luxury of the physical event.",
      'Build a seamless <strong>Guest Flow</strong> — capturing user data and managing RSVPs with elegance and minimal friction.',
      'Build a clean <strong>Promoter Flow</strong> — a tablet-optimized interface for receptionists to validate tickets and tokens in real time, during the event.',
      "Ensure <strong>mobile-first design</strong> throughout, since the reception area would rely entirely on smartphones and tablets for on-site operations.",
    ],

    flowsEyebrow: 'User Flows',
    flowsTitle  : 'Two journeys, one product',
    flowsBody   : 'Both flows were mapped independently before being unified under the same visual system — making sure neither audience had to compromise.',
    guestTitle  : 'Guest Journey',
    guestSteps  : [
      'Landing page with campaign KV and event intro',
      'RSVP form — elegant, minimal data capture',
      'Confirmation screen with ticket / token',
    ],
    promoterTitle: 'Promoter Journey',
    promoterSteps: [
      'Dedicated tablet interface — no distractions',
      'Ticket / token validation (input or scan)',
      'Status confirmation — valid or invalid, instantly',
    ],
    flowDiagramAlt: 'User flow diagram — Guest and Promoter journeys',

    processEyebrow: 'Design Process',
    processTitle  : 'From brief to prototype',
    processItems: [
      { num: '01', title: 'Discovery & Briefing',       body: 'Aligned with marketing and event production teams to understand the event concept, audience profile, required RSVP data fields, and on-site operational needs for promoters. This cross-functional alignment shaped every design decision that followed.' },
      { num: '02', title: 'User Flow Mapping',           body: "Mapped both journeys in parallel — Guest (RSVP) and Promoter (validation) — identifying each audience's context, device environment, and critical success moments. Ensured zero overlap of complexity between flows." },
      { num: '03', title: 'Wireframing & Prototyping',   body: 'Developed low and high-fidelity wireframes focused on visual storytelling through typography, campaign imagery, and motion for the guest side — and extreme clarity and speed for the promoter interface. Delivered a clickable prototype for stakeholder approval.' },
      { num: '04', title: 'UI Design',                   body: "Applied the campaign's key visual — colors, typography, and imagery — to create a luxury aesthetic that didn't sacrifice usability. Mobile-first execution ensured the promoter interface worked flawlessly on smartphones and tablets during the live event." },
    ],

    screensEyebrow: 'UI Screens',
    screensTitle  : 'Design in context',
    altWireframes : 'Wireframes — low and high fidelity',
    altFinalUI    : 'Final UI — guest and promoter screens',

    learningsEyebrow: 'Key Takeaways',
    learningsTitle  : 'What I learned',
    learningCards: [
      { num: '01', title: 'Designing for dual users',    body: "A single product serving two audiences demands clear prioritization of each user's context and needs — before a single screen is designed." },
      { num: '02', title: 'Luxury requires precision',   body: 'High-end brand projects leave no room for approximation. Aesthetics and function must coexist without compromise — every detail carries brand weight.' },
      { num: '03', title: 'Cross-team collaboration',    body: 'Close alignment with event logistics and marketing teams was essential to anticipate real-world usage challenges that no user research could predict alone.' },
    ],

    footerLabel: 'Next project',
    footerTitle: 'Unica — Rodobens<br>Credit System',
    footerNext : 'Next case',
    footerAll  : 'All projects',
    footerBar  : 'Lancôme Brazil · UX/UI Design · 2024',
  },

  PT: {
    eyebrow  : 'UX/UI Design · Ativação de Marca · 2024',
    titleEm  : 'Brasil.',
    metaLabels: { client: 'Cliente', scope: 'Escopo', deliverable: 'Entregável', location: 'Localização' },
    metaValues: {
      client: 'Lancôme Brasil',
      scope: 'UX/UI Design',
      deliverable: 'Landing Page + Fluxo do Promotor',
      location: 'São Paulo, Brasil',
    },
    heroDesc: 'Uma exposição sensorial imersiva e por convite em São Paulo, celebrando a história da Lancôme através de perfume, joias, moda, som e alta gastronomia — projetada para envolver os cinco sentidos humanos.',
    heroImgAlt: 'Lancôme Brasil — experiência sensorial',

    overviewEyebrow: 'Visão Geral',
    overviewTitle  : 'Uma experiência multissensorial<br>exigia um design de propósito duplo.',
    overviewBody   : 'Inspirada na La Galerie Dior, em Paris, essa ativação exclusiva em São Paulo exigia um ponto de contato digital que funcionasse para dois públicos completamente diferentes — convidados gerenciando RSVPs e promotores validando ingressos no local.',
    overviewCards: [
      { label: 'O Desafio',  body: 'Projetar um único produto que atenda <strong>dois usuários distintos</strong> com necessidades opostas: convidados em busca de uma experiência de marca elegante, e promotores precisando de uma ferramenta operacional rápida e sem atrito.' },
      { label: 'A Abordagem', body: 'Mapear cada jornada de forma independente e, depois, <strong>unificá-las</strong> sob um único sistema visual alinhado à key visual da campanha — garantindo consistência sem comprometer nenhuma das duas.' },
      { label: 'Meu Papel',   body: '<strong>UX/UI Designer Líder</strong> — responsável pela descoberta, mapeamento de fluxos de usuário, wireframing, prototipagem e entrega final da UI, em estreita colaboração com as equipes de marketing e produção do evento.' },
      { label: 'Impacto',     body: 'Entreguei um <strong>protótipo clicável</strong> aprovado pelos stakeholders, equilibrando estética de luxo com usabilidade operacional mobile-first para um evento ao vivo de alto perfil.' },
    ],

    goalsEyebrow: 'Objetivos do Projeto',
    goalsTitle  : 'Como era o sucesso',
    goals: [
      'Projetar uma landing page alinhada ao posicionamento premium do evento e à key visual (KV) da campanha, garantindo que a experiência digital espelhasse o luxo do evento físico.',
      'Construir um <strong>Fluxo do Convidado</strong> fluido — capturando dados do usuário e gerenciando RSVPs com elegância e atrito mínimo.',
      'Construir um <strong>Fluxo do Promotor</strong> limpo — uma interface otimizada para tablet, para que recepcionistas validassem ingressos e tokens em tempo real durante o evento.',
      'Garantir um <strong>design mobile-first</strong> em toda a experiência, já que a área de recepção dependeria inteiramente de smartphones e tablets para as operações no local.',
    ],

    flowsEyebrow: 'Fluxos de Usuário',
    flowsTitle  : 'Duas jornadas, um produto',
    flowsBody   : 'Ambos os fluxos foram mapeados de forma independente antes de serem unificados sob o mesmo sistema visual — garantindo que nenhum dos dois públicos precisasse abrir mão de nada.',
    guestTitle  : 'Jornada do Convidado',
    guestSteps  : [
      'Landing page com a KV da campanha e introdução ao evento',
      'Formulário de RSVP — captura de dados elegante e mínima',
      'Tela de confirmação com ingresso / token',
    ],
    promoterTitle: 'Jornada do Promotor',
    promoterSteps: [
      'Interface dedicada para tablet — sem distrações',
      'Validação de ingresso / token (digitação ou leitura)',
      'Confirmação de status — válido ou inválido, instantaneamente',
    ],
    flowDiagramAlt: 'Diagrama de fluxo de usuário — jornadas do Convidado e do Promotor',

    processEyebrow: 'Processo de Design',
    processTitle  : 'Do briefing ao protótipo',
    processItems: [
      { num: '01', title: 'Descoberta & Briefing',              body: 'Alinhei com as equipes de marketing e produção do evento para entender o conceito do evento, o perfil do público, os campos de dados necessários para o RSVP e as necessidades operacionais dos promotores no local. Esse alinhamento interfuncional moldou cada decisão de design que veio a seguir.' },
      { num: '02', title: 'Mapeamento de Fluxos de Usuário',     body: 'Mapeei as duas jornadas em paralelo — Convidado (RSVP) e Promotor (validação) — identificando o contexto, o ambiente de dispositivo e os momentos críticos de sucesso de cada público. Garanti zero sobreposição de complexidade entre os fluxos.' },
      { num: '03', title: 'Wireframing & Prototipagem',         body: 'Desenvolvi wireframes de baixa e alta fidelidade, com foco em storytelling visual através de tipografia, imagens da campanha e movimento para o lado do convidado — e extrema clareza e velocidade para a interface do promotor. Entreguei um protótipo clicável para aprovação dos stakeholders.' },
      { num: '04', title: 'UI Design',                          body: 'Apliquei a key visual da campanha — cores, tipografia e imagens — para criar uma estética de luxo sem sacrificar a usabilidade. A execução mobile-first garantiu que a interface do promotor funcionasse perfeitamente em smartphones e tablets durante o evento ao vivo.' },
    ],

    screensEyebrow: 'Telas de UI',
    screensTitle  : 'Design em contexto',
    altWireframes : 'Wireframes — baixa e alta fidelidade',
    altFinalUI    : 'UI final — telas do convidado e do promotor',

    learningsEyebrow: 'Principais Aprendizados',
    learningsTitle  : 'O que aprendi',
    learningCards: [
      { num: '01', title: 'Projetar para dois públicos', body: 'Um único produto atendendo dois públicos exige priorização clara do contexto e das necessidades de cada usuário — antes mesmo de a primeira tela ser desenhada.' },
      { num: '02', title: 'Luxo exige precisão',          body: 'Projetos de marcas premium não deixam espaço para aproximações. Estética e função precisam coexistir sem concessões — cada detalhe carrega o peso da marca.' },
      { num: '03', title: 'Colaboração entre equipes',   body: 'O alinhamento próximo com as equipes de logística do evento e marketing foi essencial para antecipar desafios reais de uso que nenhuma pesquisa com usuários conseguiria prever sozinha.' },
    ],

    footerLabel: 'Próximo projeto',
    footerTitle: 'Unica — Rodobens<br>Sistema de Crédito',
    footerNext : 'Próximo case',
    footerAll  : 'Todos os projetos',
    footerBar  : 'Lancôme Brasil · UX/UI Design · 2024',
  },
}

const t = computed(() => copy[lang.value] || copy['PT'])

onMounted(() => {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('lc-visible')
        observer.unobserve(entry.target)
      }
    })
  }, { threshold: 0.07, rootMargin: '0px 0px -40px 0px' })

  document.querySelectorAll('.lc-reveal').forEach(el => observer.observe(el))
})

</script>

<style>
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500;0,9..40,700;0,9..40,800&display=swap');

/* ── Root ─────────────────────────────────────────────────── */
.lc-root{font-family:'DM Sans',sans-serif;min-height:100svh;position:relative;overflow-x:hidden;transition:background .5s,color .5s;--fg-muted:#A8A6C0}
.lc-root.theme-dark{background:#070711;color:#F0EFF8}
.lc-root.theme-light{background:#F5F3FF;color:#0D0C1A;--fg-muted:#5C5A72}

.lc-grain{position:fixed;inset:0;z-index:0;pointer-events:none;opacity:.035;background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");background-size:180px}
.lc-glow{position:fixed;top:-18%;right:-12%;width:75vw;height:75vw;max-width:900px;pointer-events:none;z-index:0;background:radial-gradient(ellipse at 65% 25%,rgba(240,24,90,.1) 0%,transparent 62%)}

/* ── Layout ───────────────────────────────────────────────── */
.lc-wrap{position:relative;z-index:2;padding:0 1.5rem}
@media(min-width:640px){.lc-wrap{padding:0 3rem}}
@media(min-width:1024px){.lc-wrap{padding:0 7rem}}
@media(min-width:1400px){.lc-wrap{padding:0 10rem}}

/* ── Scroll reveal ────────────────────────────────────────── */
.lc-reveal{opacity:0;transform:translateY(28px);filter:blur(6px);transition:opacity .9s cubic-bezier(.16,1,.3,1),transform .9s cubic-bezier(.16,1,.3,1),filter .9s cubic-bezier(.16,1,.3,1)}
.lc-reveal.lc-visible{opacity:1;transform:translateY(0);filter:blur(0)}

/* ── Hero ─────────────────────────────────────────────────── */
.lc-hero{padding-top:clamp(6rem,14vw,10rem);padding-bottom:4rem}
.lc-hero-inner{display:grid;grid-template-columns:1fr;gap:3rem}
@media(min-width:900px){.lc-hero-inner{grid-template-columns:56% 1fr;align-items:center;gap:4rem}}

.lc-eyebrow{display:flex;align-items:center;gap:.5rem;font-size:.58rem;font-weight:500;letter-spacing:.16em;text-transform:uppercase;color:var(--fg-muted);margin-bottom:1.5rem}
.lc-dot{width:5px;height:5px;border-radius:50%;background:#F0185A;flex-shrink:0;animation:lc-pulse 2.5s ease-in-out infinite}

.lc-title{font-family:'Clash Display',sans-serif;font-weight:700;font-size:clamp(3rem,10vw,7rem);line-height:.88;letter-spacing:-.03em;margin-bottom:2rem}
.lc-title em{font-style:italic;color:#F0185A}

.lc-hero-meta{display:flex;flex-wrap:wrap;gap:1.5rem 2.5rem;margin-bottom:2rem}
.lc-meta-item{display:flex;flex-direction:column;gap:3px}
.lc-meta-label{font-size:.5rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;color:var(--fg-muted)}
.lc-meta-value{font-size:.875rem;font-weight:400}

.lc-rule{width:100%;height:1px;background:linear-gradient(90deg,rgba(240,24,90,.55) 0%,transparent 65%);margin-bottom:2rem}

.lc-hero-desc{font-size:clamp(1.125rem,2.2vw,1.3rem);font-weight:300;line-height:1.85;color:var(--fg-muted);max-width:46ch}

.lc-hero-img{width:100%;border-radius:0;overflow:hidden;display:none}
.lc-hero-img img{width:100%;height:100%;object-fit:cover;filter:grayscale(10%)}
@media(min-width:900px){.lc-hero-img{display:block;max-height:560px}}

/* ── Section commons ──────────────────────────────────────── */
.lc-section{margin-bottom:6rem}
.lc-section-eyebrow{font-family:'Clash Display',sans-serif;font-weight:600;font-size:.65rem;letter-spacing:.18em;text-transform:uppercase;color:#F0185A;margin-bottom:2rem;display:flex;align-items:center;gap:.75rem}
.lc-section-eyebrow::before{content:'';width:5px;height:5px;border-radius:50%;background:#F0185A;flex-shrink:0;animation:lc-pulse 2.5s ease-in-out infinite}
.lc-section-title{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1.4rem,4.5vw,2.5rem);line-height:1.1;letter-spacing:-.015em;margin-bottom:1.5rem}
.lc-section-body{font-size:clamp(1.125rem,2.2vw,1.25rem);font-weight:300;line-height:1.85;color:var(--fg-muted);max-width:55ch;margin-bottom:0}

/* ── Overview grid ────────────────────────────────────────── */
.lc-overview-grid{display:grid;grid-template-columns:1fr;gap:1.5rem 3rem;margin-top:2.5rem}
@media(min-width:640px){.lc-overview-grid{grid-template-columns:1fr 1fr}}

.lc-overview-card{border:1px solid rgba(255,255,255,.07);padding:1.5rem;transition:border-color .3s}
.theme-light .lc-overview-card{border-color:rgba(0,0,0,.08)}
.lc-overview-card:hover{border-color:rgba(240,24,90,.4)}
.lc-overview-label{font-size:.5rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;color:var(--fg-muted);margin-bottom:.75rem}
.lc-overview-body{font-size:1.125rem;font-weight:300;line-height:1.75;color:var(--fg-muted)}
.lc-overview-body strong{color:inherit;font-weight:600}
.theme-dark .lc-overview-body strong{color:#F0EFF8}
.theme-light .lc-overview-body strong{color:#0D0C1A}

/* ── Goals list ───────────────────────────────────────────── */
.lc-goals-list{list-style:none;display:flex;flex-direction:column;gap:0;margin-top:2rem}
.lc-goals-list li{display:flex;align-items:flex-start;gap:1.25rem;font-size:clamp(1.125rem,2vw,1.25rem);font-weight:300;line-height:1.75;color:var(--fg-muted);padding:1.25rem 0;border-bottom:1px solid rgba(255,255,255,.07)}
.theme-light .lc-goals-list li{border-bottom-color:rgba(0,0,0,.08)}
.lc-goals-list li:first-child{border-top:1px solid rgba(255,255,255,.07)}
.theme-light .lc-goals-list li:first-child{border-top-color:rgba(0,0,0,.08)}
.lc-goals-list strong{font-weight:600;color:#F0EFF8}
.theme-light .lc-goals-list strong{color:#0D0C1A}
.lc-goals-num{font-family:'Clash Display',sans-serif;font-size:.75rem;font-weight:700;color:#F0185A;flex-shrink:0;padding-top:3px}

/* ── Flow cards ───────────────────────────────────────────── */
.lc-flow-grid{display:grid;grid-template-columns:1fr;gap:1rem;margin-top:2rem}
@media(min-width:640px){.lc-flow-grid{grid-template-columns:1fr 1fr}}

.lc-flow-card{border:1px solid rgba(255,255,255,.07);padding:2rem;position:relative;overflow:hidden;transition:border-color .4s}
.theme-light .lc-flow-card{border-color:rgba(0,0,0,.08)}
.lc-flow-card::before{content:'';position:absolute;top:0;left:0;right:0;height:2px;background:linear-gradient(90deg,#F0185A 0%,transparent 70%);opacity:0;transition:opacity .4s}
.lc-flow-card:hover{border-color:rgba(240,24,90,.4)}
.lc-flow-card:hover::before{opacity:1}
.lc-flow-icon{font-size:1.5rem;margin-bottom:1rem;color:#F0185A}
.lc-flow-title{font-family:'Clash Display',sans-serif;font-size:1.1rem;font-weight:600;letter-spacing:-.01em;margin-bottom:.75rem}
.lc-flow-steps{list-style:none;display:flex;flex-direction:column;gap:.5rem}
.lc-flow-steps li{font-size:1.125rem;font-weight:300;color:var(--fg-muted);line-height:1.6;display:flex;align-items:flex-start;gap:.5rem}
.lc-flow-steps li::before{content:'→';color:#F0185A;font-size:.65rem;flex-shrink:0;margin-top:.3rem}

.lc-flow-diagram{margin-top:2rem}
.lc-flow-diagram img{width:100%;display:block;object-fit:cover}

/* ── Process list ─────────────────────────────────────────── */
.lc-process-list{display:flex;flex-direction:column;margin-top:2.5rem}
.lc-process-item{display:grid;grid-template-columns:60px 1fr;gap:2rem;padding:2rem 0;border-top:1px solid rgba(255,255,255,.07);transition:border-color .3s}
.theme-light .lc-process-item{border-top-color:rgba(0,0,0,.08)}
.lc-process-item:last-child{border-bottom:1px solid rgba(255,255,255,.07)}
.theme-light .lc-process-item:last-child{border-bottom-color:rgba(0,0,0,.08)}
@media(min-width:640px){.lc-process-item{grid-template-columns:80px 1fr}}

.lc-process-num{font-family:'Clash Display',sans-serif;font-size:2.5rem;font-weight:700;color:rgba(255,255,255,.06);line-height:1;transition:color .3s}
.theme-light .lc-process-num{color:rgba(0,0,0,.07)}
.lc-process-item:hover .lc-process-num{color:#F0185A}
.lc-process-title{font-family:'Clash Display',sans-serif;font-size:1.05rem;font-weight:600;letter-spacing:-.01em;margin-bottom:.75rem}
.lc-process-body{font-size:clamp(1.125rem,2vw,1.2rem);font-weight:300;line-height:1.8;color:var(--fg-muted)}

/* ── Photos grid ──────────────────────────────────────────── */
.lc-photos-grid{display:grid;grid-template-columns:1fr;gap:1rem;margin-top:2rem}
@media(min-width:640px){.lc-photos-grid{grid-template-columns:1fr 1fr}}
.lc-photo{width:100%;display:block;object-fit:cover;aspect-ratio:4/3}

/* ── Learnings grid ───────────────────────────────────────── */
.lc-learnings-grid{display:grid;grid-template-columns:1fr;gap:1rem;margin-top:2rem}
@media(min-width:640px){.lc-learnings-grid{grid-template-columns:1fr 1fr}}
@media(min-width:900px){.lc-learnings-grid{grid-template-columns:repeat(3,1fr)}}

.lc-learning-card{border:1px solid rgba(255,255,255,.07);padding:1.5rem;transition:border-color .3s,transform .4s cubic-bezier(.16,1,.3,1)}
.theme-light .lc-learning-card{border-color:rgba(0,0,0,.08)}
.lc-learning-card:hover{border-color:rgba(240,24,90,.4);transform:translateY(-4px)}
.lc-learning-num{font-family:'Clash Display',sans-serif;font-size:2rem;font-weight:700;color:#F0185A;opacity:.25;line-height:1;margin-bottom:1rem}
.lc-learning-title{font-family:'Clash Display',sans-serif;font-size:.95rem;font-weight:600;letter-spacing:-.01em;margin-bottom:.75rem}
.lc-learning-body{font-size:1.125rem;font-weight:300;line-height:1.75;color:var(--fg-muted)}

/* ── Case footer ──────────────────────────────────────────── */
.lc-case-footer{border-top:1px solid rgba(255,255,255,.07);padding:5rem 0 6rem;display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:2rem}
.theme-light .lc-case-footer{border-top-color:rgba(0,0,0,.08)}
.lc-footer-label{font-size:.55rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;color:var(--fg-muted);margin-bottom:.75rem}
.lc-footer-title{font-family:'Clash Display',sans-serif;font-size:clamp(1.2rem,3.5vw,2rem);font-weight:600;letter-spacing:-.015em}
.lc-footer-btns{display:flex;gap:1rem;flex-wrap:wrap}

/* Buttons */
.lc-btn{display:inline-flex;align-items:center;justify-content:center;height:50px;padding:0 1.75rem;text-decoration:none;font-size:.63rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;transition:background .2s,border-color .2s,color .2s;border:1px solid;min-width:160px}
.lc-arr{display:inline-block;margin-left:.35rem;transition:transform .2s ease}
.lc-btn:hover .lc-arr{transform:translateX(4px)}
.lc-btn--solid{background:#F0185A;border-color:#F0185A;color:#fff}
.lc-btn--solid:hover{background:#c9144d;border-color:#c9144d}
.lc-btn--ghost{background:transparent;border-color:rgba(255,255,255,.18);color:#F0EFF8}
.theme-light .lc-btn--ghost{border-color:rgba(0,0,0,.2);color:#0D0C1A}
.lc-btn--ghost:hover{border-color:rgba(240,24,90,.5)}

/* ── Footer bar ───────────────────────────────────────────── */
.lc-footer{position:relative;z-index:2;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:1rem;padding:1.5rem;border-top:1px solid rgba(255,255,255,.07);font-size:.55rem;font-weight:500;letter-spacing:.12em;text-transform:uppercase;color:var(--fg-muted)}
.theme-light .lc-footer{border-top-color:rgba(0,0,0,.08)}
@media(min-width:640px){.lc-footer{padding:1.5rem 3rem}}
@media(min-width:1024px){.lc-footer{padding:1.5rem 7rem}}
@media(min-width:1400px){.lc-footer{padding:1.5rem 10rem}}

/* ── Keyframes ────────────────────────────────────────────── */
@keyframes lc-pulse{0%,100%{opacity:1;transform:scale(1)}50%{opacity:.3;transform:scale(.75)}}

/* ── Case footer responsive ───────────────────────────────── */
@media(max-width:640px){.lc-case-footer{flex-direction:column;align-items:flex-start}}
</style>
