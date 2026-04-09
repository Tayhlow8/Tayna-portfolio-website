<template>
  <div :class="['ysl-root', `theme-${theme}`]">
    <div class="ysl-grain" aria-hidden="true"></div>
    <div class="ysl-glow"  aria-hidden="true"></div>

    <NavBar v-model:lang="lang" v-model:theme="theme" />

    <!-- ══════════════════════════════════════
         HERO
         ══════════════════════════════════════ -->
    <section class="ysl-wrap ysl-hero">

      <div class="ysl-hero-left">
        <div class="ysl-eyebrow">
          <span class="ysl-dot" aria-hidden="true"></span>
          {{ t.eyebrow }}
        </div>
        <div class="ysl-hero-brand">Yves Saint Laurent Beauty</div>
        <h1 class="ysl-title">
          <em>Y</em> Eau de<br>Parfum Intense
          <span class="ysl-title-sub">{{ t.titleSub }}</span>
        </h1>
        <div class="ysl-rule" aria-hidden="true"></div>
        <div class="ysl-hero-meta">
          <div class="ysl-meta-item">
            <span class="ysl-meta-label">{{ t.metaLabels.client }}</span>
            <span class="ysl-meta-value">YSL Beauty Brazil</span>
          </div>
          <div class="ysl-meta-item">
            <span class="ysl-meta-label">{{ t.metaLabels.event }}</span>
            <span class="ysl-meta-value">The Town Festival, São Paulo</span>
          </div>
          <div class="ysl-meta-item">
            <span class="ysl-meta-label">{{ t.metaLabels.scope }}</span>
            <span class="ysl-meta-value">{{ t.metaValues.scope }}</span>
          </div>
          <div class="ysl-meta-item">
            <span class="ysl-meta-label">{{ t.metaLabels.face }}</span>
            <span class="ysl-meta-value">Ben Harper</span>
          </div>
        </div>
        <div class="ysl-hero-tags">
          <span v-for="tag in t.tags" :key="tag" class="ysl-tag" :class="{ 'ysl-tag--accent': tag === t.tags[0] }">{{ tag }}</span>
        </div>
      </div>

      <div class="ysl-hero-right">
        <div class="ysl-hero-img-wrap">
          <img :src="captacao" alt="Campaign visual — YSL Y Intense" />
        </div>
      </div>

    </section>

    <!-- ══════════════════════════════════════
         CONTEXT
         ══════════════════════════════════════ -->
    <section class="ysl-wrap ysl-section ysl-reveal">
      <div class="ysl-section-eyebrow">{{ t.contextEyebrow }}</div>
      <h2 class="ysl-section-title">{{ t.contextTitle }}</h2>
      <p class="ysl-section-body">{{ t.contextBody }}</p>

      <div class="ysl-context-strip">
        <div class="ysl-context-cell">
          <div class="ysl-context-label">{{ t.contextCells.brand.label }}</div>
          <div class="ysl-context-value">YSL Beauty</div>
          <div class="ysl-context-sub">{{ t.contextCells.brand.sub }}</div>
        </div>
        <div class="ysl-context-cell">
          <div class="ysl-context-label">{{ t.contextCells.event.label }}</div>
          <div class="ysl-context-value">The Town</div>
          <div class="ysl-context-sub">{{ t.contextCells.event.sub }}</div>
        </div>
        <div class="ysl-context-cell">
          <div class="ysl-context-label">{{ t.contextCells.ambassador.label }}</div>
          <div class="ysl-context-value">Ben Harper</div>
          <div class="ysl-context-sub">{{ t.contextCells.ambassador.sub }}</div>
        </div>
        <div class="ysl-context-cell">
          <div class="ysl-context-label">{{ t.contextCells.goal.label }}</div>
          <div class="ysl-context-value">{{ t.contextCells.goal.value }}</div>
          <div class="ysl-context-sub">{{ t.contextCells.goal.sub }}</div>
        </div>
      </div>
    </section>

    <!-- ══════════════════════════════════════
         CHALLENGE
         ══════════════════════════════════════ -->
    <section class="ysl-wrap ysl-section ysl-reveal">
      <div class="ysl-section-eyebrow">{{ t.challengeEyebrow }}</div>
      <h2 class="ysl-section-title">{{ t.challengeTitle }}</h2>

      <div class="ysl-challenge-block">
        <div class="ysl-challenge-quote" v-html="t.challengeQuote"></div>
        <p class="ysl-challenge-footnote">{{ t.challengeFootnote }}</p>
      </div>
    </section>

    <!-- ══════════════════════════════════════
         THE REAL WORK — innovation + scroll diagram
         ══════════════════════════════════════ -->
    <section class="ysl-wrap ysl-section ysl-reveal">
      <div class="ysl-section-eyebrow">{{ t.realWorkEyebrow }}</div>

      <div class="ysl-innovation-grid">
        <div class="ysl-innovation-left">
          <div class="ysl-innovation-tag">
            <span class="ysl-dot" style="animation:none;opacity:1" aria-hidden="true"></span>
            {{ t.innovationTag }}
          </div>
          <h2 class="ysl-innovation-title" v-html="t.innovationTitle"></h2>
          <p class="ysl-innovation-body" v-html="t.innovationBody1"></p>
          <p class="ysl-innovation-body" v-html="t.innovationBody2"></p>
        </div>

        <div class="ysl-scroll-diagram" ref="diagRef">
          <div class="ysl-scroll-diagram-label">{{ t.diagLabel }}</div>
          <div class="ysl-scroll-viz">
            <div class="ysl-scroll-row">
              <div class="ysl-scroll-icon">↕</div>
              <span class="ysl-scroll-arrow">→</span>
              <div style="flex:1">
                <div class="ysl-scroll-cap-top">{{ t.diagScrollProgress }}</div>
                <div class="ysl-bar-wrap"><div class="ysl-bar-fill" :style="{ width: diagVisible ? '72%' : '0%' }"></div></div>
              </div>
              <span class="ysl-scroll-cap">72%</span>
            </div>
            <div class="ysl-scroll-row" style="margin-top:.5rem">
              <div class="ysl-scroll-icon ysl-scroll-icon--accent">▶</div>
              <span class="ysl-scroll-arrow">→</span>
              <div style="flex:1">
                <div class="ysl-scroll-cap-top">{{ t.diagVideoFrame }}</div>
                <div class="ysl-bar-wrap"><div class="ysl-bar-fill" :style="{ width: diagVisible ? '72%' : '0%' }"></div></div>
              </div>
              <span class="ysl-scroll-cap">frame 86/120</span>
            </div>
            <div class="ysl-scroll-results">
              <div class="ysl-scroll-cap-top" style="margin-bottom:.75rem">{{ t.diagResult }}</div>
              <div style="display:flex;gap:.75rem;flex-wrap:wrap">
                <span v-for="tag in t.diagResultTags" :key="tag.label"
                  class="ysl-result-tag"
                  :class="{ 'ysl-result-tag--accent': tag.accent }">{{ tag.label }}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- ══════════════════════════════════════
         PROCESS
         ══════════════════════════════════════ -->
    <section class="ysl-wrap ysl-section ysl-reveal">
      <div class="ysl-section-eyebrow">{{ t.processEyebrow }}</div>
      <h2 class="ysl-section-title" v-html="t.processTitle"></h2>

      <div class="ysl-process-list">
        <div v-for="item in t.processItems" :key="item.num" class="ysl-process-item">
          <div class="ysl-process-num">{{ item.num }}</div>
          <div class="ysl-process-content">
            <div class="ysl-process-title">{{ item.title }}</div>
            <p class="ysl-process-body" v-html="item.body"></p>
          </div>
        </div>
      </div>
    </section>

    <!-- ══════════════════════════════════════
         UI SCREENS
         ══════════════════════════════════════ -->
    <section class="ysl-wrap ysl-section ysl-reveal">
      <div class="ysl-section-eyebrow">{{ t.screensEyebrow }}</div>
      <h2 class="ysl-section-title">{{ t.screensTitle }}</h2>

      <div class="ysl-photos-grid">
        <img :src="captacao"   :alt="t.altCaptacao"   class="ysl-photo ysl-photo--full" />
        <img :src="desktopExp" :alt="t.altDesktop"    class="ysl-photo" />
        <img :src="mobileExp"  :alt="t.altMobile"     class="ysl-photo" />
      </div>
    </section>

    <!-- ══════════════════════════════════════
         MORE YSL WORK
         ══════════════════════════════════════ -->
    <section class="ysl-wrap ysl-section ysl-reveal">
      <div class="ysl-section-eyebrow">{{ t.moreEyebrow }}</div>
      <h2 class="ysl-section-title" v-html="t.moreTitle"></h2>
      <p class="ysl-section-body">{{ t.moreBody }}</p>

      <div class="ysl-more-grid">

        <div class="ysl-more-card">
          <div class="ysl-more-img">
            <img :src="duaLipa" alt="YSL Libre — Dua Lipa campaign" />
          </div>
          <div class="ysl-more-info">
            <div class="ysl-more-label">{{ t.card1.label }}</div>
            <div class="ysl-more-title">{{ t.card1.title }}</div>
            <p class="ysl-more-body">{{ t.card1.body }}</p>
            <div class="ysl-more-tags">
              <span v-for="tag in t.card1.tags" :key="tag" class="ysl-tag">{{ tag }}</span>
            </div>
          </div>
        </div>

        <div class="ysl-more-card ysl-more-card--reverse">
          <div class="ysl-more-img">
            <img :src="ecommYsl" alt="YSL E-commerce Brazil launch" />
          </div>
          <div class="ysl-more-info">
            <div class="ysl-more-label">{{ t.card2.label }}</div>
            <div class="ysl-more-title">{{ t.card2.title }}</div>
            <p class="ysl-more-body">{{ t.card2.body }}</p>
            <div class="ysl-more-tags">
              <span v-for="tag in t.card2.tags" :key="tag" class="ysl-tag">{{ tag }}</span>
            </div>
          </div>
        </div>

      </div>
    </section>

    <!-- ══════════════════════════════════════
         LEARNINGS
         ══════════════════════════════════════ -->
    <section class="ysl-wrap ysl-section ysl-reveal">
      <div class="ysl-section-eyebrow">{{ t.learningsEyebrow }}</div>
      <h2 class="ysl-section-title">{{ t.learningsTitle }}</h2>

      <div class="ysl-learnings-grid">
        <div v-for="card in t.learningCards" :key="card.num" class="ysl-learning-card">
          <div class="ysl-learning-num">{{ card.num }}</div>
          <div class="ysl-learning-title">{{ card.title }}</div>
          <p class="ysl-learning-body">{{ card.body }}</p>
        </div>
      </div>
    </section>

    <!-- ══════════════════════════════════════
         FOOTER CTA
         ══════════════════════════════════════ -->
    <div class="ysl-wrap ysl-reveal">
      <div class="ysl-case-footer">
        <div>
          <div class="ysl-footer-label">{{ t.footerLabel }}</div>
          <div class="ysl-footer-title" v-html="t.footerTitle"></div>
        </div>
        <div class="ysl-footer-btns">
          <router-link to="/projetos/lancome-brazil" class="ysl-btn ysl-btn--solid">
            {{ t.footerNext }} <span class="ysl-arr">→</span>
          </router-link>
          <router-link to="/" class="ysl-btn ysl-btn--ghost">
            {{ t.footerAll }}
          </router-link>
        </div>
      </div>
    </div>

    <footer class="ysl-footer-bar">
      <span>{{ t.footerBar }}</span>
      <span>© 2026 Tayná Schultz</span>
    </footer>

    <!-- Back to top -->
    <button class="btt-btn" :class="{ 'btt-btn--visible': showBtt }" @click="scrollToTop" aria-label="Voltar ao topo">
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="18 15 12 9 6 15"/></svg>
    </button>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted, computed } from 'vue'
import NavBar from './NavBar.vue'

import captacao   from '../imagens cases/YSL Y intense/captação 1.webp'
import mobileExp  from '../imagens cases/YSL Y intense/mobile exp.avif'
import desktopExp from '../imagens cases/YSL Y intense/desktop exp.webp'
import duaLipa    from '../imagens cases/YSL Y intense/dua lipa.png'
import ecommYsl   from '../imagens cases/YSL Y intense/ecomm ysl.png'

const props = defineProps({
  lang  : { type: String, default: 'PT' },
  theme : { type: String, default: 'dark' },
})

const lang  = ref(props.lang)
const theme = ref(props.theme)

const diagRef     = ref(null)
const diagVisible = ref(false)

// ── Translations ──────────────────────────────────────────────
const copy = {
  EN: {
    eyebrow    : 'UX/UI Design · Luxury Tech',
    titleSub   : 'Brazil Launch',
    metaLabels : { client: 'Client', event: 'Event', scope: 'Scope', face: 'Face of Campaign' },
    metaValues : { scope: 'Landing Page · Lead Capture' },
    tags: ['Design–dev collaboration', 'Tight deadline', 'Scroll animation', 'Mobile-first'],

    contextEyebrow : 'Context',
    contextTitle   : "Where luxury met rock 'n' roll",
    contextBody    : 'The launch of Y EAU DE PARFUM INTENSE in Brazil was positioned around a unique collision of worlds — a heritage luxury fragrance brand activating at the country\'s biggest rock festival, with Grammy-winning artist Ben Harper as its face.',
    contextCells: {
      brand      : { label: 'Brand',      sub: 'Luxury fragrance, Paris' },
      event      : { label: 'Event',      sub: "São Paulo's rock festival" },
      ambassador : { label: 'Ambassador', sub: 'Face of the Brazil launch' },
      goal       : { label: 'Goal', value: 'Lead Capture', sub: 'High-intent audience acquisition' },
    },

    challengeEyebrow  : 'The Challenge',
    challengeTitle    : 'An experience worth stopping for',
    challengeQuote    : '"The tool couldn\'t show what the idea was.<br>So I <em>went to where the idea was being built.</em>"',
    challengeFootnote : 'The scroll-driven video animation — where the user\'s scroll position drives a frame-by-frame video playback, exactly like Apple does for hardware launches — was a first for a Brazilian beauty brand. The problem: Figma had no way to prototype this accurately. With a tight campaign deadline and no time to iterate through static handoffs, I made the call to step into the development process directly, working side-by-side with the developer until the experience felt right on every device.',

    realWorkEyebrow  : 'The Real Work',
    innovationTag    : 'Deadline pressure · Cross-functional delivery',
    innovationTitle  : "When the prototype<br>isn't enough, you<br>ship alongside the dev",
    innovationBody1  : 'The centrepiece of the page was a scroll-driven video animation — as the user scrolls, the Y fragrance bottle animates frame by frame, cinematic and precise. <strong>Figma couldn\'t prototype this with accuracy.</strong> No static handoff would communicate what needed to happen.',
    innovationBody2  : 'With the campaign date locked and no room to iterate through rounds of misaligned feedback, I made the call to <strong>embed directly in the build</strong>. I sat with the developer through implementation — reviewing each scroll state in the browser, adjusting timing, catching edge cases on mobile — until the animation felt exactly right. The result was a fluid experience that held up on smartphones in the middle of a rock festival crowd.',
    diagLabel         : 'Scroll position → Video frame progress',
    diagScrollProgress: 'Scroll progress',
    diagVideoFrame    : 'Video frame',
    diagResult        : 'Result',
    diagResultTags    : [
      { label: 'Fluid on mobile', accent: false },
      { label: 'No JS jank',      accent: false },
      { label: 'Launch success',  accent: true  },
    ],

    processEyebrow : 'Design Process',
    processTitle   : 'Design under pressure,<br>delivered with precision',
    processItems   : [
      { num: '01', title: 'Brief & Alignment',          body: 'Aligned with YSL Beauty Brazil\'s marketing team on campaign goals, audience profile, and lead data requirements. Mapped the product positioning — a premium fragrance at a rock festival — as the core creative tension to design around.' },
      { num: '02', title: 'Conceptual Direction',       body: 'Defined the scroll-driven video animation as the hero interaction — a <strong>cinematic product reveal</strong> that puts the Y bottle center-stage before asking anything of the user. This reversed the typical lead-capture logic: experience first, form second.' },
      { num: '03', title: 'Wireframing & UI Design',    body: 'Delivered high-fidelity UI screens applying the campaign KV — typography, colors, and Ben Harper\'s visual identity. Designed the full page flow: scroll animation zone, brand storytelling, and the lead capture form with YSL\'s luxury aesthetic.' },
      { num: '04', title: 'Embedded Dev Collaboration', body: 'Rather than hand off files and wait for feedback rounds, I embedded directly in the development process. Worked shoulder-to-shoulder with the developer: reviewing scroll states in the browser, adjusting easing curves, testing on real mobile devices. <strong>This was the project where I learned that the best handoff is sometimes no handoff at all</strong> — just being in the room until it\'s right.' },
    ],

    screensEyebrow : 'UI Screens',
    screensTitle   : 'The final product',
    altCaptacao    : 'Lead capture landing page — YSL Y Intense',
    altDesktop     : 'Desktop experience — brand storytelling',
    altMobile      : 'Mobile experience — lead capture form',

    moreEyebrow : 'More work for YSL Brazil',
    moreTitle   : 'Two more campaigns,<br>same client trust',
    moreBody    : 'The Y Intense launch opened the door to further work with YSL Beauty Brazil — two additional lead capture pages, each with its own campaign identity and moment.',
    card1: {
      label : 'Campaign 02',
      title : 'Libre — Dua Lipa',
      body  : 'Lead capture landing page for the Libre fragrance launch featuring Dua Lipa as campaign face. Designed to capture the energy of the artist while maintaining YSL\'s signature luxury positioning.',
      tags  : ['Lead capture', 'Campaign KV'],
    },
    card2: {
      label : 'Campaign 03',
      title : 'YSL E-commerce — Brazil Launch',
      body  : "Landing page announcing YSL Beauty's direct e-commerce arrival in Brazil — a landmark moment for the brand in the country. Designed to build anticipation and capture high-intent leads ahead of the store opening.",
      tags  : ['E-commerce', 'Brand milestone'],
    },

    learningsEyebrow : 'Key Takeaways',
    learningsTitle   : 'What this project taught me',
    learningCards    : [
      { num: '01', title: 'The best handoff is presence',    body: 'When the prototype can\'t capture the intent and the deadline is real, being in the room with the developer beats any annotation or spec doc. Proximity closes gaps faster than documentation.' },
      { num: '02', title: 'Pressure is a design constraint', body: 'A tight timeline forced a smarter process — no back-and-forth cycles, no waiting. Pressure clarified what mattered: the scroll feeling right on mobile, nothing else.' },
      { num: '03', title: 'Design doesn\'t end at the file', body: 'Owning quality through implementation — not just design — is what separates a good designer from a great collaborator. The launch success came from not letting go of the work at handoff.' },
    ],

    footerLabel : 'Next project',
    footerTitle : 'Lancôme Brazil —<br>Sensorial Experience',
    footerNext  : 'Next case',
    footerAll   : 'All projects',
    footerBar   : 'YSL Beauty Brazil · UX/UI Design · 2024',
  },

  PT: {
    eyebrow    : 'UX/UI Design · Luxury Tech',
    titleSub   : 'Lançamento no Brasil',
    metaLabels : { client: 'Cliente', event: 'Evento', scope: 'Escopo', face: 'Rosto da Campanha' },
    metaValues : { scope: 'Landing Page · Captura de Leads' },
    tags: ['Colaboração design-dev', 'Prazo apertado', 'Scroll animation', 'Mobile-first'],

    contextEyebrow : 'Contexto',
    contextTitle   : 'Quando o luxo encontrou o rock',
    contextBody    : 'O lançamento do Y EAU DE PARFUM INTENSE no Brasil foi posicionado em torno de uma colisão única de mundos — uma marca de fragrâncias de luxo com história ativando no maior festival de rock do país, com o artista vencedor do Grammy, Ben Harper, como rosto da campanha.',
    contextCells: {
      brand      : { label: 'Marca',       sub: 'Fragrância de luxo, Paris' },
      event      : { label: 'Evento',      sub: 'Festival de rock de São Paulo' },
      ambassador : { label: 'Embaixador',  sub: 'Rosto do lançamento no Brasil' },
      goal       : { label: 'Objetivo', value: 'Captura de Leads', sub: 'Aquisição de público de alto interesse' },
    },

    challengeEyebrow  : 'O Desafio',
    challengeTitle    : 'Uma experiência que vale a parada',
    challengeQuote    : '"A ferramenta não conseguia mostrar a ideia.<br>Então eu <em>fui até onde a ideia estava sendo construída.</em>"',
    challengeFootnote : 'A animação de vídeo guiada pelo scroll — onde a posição do scroll controla a reprodução quadro a quadro, exatamente como a Apple faz nos lançamentos de hardware — foi uma novidade para uma marca de beleza brasileira. O problema: o Figma não tinha como prototipar isso com fidelidade. Com prazo apertado e sem espaço para iterar por handoffs estáticos, tomei a decisão de entrar direto no processo de desenvolvimento, trabalhando lado a lado com o dev até que a experiência ficasse certa em todos os dispositivos.',

    realWorkEyebrow  : 'O Trabalho de Verdade',
    innovationTag    : 'Pressão de prazo · Entrega interfuncional',
    innovationTitle  : 'Quando o protótipo<br>não é suficiente, você<br>entrega junto com o dev',
    innovationBody1  : 'O centro da página era uma animação de vídeo guiada pelo scroll — conforme o usuário rola, o frasco Y anima quadro a quadro, cinematográfico e preciso. <strong>O Figma não conseguia prototipar isso com fidelidade.</strong> Nenhum handoff estático comunicaria o que precisava acontecer.',
    innovationBody2  : 'Com a data da campanha bloqueada e sem espaço para rodadas de feedback desalinhado, tomei a decisão de <strong>me integrar diretamente à construção</strong>. Fiquei com o desenvolvedor durante a implementação — revisando cada estado de scroll no navegador, ajustando o timing, identificando casos extremos no mobile — até que a animação parecesse exatamente certa. O resultado foi uma experiência fluida que funcionou em smartphones no meio de uma multidão no festival.',
    diagLabel         : 'Posição do scroll → Progresso do frame do vídeo',
    diagScrollProgress: 'Progresso do scroll',
    diagVideoFrame    : 'Frame do vídeo',
    diagResult        : 'Resultado',
    diagResultTags    : [
      { label: 'Fluido no mobile',        accent: false },
      { label: 'Sem travamentos',         accent: false },
      { label: 'Lançamento com sucesso',  accent: true  },
    ],

    processEyebrow : 'Processo de Design',
    processTitle   : 'Design sob pressão,<br>entregue com precisão',
    processItems   : [
      { num: '01', title: 'Brief & Alinhamento',          body: 'Aliniei com a equipe de marketing da YSL Beauty Brasil os objetivos da campanha, o perfil do público e os requisitos dos dados de lead. Mapeei o posicionamento do produto — uma fragrância premium em um festival de rock — como a tensão criativa central ao redor da qual projetar.' },
      { num: '02', title: 'Direção Conceitual',           body: 'Defini a animação de vídeo guiada pelo scroll como a interação principal — uma <strong>revelação cinematográfica do produto</strong> que coloca o frasco Y no centro antes de pedir qualquer coisa ao usuário. Isso inverteu a lógica típica de captura de leads: experiência primeiro, formulário depois.' },
      { num: '03', title: 'Wireframing & UI Design',      body: 'Entreguei telas de UI em alta fidelidade aplicando o KV da campanha — tipografia, cores e a identidade visual de Ben Harper. Projetei o fluxo completo da página: zona de animação em scroll, narrativa de marca e formulário de captura de leads com a estética de luxo da YSL.' },
      { num: '04', title: 'Colaboração Embarcada com o Dev', body: 'Em vez de entregar arquivos e esperar por rodadas de feedback, me inseri diretamente no processo de desenvolvimento. Trabalhei ombro a ombro com o desenvolvedor: revisando estados de scroll no navegador, ajustando curvas de easing, testando em dispositivos reais. <strong>Foi nesse projeto que aprendi que o melhor handoff às vezes é não ter handoff nenhum</strong> — estar na sala até que esteja certo.' },
    ],

    screensEyebrow : 'Telas de UI',
    screensTitle   : 'O produto final',
    altCaptacao    : 'Landing page de captura de leads — YSL Y Intense',
    altDesktop     : 'Experiência desktop — narrativa de marca',
    altMobile      : 'Experiência mobile — formulário de captura',

    moreEyebrow : 'Mais trabalhos para YSL Brasil',
    moreTitle   : 'Mais duas campanhas,<br>a mesma confiança do cliente',
    moreBody    : 'O lançamento do Y Intense abriu as portas para mais trabalhos com a YSL Beauty Brasil — mais duas landing pages de captura de leads, cada uma com sua própria identidade de campanha.',
    card1: {
      label : 'Campanha 02',
      title : 'Libre — Dua Lipa',
      body  : 'Landing page de captura de leads para o lançamento da fragrância Libre com Dua Lipa como rosto da campanha. Projetada para capturar a energia da artista mantendo o posicionamento de luxo da YSL.',
      tags  : ['Captura de leads', 'KV da campanha'],
    },
    card2: {
      label : 'Campanha 03',
      title : 'YSL E-commerce — Lançamento no Brasil',
      body  : 'Landing page anunciando a chegada do e-commerce direto da YSL Beauty no Brasil — um marco histórico para a marca no país. Projetada para gerar expectativa e capturar leads de alto interesse antes da abertura da loja.',
      tags  : ['E-commerce', 'Marco da marca'],
    },

    learningsEyebrow : 'Aprendizados',
    learningsTitle   : 'O que esse projeto me ensinou',
    learningCards    : [
      { num: '01', title: 'O melhor handoff é presença',    body: 'Quando o protótipo não captura a intenção e o prazo é real, estar na sala com o desenvolvedor supera qualquer anotação ou documento de spec. Proximidade fecha lacunas mais rápido do que documentação.' },
      { num: '02', title: 'Pressão é uma restrição de design', body: 'Um prazo apertado forçou um processo mais inteligente — sem ciclos de vai-e-vem, sem esperas. A pressão clarificou o que importava: o scroll funcionando bem no mobile, nada mais.' },
      { num: '03', title: 'O design não termina no arquivo', body: 'Ter a qualidade sob controle durante a implementação — não apenas no design — é o que separa um bom designer de um ótimo colaborador. O sucesso do lançamento veio de não largar o trabalho no momento do handoff.' },
    ],

    footerLabel : 'Próximo projeto',
    footerTitle : 'Lancôme Brasil —<br>Experiência Sensorial',
    footerNext  : 'Próximo case',
    footerAll   : 'Todos os projetos',
    footerBar   : 'YSL Beauty Brasil · UX/UI Design · 2024',
  },
}

const t = computed(() => copy[lang.value] || copy['PT'])

onMounted(() => {
  // Scroll reveal
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('ysl-visible')
        observer.unobserve(entry.target)
      }
    })
  }, { threshold: 0.08, rootMargin: '0px 0px -40px 0px' })
  document.querySelectorAll('.ysl-reveal').forEach(el => observer.observe(el))

  // Scroll diagram bar animation
  if (diagRef.value) {
    const diagObs = new IntersectionObserver((entries) => {
      entries.forEach(e => {
        if (e.isIntersecting) {
          setTimeout(() => { diagVisible.value = true }, 300)
          diagObs.unobserve(e.target)
        }
      })
    }, { threshold: 0.3 })
    diagObs.observe(diagRef.value)
  }
})

// ── Back to top ───────────────────────────────────────────────
const showBtt = ref(false)
function onScrollBtt () {
  const scrolled = window.scrollY / (document.documentElement.scrollHeight - window.innerHeight)
  showBtt.value = scrolled >= (window.innerWidth < 768 ? 0.30 : 0.65)
}
function scrollToTop () { window.scrollTo({ top: 0, behavior: 'smooth' }) }
onMounted(()   => window.addEventListener('scroll', onScrollBtt, { passive: true }))
onUnmounted(() => window.removeEventListener('scroll', onScrollBtt))
</script>

<style>
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500;0,9..40,700;0,9..40,800&display=swap');

/* ── Root ─────────────────────────────────────────────────── */
.ysl-root{font-family:'DM Sans',sans-serif;min-height:100svh;position:relative;overflow-x:hidden;transition:background .5s,color .5s;--fg-muted:#A8A6C0}
.ysl-root.theme-dark{background:#070711;color:#F0EFF8}
.ysl-root.theme-light{background:#F5F3FF;color:#0D0C1A;--fg-muted:#5C5A72}

.ysl-grain{position:fixed;inset:0;z-index:0;pointer-events:none;opacity:.035;background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");background-size:180px}
.ysl-glow{position:fixed;top:-10%;right:-10%;width:70vw;height:70vw;max-width:800px;pointer-events:none;z-index:0;background:radial-gradient(ellipse at 70% 20%,rgba(240,24,90,.12) 0%,transparent 60%)}

/* ── Layout wrap ──────────────────────────────────────────── */
.ysl-wrap{position:relative;z-index:2;padding:0 1.5rem}
@media(min-width:640px){.ysl-wrap{padding:0 3rem}}
@media(min-width:1024px){.ysl-wrap{padding:0 7rem}}
@media(min-width:1400px){.ysl-wrap{padding:0 10rem}}

/* ── Scroll reveal ────────────────────────────────────────── */
.ysl-reveal{opacity:0;transform:translateY(28px);filter:blur(6px);transition:opacity .9s cubic-bezier(.16,1,.3,1),transform .9s cubic-bezier(.16,1,.3,1),filter .9s cubic-bezier(.16,1,.3,1)}
.ysl-reveal.ysl-visible{opacity:1;transform:translateY(0);filter:blur(0)}

/* ── Hero ─────────────────────────────────────────────────── */
.ysl-hero{
  min-height:100svh;
  display:grid;grid-template-columns:1fr;
  align-items:end;gap:3rem;
  padding-top:clamp(6rem,14vw,10rem);padding-bottom:4rem;
}
@media(min-width:900px){.ysl-hero{grid-template-columns:1fr 1fr;gap:3rem}}

.ysl-eyebrow{display:flex;align-items:center;gap:.5rem;font-size:.6rem;font-weight:500;letter-spacing:.16em;text-transform:uppercase;color:var(--fg-muted);margin-bottom:1.5rem}
.ysl-dot{width:5px;height:5px;border-radius:50%;background:#F0185A;flex-shrink:0;animation:ysl-pulse 2.5s ease-in-out infinite}
.ysl-hero-brand{font-family:'Clash Display',sans-serif;font-weight:700;font-size:clamp(.65rem,1.8vw,.85rem);letter-spacing:.3em;text-transform:uppercase;color:var(--fg-muted);margin-bottom:1rem}
.ysl-title{font-family:'Clash Display',sans-serif;font-weight:700;font-size:clamp(2.8rem,9vw,6rem);line-height:.88;letter-spacing:-.025em;margin-bottom:2rem}
.ysl-title em{font-style:italic;color:#F0185A}
.ysl-title-sub{display:block;font-size:clamp(1rem,3vw,1.8rem);font-weight:400;letter-spacing:.02em;color:var(--fg-muted);margin-top:.75rem}
.ysl-rule{width:100%;height:1px;background:linear-gradient(90deg,rgba(240,24,90,.55) 0%,transparent 65%);margin-bottom:2rem}
.ysl-hero-meta{display:flex;flex-wrap:wrap;gap:1.5rem;margin-bottom:2rem}
.ysl-meta-item{display:flex;flex-direction:column;gap:3px}
.ysl-meta-label{font-size:.5rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;color:var(--fg-muted)}
.ysl-meta-value{font-size:.75rem;font-weight:400}
.ysl-hero-tags{display:flex;flex-wrap:wrap;gap:.5rem}
.ysl-tag{display:inline-flex;align-items:center;padding:.25rem .75rem;border:1px solid rgba(255,255,255,.07);font-size:.5rem;font-weight:500;letter-spacing:.12em;text-transform:uppercase;color:var(--fg-muted)}
.theme-light .ysl-tag{border-color:rgba(0,0,0,.1)}
.ysl-tag--accent{border-color:rgba(240,24,90,.4);color:#F0185A}

.ysl-hero-right{position:relative}
.ysl-hero-img-wrap{position:relative}
.ysl-hero-img-wrap::after{content:'';position:absolute;bottom:0;left:0;right:0;height:40%;background:linear-gradient(to top,var(--bg-hero,#070711) 0%,transparent 100%);pointer-events:none}
.theme-light .ysl-hero-img-wrap::after{background:linear-gradient(to top,#F5F3FF 0%,transparent 100%)}
.ysl-hero-img-wrap img{width:100%;display:block;object-fit:cover}

/* ── Section commons ──────────────────────────────────────── */
.ysl-section{margin-bottom:6rem}
.ysl-section-eyebrow{font-family:'Clash Display',sans-serif;font-weight:600;font-size:.65rem;letter-spacing:.18em;text-transform:uppercase;color:#F0185A;margin-bottom:2rem;display:flex;align-items:center;gap:.75rem}
.ysl-section-eyebrow::before{content:'';width:5px;height:5px;border-radius:50%;background:#F0185A;flex-shrink:0;animation:ysl-pulse 2.5s ease-in-out infinite}
.ysl-section-title{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1.4rem,4.5vw,2.5rem);line-height:1.1;letter-spacing:-.015em;margin-bottom:1.5rem}
.ysl-section-body{font-size:clamp(1.125rem,2.2vw,1.25rem);font-weight:300;line-height:1.85;color:var(--fg-muted);max-width:55ch}

/* ── Context strip ────────────────────────────────────────── */
.ysl-context-strip{display:grid;grid-template-columns:repeat(4,1fr);gap:1px;background:rgba(255,255,255,.07);border:1px solid rgba(255,255,255,.07);margin-top:2.5rem}
.theme-light .ysl-context-strip{background:rgba(0,0,0,.07);border-color:rgba(0,0,0,.07)}
@media(max-width:900px){.ysl-context-strip{grid-template-columns:1fr 1fr}}
@media(max-width:640px){.ysl-context-strip{grid-template-columns:1fr}}
.ysl-context-cell{padding:1.5rem;transition:background .3s}
.theme-dark .ysl-context-cell{background:#070711}
.theme-light .ysl-context-cell{background:#F5F3FF}
.ysl-context-cell:hover{background:rgba(240,24,90,.04)}
.ysl-context-label{font-size:.45rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;color:var(--fg-muted);margin-bottom:.5rem}
.ysl-context-value{font-family:'Clash Display',sans-serif;font-size:.95rem;font-weight:600;line-height:1.2}
.ysl-context-sub{font-size:.7rem;font-weight:300;color:var(--fg-muted);margin-top:.25rem}

/* ── Challenge block ──────────────────────────────────────── */
.ysl-challenge-block{border:1px solid rgba(255,255,255,.07);padding:2.5rem 3rem;position:relative;overflow:hidden;margin-top:2.5rem}
.theme-light .ysl-challenge-block{border-color:rgba(0,0,0,.08)}
@media(max-width:640px){.ysl-challenge-block{padding:1.5rem}}
.ysl-challenge-block::before{content:'';position:absolute;top:0;left:0;width:2px;height:100%;background:linear-gradient(to bottom,#F0185A 0%,transparent 100%)}
.ysl-challenge-block::after{content:'';position:absolute;inset:0;background:radial-gradient(ellipse at 0% 50%,rgba(240,24,90,.12) 0%,transparent 55%);pointer-events:none}
.ysl-challenge-quote{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1.1rem,3vw,1.7rem);line-height:1.3;letter-spacing:-.015em;position:relative;z-index:1}
.ysl-challenge-quote em{font-style:italic;color:#F0185A}
.ysl-challenge-footnote{margin-top:1.5rem;font-size:clamp(1.125rem,2vw,1.15rem);font-weight:300;line-height:1.75;color:var(--fg-muted);max-width:60ch;position:relative;z-index:1}

/* ── Innovation grid ──────────────────────────────────────── */
.ysl-innovation-grid{display:grid;grid-template-columns:1fr;gap:2rem;margin-top:2.5rem}
@media(min-width:900px){.ysl-innovation-grid{grid-template-columns:1fr 1fr;gap:2rem;align-items:center}}
.ysl-innovation-tag{display:inline-flex;align-items:center;gap:.5rem;padding:.25rem .75rem;border:1px solid rgba(240,24,90,.4);font-size:.5rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;color:#F0185A;margin-bottom:1.5rem}
.ysl-innovation-title{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1.1rem,3.5vw,1.8rem);line-height:1.15;letter-spacing:-.015em;margin-bottom:1.5rem}
.ysl-innovation-body{font-size:clamp(1.125rem,2vw,1.15rem);font-weight:300;line-height:1.85;color:var(--fg-muted);margin-bottom:1.5rem}
.ysl-innovation-body strong{font-weight:600}
.theme-dark .ysl-innovation-body strong{color:#F0EFF8}
.theme-light .ysl-innovation-body strong{color:#0D0C1A}

/* Scroll diagram */
.ysl-scroll-diagram{border:1px solid rgba(255,255,255,.07);padding:2rem;position:relative;overflow:hidden}
.theme-light .ysl-scroll-diagram{border-color:rgba(0,0,0,.08)}
.ysl-scroll-diagram::before{content:'';position:absolute;inset:0;background:radial-gradient(ellipse at 50% 0%,rgba(240,24,90,.07) 0%,transparent 60%)}
.ysl-scroll-diagram-label{font-size:.5rem;letter-spacing:.12em;text-transform:uppercase;color:var(--fg-muted);margin-bottom:1.5rem;position:relative;z-index:1}
.ysl-scroll-viz{position:relative;z-index:1;display:flex;flex-direction:column;gap:1rem}
.ysl-scroll-row{display:flex;align-items:center;gap:1rem}
.ysl-scroll-icon{width:32px;height:32px;border:1px solid rgba(255,255,255,.07);display:flex;align-items:center;justify-content:center;flex-shrink:0;color:var(--fg-muted);font-size:.7rem}
.theme-light .ysl-scroll-icon{border-color:rgba(0,0,0,.1)}
.ysl-scroll-icon--accent{border-color:rgba(240,24,90,.4);color:#F0185A}
.ysl-scroll-arrow{color:#F0185A;font-size:.75rem;flex-shrink:0}
.ysl-bar-wrap{height:3px;background:rgba(255,255,255,.06);position:relative;border-radius:0}
.theme-light .ysl-bar-wrap{background:rgba(0,0,0,.08)}
.ysl-bar-fill{height:100%;background:linear-gradient(90deg,#F0185A,rgba(240,24,90,.4));transition:width .6s cubic-bezier(.16,1,.3,1)}
.ysl-scroll-cap-top{font-size:.5rem;letter-spacing:.1em;text-transform:uppercase;color:var(--fg-muted);margin-bottom:.5rem}
.ysl-scroll-cap{font-size:.5rem;letter-spacing:.1em;text-transform:uppercase;color:var(--fg-muted);white-space:nowrap}
.ysl-scroll-results{margin-top:1.5rem;padding-top:1rem;border-top:1px solid rgba(255,255,255,.07)}
.theme-light .ysl-scroll-results{border-top-color:rgba(0,0,0,.08)}
.ysl-result-tag{padding:.25rem .75rem;border:1px solid rgba(255,255,255,.07);font-size:.5rem;letter-spacing:.1em;text-transform:uppercase;color:var(--fg-muted)}
.theme-light .ysl-result-tag{border-color:rgba(0,0,0,.1)}
.ysl-result-tag--accent{border-color:rgba(240,24,90,.4);color:#F0185A}

/* ── Process ──────────────────────────────────────────────── */
.ysl-process-list{display:flex;flex-direction:column;margin-top:2.5rem}
.ysl-process-item{display:grid;grid-template-columns:60px 1fr;gap:2rem;padding:2rem 0;border-top:1px solid rgba(255,255,255,.07)}
.theme-light .ysl-process-item{border-top-color:rgba(0,0,0,.08)}
.ysl-process-item:last-child{border-bottom:1px solid rgba(255,255,255,.07)}
.theme-light .ysl-process-item:last-child{border-bottom-color:rgba(0,0,0,.08)}
@media(min-width:640px){.ysl-process-item{grid-template-columns:80px 1fr}}
@media(max-width:640px){.ysl-process-item{grid-template-columns:50px 1fr;gap:1rem}}
.ysl-process-num{font-family:'Clash Display',sans-serif;font-size:2.5rem;font-weight:700;color:rgba(255,255,255,.06);line-height:1;transition:color .3s}
.theme-light .ysl-process-num{color:rgba(0,0,0,.07)}
.ysl-process-item:hover .ysl-process-num{color:#F0185A}
.ysl-process-title{font-family:'Clash Display',sans-serif;font-size:1rem;font-weight:600;letter-spacing:-.01em;margin-bottom:.75rem}
.ysl-process-body{font-size:clamp(1.125rem,2vw,1.15rem);font-weight:300;line-height:1.8;color:var(--fg-muted)}
.ysl-process-body strong{font-weight:600}
.theme-dark .ysl-process-body strong{color:#F0EFF8}
.theme-light .ysl-process-body strong{color:#0D0C1A}

/* ── Photos grid ──────────────────────────────────────────── */
.ysl-photos-grid{display:grid;grid-template-columns:1fr 1fr;gap:1rem;margin-top:2rem}
@media(max-width:900px){.ysl-photos-grid{grid-template-columns:1fr}}
.ysl-photo{width:100%;display:block;object-fit:cover}
.ysl-photo--full{grid-column:1/-1;aspect-ratio:16/7}
.ysl-photo:not(.ysl-photo--full){aspect-ratio:4/3}

/* ── More YSL work ────────────────────────────────────────── */
.ysl-more-grid{display:flex;flex-direction:column;gap:1rem;margin-top:2.5rem}
.ysl-more-card{display:grid;grid-template-columns:1fr 1fr;border:1px solid rgba(255,255,255,.07);overflow:hidden;transition:border-color .3s}
.theme-light .ysl-more-card{border-color:rgba(0,0,0,.08)}
.ysl-more-card:hover{border-color:rgba(240,24,90,.4)}
.ysl-more-card--reverse{direction:rtl}
.ysl-more-card--reverse > *{direction:ltr}
@media(max-width:640px){.ysl-more-card,.ysl-more-card--reverse{grid-template-columns:1fr;direction:ltr}}
.ysl-more-img{aspect-ratio:4/3;overflow:hidden}
.ysl-more-img img{width:100%;height:100%;object-fit:cover;display:block}
.ysl-more-info{padding:2.5rem;display:flex;flex-direction:column;justify-content:center;gap:1rem}
@media(max-width:640px){.ysl-more-info{padding:1.5rem}}
.ysl-more-label{font-size:.5rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;color:#F0185A}
.ysl-more-title{font-family:'Clash Display',sans-serif;font-size:clamp(1rem,2.5vw,1.4rem);font-weight:600;letter-spacing:-.015em;line-height:1.15}
.ysl-more-body{font-size:1.125rem;font-weight:300;line-height:1.8;color:var(--fg-muted);max-width:38ch}
.ysl-more-tags{display:flex;flex-wrap:wrap;gap:.5rem;margin-top:.5rem}

/* ── Learnings ────────────────────────────────────────────── */
.ysl-learnings-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:1rem;margin-top:2rem}
@media(max-width:900px){.ysl-learnings-grid{grid-template-columns:1fr 1fr}}
@media(max-width:640px){.ysl-learnings-grid{grid-template-columns:1fr}}
.ysl-learning-card{border:1px solid rgba(255,255,255,.07);padding:1.5rem;transition:border-color .3s,transform .4s cubic-bezier(.16,1,.3,1)}
.theme-light .ysl-learning-card{border-color:rgba(0,0,0,.08)}
.ysl-learning-card:hover{border-color:rgba(240,24,90,.4);transform:translateY(-4px)}
.ysl-learning-num{font-family:'Clash Display',sans-serif;font-size:2rem;font-weight:700;color:#F0185A;opacity:.25;line-height:1;margin-bottom:1rem}
.ysl-learning-title{font-family:'Clash Display',sans-serif;font-size:.875rem;font-weight:600;letter-spacing:-.01em;margin-bottom:.75rem}
.ysl-learning-body{font-size:1.125rem;font-weight:300;line-height:1.75;color:var(--fg-muted)}

/* ── Footer CTA ───────────────────────────────────────────── */
.ysl-case-footer{border-top:1px solid rgba(255,255,255,.07);padding:5rem 0 6rem;display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:2rem}
.theme-light .ysl-case-footer{border-top-color:rgba(0,0,0,.08)}
@media(max-width:640px){.ysl-case-footer{flex-direction:column;align-items:flex-start}}
.ysl-footer-label{font-size:.55rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;color:var(--fg-muted);margin-bottom:.75rem}
.ysl-footer-title{font-family:'Clash Display',sans-serif;font-size:clamp(1.2rem,3.5vw,2rem);font-weight:600;letter-spacing:-.015em}
.ysl-footer-btns{display:flex;gap:1rem;flex-wrap:wrap}
.ysl-btn{display:inline-flex;align-items:center;justify-content:center;height:50px;padding:0 1.75rem;text-decoration:none;font-size:.63rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;transition:background .2s,border-color .2s,color .2s;border:1px solid;min-width:160px}
.ysl-arr{display:inline-block;margin-left:.35rem;transition:transform .2s ease}
.ysl-btn:hover .ysl-arr{transform:translateX(4px)}
.ysl-btn--solid{background:#F0185A;border-color:#F0185A;color:#fff}
.ysl-btn--solid:hover{background:#c9144d;border-color:#c9144d}
.ysl-btn--ghost{background:transparent;border-color:rgba(255,255,255,.18);color:#F0EFF8}
.theme-light .ysl-btn--ghost{border-color:rgba(0,0,0,.2);color:#0D0C1A}
.ysl-btn--ghost:hover{border-color:rgba(240,24,90,.5)}

/* ── Footer bar ───────────────────────────────────────────── */
.ysl-footer-bar{position:relative;z-index:2;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:1rem;padding:1.5rem;border-top:1px solid rgba(255,255,255,.07);font-size:.55rem;font-weight:500;letter-spacing:.12em;text-transform:uppercase;color:var(--fg-muted)}
.theme-light .ysl-footer-bar{border-top-color:rgba(0,0,0,.08)}
@media(min-width:640px){.ysl-footer-bar{padding:1.5rem 3rem}}
@media(min-width:1024px){.ysl-footer-bar{padding:1.5rem 7rem}}
@media(min-width:1400px){.ysl-footer-bar{padding:1.5rem 10rem}}

/* ── Keyframes ────────────────────────────────────────────── */
@keyframes ysl-pulse{0%,100%{opacity:1;transform:scale(1)}50%{opacity:.3;transform:scale(.75)}}
</style>
