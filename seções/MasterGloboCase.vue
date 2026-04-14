<template>
  <div :class="['mg-root', `theme-${theme}`]">
    <div class="mg-grain" aria-hidden="true"></div>
    <div class="mg-glow"  aria-hidden="true"></div>

    <NavBar v-model:lang="lang" v-model:theme="theme" />

    <!-- HERO -->
    <section class="mg-hero">
      <div class="mg-wrap">
        <div class="mg-eyebrow">
          <span class="mg-dot" aria-hidden="true"></span>
          <span>{{ t.eyebrow }}</span>
        </div>
        <h1 class="mg-title">Master<br><em>Globo.</em></h1>
        <div class="mg-rule" aria-hidden="true"></div>
        <div class="mg-hero-meta">
          <p class="mg-hero-desc">{{ t.heroDesc }}</p>
          <div class="mg-tags">
            <span v-for="tag in t.tags" :key="tag" class="mg-tag">{{ tag }}</span>
          </div>
        </div>
      </div>

      <div class="mg-cover-wrap mg-wrap">
        <img :src="coverImg" :alt="t.coverAlt" class="mg-cover-img" />
      </div>
    </section>

    <!-- IMPACT STRIP -->
    <div class="mg-wrap">
      <div class="mg-impact-strip">
        <div class="mg-impact-cell">
          <b class="mg-impact-n">2.5K+</b>
          <span class="mg-impact-label">{{ t.impact[0] }}</span>
        </div>
        <div class="mg-impact-cell">
          <b class="mg-impact-n">15</b>
          <span class="mg-impact-label">{{ t.impact[1] }}</span>
        </div>
        <div class="mg-impact-cell">
          <b class="mg-impact-n">4</b>
          <span class="mg-impact-label">{{ t.impact[2] }}</span>
        </div>
        <div class="mg-impact-cell">
          <b class="mg-impact-n">30 {{ t.days }}</b>
          <span class="mg-impact-label">{{ t.impact[3] }}</span>
        </div>
      </div>
    </div>

    <!-- CONTEXTO -->
    <div class="mg-wrap">
      <section class="mg-section">
        <div class="mg-rule-label"><span class="mg-dot" aria-hidden="true"></span>{{ t.contextLabel }}</div>
        <div class="mg-split">
          <div class="mg-split-text">
            <h2 class="mg-headline">{{ t.contextHeadline }}</h2>
            <p class="mg-body">{{ t.contextBody1 }}</p>
            <p class="mg-body" v-html="t.contextBody2"></p>
          </div>
          <div class="mg-split-visual">
            <img :src="avatarsImg" :alt="t.avatarsAlt" class="mg-img-full" />
          </div>
        </div>
      </section>
    </div>

    <!-- ABORDAGEM -->
    <div class="mg-wrap">
      <section class="mg-section">
        <div class="mg-rule-label"><span class="mg-dot" aria-hidden="true"></span>{{ t.approachLabel }}</div>
        <div class="mg-two-col">
          <div>
            <h2 class="mg-headline">{{ t.approachHeadline }}</h2>
            <p class="mg-body">{{ t.approachBody }}</p>
          </div>
          <div class="mg-method-cards">
            <div class="mg-card">
              <div class="mg-card-label">{{ t.phase1Label }}</div>
              <div class="mg-card-value">{{ t.phase1Value }}</div>
              <p class="mg-card-desc">{{ t.phase1Desc }}</p>
            </div>
            <div class="mg-card">
              <div class="mg-card-label">{{ t.phase2Label }}</div>
              <div class="mg-card-value">{{ t.phase2Value }}</div>
              <p class="mg-card-desc">{{ t.phase2Desc }}</p>
            </div>
          </div>
        </div>
      </section>
    </div>

    <!-- AI BLOCK -->
    <div class="mg-wrap">
      <div class="mg-ai-block">
        <div class="mg-ai-eyebrow"><span class="mg-dot" aria-hidden="true"></span>{{ t.aiEyebrow }}</div>
        <h3 class="mg-ai-title">{{ t.aiTitle }}</h3>
        <p class="mg-ai-text">{{ t.aiText }}</p>
      </div>
    </div>

    <!-- ENTREVISTAS -->
    <div class="mg-wrap">
      <section class="mg-section">
        <div class="mg-rule-label"><span class="mg-dot" aria-hidden="true"></span>{{ t.processLabel }}</div>
        <div class="mg-split mg-split--reverse">
          <div class="mg-split-text">
            <h2 class="mg-headline">{{ t.processHeadline }}</h2>
            <p class="mg-body">{{ t.processBody }}</p>
          </div>
          <div class="mg-split-visual">
            <img :src="interviewImg" :alt="t.interviewAlt" class="mg-img-full" />
          </div>
        </div>
      </section>
    </div>

    <!-- PRINCIPAIS ACHADOS -->
    <div class="mg-wrap">
      <section class="mg-section">
        <div class="mg-rule-label"><span class="mg-dot" aria-hidden="true"></span>{{ t.findingsLabel }}</div>
        <h2 class="mg-headline">{{ t.findingsHeadline }}</h2>
        <div class="mg-findings-grid">
          <div v-for="(f, i) in t.findings" :key="i" class="mg-finding-card">
            <div class="mg-finding-icon">
              <svg v-if="i === 0" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/><circle cx="12" cy="12" r="10"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
              <svg v-else-if="i === 1" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
              <svg v-else width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="3" width="20" height="14" rx="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/></svg>
            </div>
            <div class="mg-finding-title">{{ f.title }}</div>
            <p class="mg-finding-text">{{ f.text }}</p>
          </div>
        </div>
      </section>
    </div>

    <!-- VALOR ALÉM DO ESPERADO -->
    <div class="mg-wrap">
      <section class="mg-section">
        <div class="mg-rule-label"><span class="mg-dot" aria-hidden="true"></span>{{ t.dashLabel }}</div>
        <h2 class="mg-headline">{{ t.dashHeadline }}</h2>
        <p class="mg-body mg-body--wide">{{ t.dashBody }}</p>
        <div class="mg-dashboard-grid">
          <div v-for="(c, i) in t.dashCards" :key="i" class="mg-dash-card">
            <span class="mg-dash-tag">{{ c.tag }}</span>
            <div class="mg-dash-title">{{ c.title }}</div>
            <p class="mg-dash-text">{{ c.text }}</p>
          </div>
        </div>
      </section>
    </div>

    <!-- RECOMENDAÇÕES ESTRATÉGICAS -->
    <div class="mg-wrap">
      <section class="mg-section">
        <div class="mg-rule-label"><span class="mg-dot" aria-hidden="true"></span>{{ t.pathsLabel }}</div>
        <h2 class="mg-headline">{{ t.pathsHeadline }}</h2>
        <p class="mg-body mg-body--wide">{{ t.pathsBody }}</p>
        <div class="mg-paths-grid">
          <div v-for="p in t.paths" :key="p.num" class="mg-path-card">
            <div class="mg-path-num">{{ p.num }}</div>
            <div class="mg-path-name">{{ p.name }}</div>
            <p class="mg-path-desc">{{ p.desc }}</p>
          </div>
        </div>
      </section>
    </div>

    <!-- CLOSING -->
    <div class="mg-wrap">
      <div class="mg-closing">
        <p class="mg-closing-text" v-html="t.closingText"></p>
        <div class="mg-closing-actions">
          <router-link to="/projetos" class="mg-btn mg-btn--ghost">
            <span class="mg-btn-lbl">{{ t.btnBack }}</span>
          </router-link>
          <a :href="`mailto:tayna.schultz@gmail.com?subject=${t.emailSubject}`" class="mg-btn mg-btn--solid">
            <span class="mg-btn-lbl">{{ t.btnContact }}</span>
          </a>
        </div>
      </div>
    </div>

    <!-- FOOTER -->
    <footer class="mg-footer">
      <span class="mg-footer-tag">{{ t.footerTag }}</span>
      <span class="mg-footer-copy">© 2025 Tayná Schultz</span>
    </footer>

    <!-- Back to top -->
    <button class="btt-btn" :class="{ 'btt-btn--visible': showBtt }" @click="scrollToTop" :aria-label="t.bttLabel">
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="18 15 12 9 6 15"/></svg>
    </button>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import NavBar from './NavBar.vue'

import coverImg     from '../imagens cases/master globo/master goblo cover.png'
import avatarsImg   from '../imagens cases/master globo/master globo avatars.avif'
import interviewImg from '../imagens cases/master globo/master globo interview.webp'

const props = defineProps({
  lang  : { type: String, default: 'PT' },
  theme : { type: String, default: 'dark' },
})

const lang  = ref(props.lang)
const theme = ref(props.theme)

// ── i18n ──────────────────────────────────────────────────────
const copy = {
  PT: {
    eyebrow        : 'UX Research · Concept Validation · 2025',
    heroDesc       : 'Como uma pesquisa mixed-methods com IA redefiniu a estratégia de apresentadores de cursos online — e ainda entregou insights que o cliente não esperava receber.',
    tags           : ['UX Research', 'Concept Validation', 'Mixed Methods', 'AI-Assisted Analysis', '1 mês'],
    coverAlt       : 'Master Globo — avatares do curso',
    avatarsAlt     : 'Avatares Master Globo',
    interviewAlt   : 'Entrevista qualitativa Master Globo',
    days           : 'dias',
    impact         : [
      'Respostas no survey quantitativo',
      'Entrevistas qualitativas em 10 dias',
      'Caminhos estratégicos entregues',
      'Da pesquisa à recomendação executiva',
    ],
    contextLabel   : 'Contexto',
    contextHeadline: 'Celebridades vendem — mas a que custo?',
    contextBody1   : 'A Master Globo utilizava apresentadores famosos em seus cursos online. A estratégia funcionava para gerar atenção, mas carregava riscos reais: disputas contratuais, mudanças de imagem pública, eventos imprevistos. A dependência de um rosto famoso criava uma fragilidade estratégica que o negócio precisava endereçar.',
    contextBody2   : 'A pergunta central: <strong>avatares gerados por IA poderiam substituir celebridades sem sacrificar o engajamento do aluno?</strong>',
    approachLabel  : 'Abordagem',
    approachHeadline: 'Mixed-methods para medir o incomensurável',
    approachBody   : 'Preferência, confiança e conforto com inovação tecnológica são difíceis de capturar com um único método. Combinamos profundidade qualitativa com escala quantitativa para triangular os dados.',
    phase1Label    : 'Fase 01 · Qualitativa',
    phase1Value    : '15 entrevistas em profundidade',
    phase1Desc     : 'Conduzidas em 10 dias. Mapeamento de preferências, percepções e expectativas sobre os formatos de apresentação.',
    phase2Label    : 'Fase 02 · Quantitativa',
    phase2Value    : 'Survey online · 2.500+ respostas',
    phase2Desc     : 'Duas semanas de coleta. NPS, validação de hipóteses e dados demográficos para representatividade estatística.',
    aiEyebrow      : 'Inovação de processo',
    aiTitle        : 'IA no processamento dos dados quantitativos',
    aiText         : 'Com mais de 2.500 respostas abertas no formulário, o processamento manual seria inviável no prazo de um mês. Utilizamos inteligência artificial para análise e categorização dos dados qualitativos do survey — acelerando a extração de padrões e garantindo que nenhum insight fosse perdido na escala. Isso permitiu cruzar variáveis com profundidade e velocidade impossíveis de alcançar manualmente, entregando ao cliente uma análise mais rica no mesmo tempo.',
    processLabel   : 'Processo',
    processHeadline: 'Entrevistas online com usuários reais da plataforma',
    processBody    : 'As entrevistas qualitativas foram conduzidas remotamente com alunos ativos da plataforma Master Globo. O roteiro explorou percepções sobre formatos de apresentação, confiança em conteúdo digital e abertura para inovação tecnológica — gerando insumos ricos para complementar os dados quantitativos.',
    findingsLabel  : 'Principais Achados',
    findingsHeadline: 'A celebridade não é o produto. A marca é.',
    findings       : [
      { title: 'Humanos ainda preferidos, celebridade irrelevante',  text: 'Usuários preferem apresentadores humanos, mas o status de celebridade não foi fator decisivo na escolha do curso. O que importa está além do rosto.' },
      { title: 'A marca vale mais que o apresentador',               text: 'Os três fatores mais valorizados foram: credibilidade da marca, qualidade percebida do conteúdo e o prestígio do nome Globo no currículo.' },
      { title: 'Cartoon leva por margem mínima',                     text: 'Entre os tipos de avatar, o estilo cartoon performou ligeiramente melhor que o humanizado — 51% vs 49%. Na prática, um empate técnico que indica abertura para inovação.' },
    ],
    dashLabel      : 'Valor Além do Esperado',
    dashHeadline   : 'O dashboard que entregou mais do que foi pedido',
    dashBody       : 'Os dados coletados revelaram oportunidades que iam além da questão dos avatares. Estruturamos um dashboard de insights que transformou respostas dispersas em recomendações acionáveis — sinalizando problemas críticos de produto que o cliente ainda não havia endereçado.',
    dashCards      : [
      { tag: 'Conteúdo',          title: 'Carência de material de apoio',   text: 'Alunos sinalizaram forte demanda por PDFs, atividades escritas e leituras complementares além das aulas em vídeo.' },
      { tag: 'Plataforma · UX',   title: 'Impossível pausar e retomar',      text: 'A plataforma não permitia salvar o progresso com facilidade — dor crítica para quem acessa de forma não-linear.' },
      { tag: 'Plataforma · Visual', title: 'Interface desatualizada',        text: 'Alunos percebem o visual como "atrasado" e pouco condizente com a reputação inovadora da marca Globo.' },
      { tag: 'Plataforma · Mobile', title: 'Experiência mobile crítica',     text: 'A maioria dos alunos acessa via smartphone, mas a plataforma não está otimizada para mobile — impactando diretamente a retenção.' },
    ],
    pathsLabel     : 'Recomendações Estratégicas',
    pathsHeadline  : 'Quatro caminhos. Uma decisão informada.',
    pathsBody      : 'Em vez de uma recomendação única, entregamos ao cliente um mapa de possibilidades — cada caminho com trade-offs claros para facilitar a tomada de decisão executiva.',
    paths          : [
      { num: '01', name: 'Transição Gradual',       desc: 'Introduzir avatares cartoon dentro dos cursos ao lado de apresentadores humanos, permitindo que a audiência se adapte progressivamente à inovação.' },
      { num: '02', name: 'Abordagem Híbrida',        desc: 'Avatares entregam o conteúdo, celebridades ficam nas thumbnails e materiais promocionais — preservando visibilidade sem os riscos de dependência contratual.' },
      { num: '03', name: 'Especialistas + Avatares', desc: 'Profissionais reconhecidos (não necessariamente famosos) combinados com avatares — equilibrando autoridade de conteúdo com inovação tecnológica.' },
      { num: '04', name: 'Substituição Total',       desc: 'Posicionar a Globo como pioneira no uso de avatares na educação online — uma jogada de branding ousada, sustentada pelos dados de aceitação coletados.' },
    ],
    closingText    : 'Pesquisa que responde e<br><em>descobre mais.</em>',
    btnBack        : '← Ver todos os cases',
    btnContact     : 'Vamos conversar →',
    emailSubject   : 'Olá%2C%20Tayná%20—%20vi%20seu%20portfólio',
    footerTag      : 'Master Globo · UX Research · 2025',
    bttLabel       : 'Voltar ao topo',
  },

  EN: {
    eyebrow        : 'UX Research · Concept Validation · 2025',
    heroDesc       : 'How a mixed-methods research with AI redefined the presenter strategy for online courses — and delivered insights the client didn\'t expect to receive.',
    tags           : ['UX Research', 'Concept Validation', 'Mixed Methods', 'AI-Assisted Analysis', '1 month'],
    coverAlt       : 'Master Globo — course avatars',
    avatarsAlt     : 'Master Globo Avatars',
    interviewAlt   : 'Master Globo qualitative interview',
    days           : 'days',
    impact         : [
      'Quantitative survey responses',
      'Qualitative interviews in 10 days',
      'Strategic paths delivered',
      'From research to executive recommendation',
    ],
    contextLabel   : 'Context',
    contextHeadline: 'Celebrities sell — but at what cost?',
    contextBody1   : 'Master Globo used famous presenters in their online courses. The strategy worked for generating attention, but carried real risks: contractual disputes, shifts in public image, unforeseen events. Dependence on a famous face created a strategic fragility the business needed to address.',
    contextBody2   : 'The central question: <strong>could AI-generated avatars replace celebrities without sacrificing student engagement?</strong>',
    approachLabel  : 'Approach',
    approachHeadline: 'Mixed-methods to measure the immeasurable',
    approachBody   : 'Preference, trust, and openness to technological innovation are hard to capture with a single method. We combined qualitative depth with quantitative scale to triangulate the data.',
    phase1Label    : 'Phase 01 · Qualitative',
    phase1Value    : '15 in-depth interviews',
    phase1Desc     : 'Conducted in 10 days. Mapping preferences, perceptions, and expectations about presentation formats.',
    phase2Label    : 'Phase 02 · Quantitative',
    phase2Value    : 'Online survey · 2,500+ responses',
    phase2Desc     : 'Two weeks of data collection. NPS, hypothesis validation, and demographic data for statistical representativeness.',
    aiEyebrow      : 'Process Innovation',
    aiTitle        : 'AI in quantitative data processing',
    aiText         : 'With over 2,500 open responses in the form, manual processing would have been unfeasible within a one-month deadline. We used artificial intelligence to analyze and categorize the qualitative survey data — accelerating pattern extraction and ensuring no insight was lost at scale. This allowed us to cross-reference variables with a depth and speed impossible to achieve manually, delivering a richer analysis to the client in the same timeframe.',
    processLabel   : 'Process',
    processHeadline: 'Online interviews with real platform users',
    processBody    : 'The qualitative interviews were conducted remotely with active students from the Master Globo platform. The script explored perceptions about presentation formats, trust in digital content, and openness to technological innovation — generating rich inputs to complement the quantitative data.',
    findingsLabel  : 'Key Findings',
    findingsHeadline: 'The celebrity isn\'t the product. The brand is.',
    findings       : [
      { title: 'Humans still preferred, celebrity irrelevant', text: 'Users prefer human presenters, but celebrity status was not a decisive factor in course selection. What matters goes beyond the face.' },
      { title: 'The brand is worth more than the presenter',   text: 'The three most valued factors were: brand credibility, perceived content quality, and the prestige of the Globo name on the résumé.' },
      { title: 'Cartoon wins by a slim margin',                text: 'Among avatar types, the cartoon style performed slightly better than humanized — 51% vs 49%. In practice, a statistical tie signaling openness to innovation.' },
    ],
    dashLabel      : 'Value Beyond Expectations',
    dashHeadline   : 'The dashboard that delivered more than was asked',
    dashBody       : 'The collected data revealed opportunities beyond the avatar question. We structured an insights dashboard that transformed scattered responses into actionable recommendations — flagging critical product issues the client had yet to address.',
    dashCards      : [
      { tag: 'Content',           title: 'Lack of supporting materials',  text: 'Students indicated strong demand for PDFs, written activities, and supplementary readings beyond video lessons.' },
      { tag: 'Platform · UX',    title: 'Unable to pause and resume',     text: 'The platform did not allow easy progress saving — a critical pain point for users who access non-linearly.' },
      { tag: 'Platform · Visual', title: 'Outdated interface',            text: 'Students perceive the visual as "outdated" and inconsistent with Globo\'s innovative brand reputation.' },
      { tag: 'Platform · Mobile', title: 'Critical mobile experience',    text: 'Most students access via smartphone, but the platform is not mobile-optimized — directly impacting retention.' },
    ],
    pathsLabel     : 'Strategic Recommendations',
    pathsHeadline  : 'Four paths. One informed decision.',
    pathsBody      : 'Instead of a single recommendation, we delivered a possibility map to the client — each path with clear trade-offs to facilitate executive decision-making.',
    paths          : [
      { num: '01', name: 'Gradual Transition',   desc: 'Introduce cartoon avatars alongside human presenters within courses, allowing the audience to progressively adapt to the innovation.' },
      { num: '02', name: 'Hybrid Approach',       desc: 'Avatars deliver the content, celebrities appear in thumbnails and promotional materials — preserving visibility without the risks of contractual dependency.' },
      { num: '03', name: 'Experts + Avatars',     desc: 'Recognized professionals (not necessarily famous) combined with avatars — balancing content authority with technological innovation.' },
      { num: '04', name: 'Full Replacement',      desc: 'Position Globo as a pioneer in using avatars for online education — a bold branding move, supported by the acceptance data collected.' },
    ],
    closingText    : 'Research that answers and<br><em>discovers more.</em>',
    btnBack        : '← All case studies',
    btnContact     : 'Let\'s talk →',
    emailSubject   : 'Hi%2C%20Tayná%20—%20I%20saw%20your%20portfolio',
    footerTag      : 'Master Globo · UX Research · 2025',
    bttLabel       : 'Back to top',
  },

  ES: {
    eyebrow        : 'UX Research · Validación de Concepto · 2025',
    heroDesc       : 'Cómo una investigación mixed-methods con IA redefinió la estrategia de presentadores de cursos online — y entregó insights que el cliente no esperaba recibir.',
    tags           : ['UX Research', 'Validación de Concepto', 'Mixed Methods', 'Análisis con IA', '1 mes'],
    coverAlt       : 'Master Globo — avatares del curso',
    avatarsAlt     : 'Avatares de Master Globo',
    interviewAlt   : 'Entrevista cualitativa Master Globo',
    days           : 'días',
    impact         : [
      'Respuestas en la encuesta cuantitativa',
      'Entrevistas cualitativas en 10 días',
      'Caminos estratégicos entregados',
      'De la investigación a la recomendación ejecutiva',
    ],
    contextLabel   : 'Contexto',
    contextHeadline: 'Las celebridades venden — ¿pero a qué costo?',
    contextBody1   : 'Master Globo utilizaba presentadores famosos en sus cursos online. La estrategia funcionaba para generar atención, pero conllevaba riesgos reales: disputas contractuales, cambios en la imagen pública, eventos imprevistos. La dependencia de un rostro famoso creaba una fragilidad estratégica que el negocio necesitaba abordar.',
    contextBody2   : 'La pregunta central: <strong>¿podrían los avatares generados por IA reemplazar a las celebridades sin sacrificar el engagement del alumno?</strong>',
    approachLabel  : 'Enfoque',
    approachHeadline: 'Mixed-methods para medir lo inconmensurable',
    approachBody   : 'La preferencia, la confianza y la apertura a la innovación tecnológica son difíciles de capturar con un solo método. Combinamos profundidad cualitativa con escala cuantitativa para triangular los datos.',
    phase1Label    : 'Fase 01 · Cualitativa',
    phase1Value    : '15 entrevistas en profundidad',
    phase1Desc     : 'Realizadas en 10 días. Mapeo de preferencias, percepciones y expectativas sobre los formatos de presentación.',
    phase2Label    : 'Fase 02 · Cuantitativa',
    phase2Value    : 'Encuesta online · 2.500+ respuestas',
    phase2Desc     : 'Dos semanas de recolección. NPS, validación de hipótesis y datos demográficos para representatividad estadística.',
    aiEyebrow      : 'Innovación de proceso',
    aiTitle        : 'IA en el procesamiento de datos cuantitativos',
    aiText         : 'Con más de 2.500 respuestas abiertas en el formulario, el procesamiento manual habría sido inviable en el plazo de un mes. Utilizamos inteligencia artificial para analizar y categorizar los datos cualitativos de la encuesta — acelerando la extracción de patrones y garantizando que ningún insight se perdiera en la escala. Esto permitió cruzar variables con una profundidad y velocidad imposibles de alcanzar manualmente, entregando al cliente un análisis más rico en el mismo tiempo.',
    processLabel   : 'Proceso',
    processHeadline: 'Entrevistas online con usuarios reales de la plataforma',
    processBody    : 'Las entrevistas cualitativas se realizaron de forma remota con alumnos activos de la plataforma Master Globo. El guión exploró percepciones sobre formatos de presentación, confianza en contenido digital y apertura a la innovación tecnológica — generando insumos ricos para complementar los datos cuantitativos.',
    findingsLabel  : 'Hallazgos Principales',
    findingsHeadline: 'La celebridad no es el producto. La marca sí.',
    findings       : [
      { title: 'Los humanos aún preferidos, la celebridad irrelevante', text: 'Los usuarios prefieren presentadores humanos, pero el estatus de celebridad no fue un factor decisivo en la elección del curso. Lo que importa va más allá del rostro.' },
      { title: 'La marca vale más que el presentador',                  text: 'Los tres factores más valorados fueron: credibilidad de la marca, calidad percibida del contenido y el prestigio del nombre Globo en el currículum.' },
      { title: 'El cartoon gana por margen mínimo',                     text: 'Entre los tipos de avatar, el estilo cartoon tuvo un rendimiento ligeramente mejor que el humanizado — 51% vs 49%. En la práctica, un empate técnico que indica apertura a la innovación.' },
    ],
    dashLabel      : 'Valor Más Allá de lo Esperado',
    dashHeadline   : 'El dashboard que entregó más de lo pedido',
    dashBody       : 'Los datos recopilados revelaron oportunidades más allá de la pregunta de los avatares. Estructuramos un dashboard de insights que transformó respuestas dispersas en recomendaciones accionables — señalando problemas críticos de producto que el cliente aún no había abordado.',
    dashCards      : [
      { tag: 'Contenido',           title: 'Falta de material de apoyo',   text: 'Los alumnos señalaron una fuerte demanda de PDFs, actividades escritas y lecturas complementarias más allá de las clases en vídeo.' },
      { tag: 'Plataforma · UX',    title: 'Imposible pausar y retomar',    text: 'La plataforma no permitía guardar el progreso fácilmente — una queja crítica para quienes acceden de forma no lineal.' },
      { tag: 'Plataforma · Visual', title: 'Interfaz desactualizada',      text: 'Los alumnos perciben el visual como "anticuado" y poco acorde con la reputación innovadora de la marca Globo.' },
      { tag: 'Plataforma · Mobile', title: 'Experiencia mobile crítica',   text: 'La mayoría de los alumnos accede vía smartphone, pero la plataforma no está optimizada para móvil — impactando directamente la retención.' },
    ],
    pathsLabel     : 'Recomendaciones Estratégicas',
    pathsHeadline  : 'Cuatro caminos. Una decisión informada.',
    pathsBody      : 'En lugar de una recomendación única, entregamos al cliente un mapa de posibilidades — cada camino con trade-offs claros para facilitar la toma de decisión ejecutiva.',
    paths          : [
      { num: '01', name: 'Transición Gradual',      desc: 'Introducir avatares cartoon dentro de los cursos junto a presentadores humanos, permitiendo que la audiencia se adapte progresivamente a la innovación.' },
      { num: '02', name: 'Enfoque Híbrido',          desc: 'Los avatares entregan el contenido, las celebridades aparecen en miniaturas y materiales promocionales — preservando visibilidad sin los riesgos de dependencia contractual.' },
      { num: '03', name: 'Expertos + Avatares',      desc: 'Profesionales reconocidos (no necesariamente famosos) combinados con avatares — equilibrando autoridad de contenido con innovación tecnológica.' },
      { num: '04', name: 'Sustitución Total',        desc: 'Posicionar a Globo como pionera en el uso de avatares en la educación online — una apuesta de branding audaz, sustentada por los datos de aceptación recopilados.' },
    ],
    closingText    : 'Investigación que responde y<br><em>descubre más.</em>',
    btnBack        : '← Ver todos los cases',
    btnContact     : 'Hablemos →',
    emailSubject   : 'Hola%2C%20Tayná%20—%20vi%20tu%20portafolio',
    footerTag      : 'Master Globo · UX Research · 2025',
    bttLabel       : 'Volver arriba',
  },

  DE: {
    eyebrow        : 'UX Research · Konzeptvalidierung · 2025',
    heroDesc       : 'Wie eine Mixed-Methods-Forschung mit KI die Präsentatorenstrategie für Online-Kurse neu definierte — und Erkenntnisse lieferte, die der Kunde nicht erwartet hatte.',
    tags           : ['UX Research', 'Konzeptvalidierung', 'Mixed Methods', 'KI-gestützte Analyse', '1 Monat'],
    coverAlt       : 'Master Globo — Kurs-Avatare',
    avatarsAlt     : 'Master Globo Avatare',
    interviewAlt   : 'Master Globo qualitatives Interview',
    days           : 'Tage',
    impact         : [
      'Antworten in der quantitativen Umfrage',
      'Qualitative Interviews in 10 Tagen',
      'Strategische Wege geliefert',
      'Von der Forschung zur Führungsempfehlung',
    ],
    contextLabel   : 'Kontext',
    contextHeadline: 'Prominente verkaufen — aber zu welchem Preis?',
    contextBody1   : 'Master Globo setzte bekannte Moderatoren in ihren Online-Kursen ein. Die Strategie funktionierte für Aufmerksamkeit, barg aber echte Risiken: Vertragsstreitigkeiten, Imagewandel, unvorhergesehene Ereignisse. Die Abhängigkeit von einem bekannten Gesicht schuf eine strategische Fragilität, die das Unternehmen angehen musste.',
    contextBody2   : 'Die zentrale Frage: <strong>Könnten KI-generierte Avatare Prominente ersetzen, ohne das Student Engagement zu beeinträchtigen?</strong>',
    approachLabel  : 'Ansatz',
    approachHeadline: 'Mixed-Methods zur Messung des Unmessbaren',
    approachBody   : 'Präferenz, Vertrauen und Offenheit gegenüber technologischer Innovation lassen sich mit einer einzigen Methode schwer erfassen. Wir kombinierten qualitative Tiefe mit quantitativer Skalierung, um die Daten zu triangulieren.',
    phase1Label    : 'Phase 01 · Qualitativ',
    phase1Value    : '15 Tiefeninterviews',
    phase1Desc     : 'In 10 Tagen durchgeführt. Erfassung von Präferenzen, Wahrnehmungen und Erwartungen zu Präsentationsformaten.',
    phase2Label    : 'Phase 02 · Quantitativ',
    phase2Value    : 'Online-Umfrage · 2.500+ Antworten',
    phase2Desc     : 'Zwei Wochen Datenerhebung. NPS, Hypothesenvalidierung und demografische Daten für statistische Repräsentativität.',
    aiEyebrow      : 'Prozessinnovation',
    aiTitle        : 'KI bei der Verarbeitung quantitativer Daten',
    aiText         : 'Mit über 2.500 offenen Antworten im Formular wäre die manuelle Verarbeitung innerhalb eines Monats nicht machbar gewesen. Wir nutzten künstliche Intelligenz zur Analyse und Kategorisierung der qualitativen Umfragedaten — um die Mustererkennung zu beschleunigen und sicherzustellen, dass kein Einblick verloren geht. Dies ermöglichte es, Variablen mit einer Tiefe und Geschwindigkeit zu kreuzen, die manuell unmöglich gewesen wäre, und lieferte dem Kunden eine reichhaltigere Analyse im gleichen Zeitrahmen.',
    processLabel   : 'Prozess',
    processHeadline: 'Online-Interviews mit echten Plattformnutzern',
    processBody    : 'Die qualitativen Interviews wurden remote mit aktiven Studierenden der Master Globo Plattform durchgeführt. Der Leitfaden erkundete Wahrnehmungen zu Präsentationsformaten, Vertrauen in digitale Inhalte und Offenheit für technologische Innovation — und lieferte reichhaltige Erkenntnisse zur Ergänzung der quantitativen Daten.',
    findingsLabel  : 'Haupterkenntnisse',
    findingsHeadline: 'Der Prominente ist nicht das Produkt. Die Marke ist es.',
    findings       : [
      { title: 'Menschen bevorzugt, Prominenz irrelevant', text: 'Nutzer bevorzugen menschliche Moderatoren, aber der Prominentenstatus war kein entscheidender Faktor bei der Kurswahl. Was zählt, geht über das Gesicht hinaus.' },
      { title: 'Die Marke ist mehr wert als der Moderator', text: 'Die drei meistbewerteten Faktoren waren: Markenglaubwürdigkeit, wahrgenommene Inhaltsqualität und das Prestige des Namens Globo im Lebenslauf.' },
      { title: 'Cartoon gewinnt mit knappem Vorsprung',     text: 'Unter den Avatar-Typen schnitt der Cartoon-Stil leicht besser ab als humanisierte Avatare — 51% vs 49%. In der Praxis ein statistisches Unentschieden, das Offenheit für Innovation signalisiert.' },
    ],
    dashLabel      : 'Mehrwert über Erwartungen hinaus',
    dashHeadline   : 'Das Dashboard, das mehr lieferte als gefordert',
    dashBody       : 'Die gesammelten Daten enthüllten Möglichkeiten, die über die Avatar-Frage hinausgingen. Wir erstellten ein Insights-Dashboard, das verstreute Antworten in umsetzbare Empfehlungen verwandelte — und auf kritische Produktprobleme hinwies, die der Kunde noch nicht angegangen war.',
    dashCards      : [
      { tag: 'Inhalt',              title: 'Mangel an Begleitmaterial',         text: 'Studierende signalisierten eine starke Nachfrage nach PDFs, schriftlichen Aktivitäten und ergänzenden Lektüren über Videolektionen hinaus.' },
      { tag: 'Plattform · UX',     title: 'Pause und Fortführung unmöglich',    text: 'Die Plattform ermöglichte kein einfaches Speichern des Fortschritts — ein kritischer Schmerzpunkt für Nutzer, die nicht linear zugreifen.' },
      { tag: 'Plattform · Visual', title: 'Veraltetes Interface',               text: 'Studierende nehmen das Erscheinungsbild als "veraltet" wahr und sehen es als nicht vereinbar mit dem innovativen Markenruf von Globo.' },
      { tag: 'Plattform · Mobile', title: 'Kritische Mobile-Erfahrung',         text: 'Die meisten Studierenden greifen über Smartphones zu, aber die Plattform ist nicht für Mobilgeräte optimiert — was die Bindung direkt beeinträchtigt.' },
    ],
    pathsLabel     : 'Strategische Empfehlungen',
    pathsHeadline  : 'Vier Wege. Eine informierte Entscheidung.',
    pathsBody      : 'Anstatt einer einzelnen Empfehlung lieferten wir dem Kunden eine Karte der Möglichkeiten — jeder Weg mit klaren Trade-offs zur Erleichterung der Führungsentscheidung.',
    paths          : [
      { num: '01', name: 'Schrittweiser Übergang', desc: 'Cartoon-Avatare neben menschlichen Moderatoren in Kursen einführen, damit sich das Publikum progressiv an die Innovation gewöhnen kann.' },
      { num: '02', name: 'Hybrider Ansatz',         desc: 'Avatare liefern den Inhalt, Prominente erscheinen in Thumbnails und Werbematerialien — Sichtbarkeit bewahren ohne die Risiken der Vertragsabhängigkeit.' },
      { num: '03', name: 'Experten + Avatare',      desc: 'Anerkannte Fachleute (nicht unbedingt bekannt) kombiniert mit Avataren — Inhaltsautorität mit technologischer Innovation ausgewogen.' },
      { num: '04', name: 'Vollständige Ersetzung',  desc: 'Globo als Pionier im Einsatz von Avataren in der Online-Bildung positionieren — ein mutiger Branding-Schritt, gestützt durch die gesammelten Akzeptanzdaten.' },
    ],
    closingText    : 'Forschung, die antwortet und<br><em>mehr entdeckt.</em>',
    btnBack        : '← Alle Case Studies',
    btnContact     : 'Lass uns reden →',
    emailSubject   : 'Hallo%2C%20Tayná%20—%20ich%20habe%20Ihr%20Portfolio%20gesehen',
    footerTag      : 'Master Globo · UX Research · 2025',
    bttLabel       : 'Nach oben',
  },
}

const t = computed(() => copy[lang.value] ?? copy.EN)

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
.mg-root{font-family:'DM Sans',sans-serif;min-height:100svh;position:relative;overflow-x:hidden;transition:background .5s,color .5s;--fg-muted:#A8A6C0}
.mg-root.theme-dark{background:#070711;color:#F0EFF8}
.mg-root.theme-light{background:#F5F3FF;color:#0D0C1A;--fg-muted:#5C5A72}

.mg-grain{position:fixed;inset:0;z-index:0;pointer-events:none;opacity:.035;background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");background-size:180px}
.mg-glow{position:fixed;top:-18%;right:-12%;width:75vw;height:75vw;max-width:900px;pointer-events:none;z-index:0;background:radial-gradient(ellipse at 65% 25%,rgba(240,24,90,.1) 0%,transparent 62%)}

/* ── Layout ───────────────────────────────────────────────── */
.mg-wrap{position:relative;z-index:2;padding:0 1.5rem}
@media(min-width:640px){.mg-wrap{padding:0 3rem}}
@media(min-width:1024px){.mg-wrap{padding:0 7rem}}
@media(min-width:1400px){.mg-wrap{padding:0 10rem}}

/* ── Hero ─────────────────────────────────────────────────── */
.mg-hero{padding-top:clamp(7rem,16vw,11rem);padding-bottom:3rem}
.mg-eyebrow{display:flex;align-items:center;gap:.5rem;font-size:.58rem;font-weight:500;letter-spacing:.16em;text-transform:uppercase;color:var(--fg-muted);margin-bottom:1.5rem}
.mg-dot{width:5px;height:5px;border-radius:50%;background:#F0185A;flex-shrink:0;animation:mg-pulse 2.5s ease-in-out infinite}
.mg-title{font-family:'Clash Display',sans-serif;font-weight:700;font-size:clamp(3rem,10vw,7rem);line-height:.88;letter-spacing:-.03em;margin-bottom:2rem}
.mg-title em{font-style:italic;color:#F0185A}
.mg-rule{width:100%;height:1px;background:linear-gradient(90deg,rgba(240,24,90,.55) 0%,transparent 65%);margin-bottom:2rem}
.mg-hero-meta{display:grid;grid-template-columns:1fr;gap:1.5rem}
@media(min-width:768px){.mg-hero-meta{grid-template-columns:1fr 1fr;align-items:end}}
.mg-hero-desc{font-size:clamp(1rem,2vw,1.3rem);font-weight:300;line-height:1.85;color:var(--fg-muted);max-width:44ch}
.mg-tags{display:flex;flex-wrap:wrap;gap:.4rem}
@media(min-width:768px){.mg-tags{justify-content:flex-end}}
.mg-tag{display:inline-flex;align-items:center;height:24px;padding:0 .6rem;border:1px solid rgba(255,255,255,.08);font-size:.5rem;letter-spacing:.12em;text-transform:uppercase;color:var(--fg-muted)}
.theme-light .mg-tag{border-color:rgba(0,0,0,.1)}

/* ── Cover image ──────────────────────────────────────────── */
.mg-cover-wrap{margin-top:2.5rem}
.mg-cover-img{width:100%;max-height:520px;object-fit:cover;border:1px solid rgba(255,255,255,.07);display:block}
.theme-light .mg-cover-img{border-color:rgba(0,0,0,.08)}

/* ── Impact strip ─────────────────────────────────────────── */
.mg-impact-strip{display:grid;grid-template-columns:repeat(2,1fr);gap:1px;background:rgba(255,255,255,.06);border:1px solid rgba(255,255,255,.06);margin:3rem 0}
@media(min-width:640px){.mg-impact-strip{grid-template-columns:repeat(4,1fr)}}
.theme-light .mg-impact-strip{background:rgba(0,0,0,.06);border-color:rgba(0,0,0,.06)}
.mg-impact-cell{background:#070711;padding:1.5rem 1.25rem;display:flex;flex-direction:column;gap:.5rem;transition:background .3s}
.mg-impact-cell:hover{background:rgba(240,24,90,.06)}
.theme-light .mg-impact-cell{background:#F5F3FF}
.mg-impact-n{font-family:'Clash Display',sans-serif;font-weight:700;font-size:clamp(1.6rem,4vw,3rem);line-height:1;color:#F0185A}
.mg-impact-label{font-size:.48rem;font-weight:500;letter-spacing:.12em;text-transform:uppercase;color:var(--fg-muted);line-height:1.5}

/* ── Section label ────────────────────────────────────────── */
.mg-section{margin-bottom:5rem}
.mg-rule-label{display:flex;align-items:center;gap:.75rem;font-size:.58rem;font-weight:500;letter-spacing:.18em;text-transform:uppercase;color:#F0185A;margin-bottom:2rem}
.mg-rule-label::after{content:'';flex:1;height:1px;background:linear-gradient(90deg,rgba(240,24,90,.4) 0%,transparent 70%)}

/* ── Typography ───────────────────────────────────────────── */
.mg-headline{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1.2rem,3.5vw,2rem);line-height:1.2;letter-spacing:-.01em;margin-bottom:1.25rem}
.mg-body{font-size:clamp(.95rem,1.8vw,1.15rem);font-weight:300;line-height:1.85;color:var(--fg-muted)}
.mg-body + .mg-body{margin-top:1rem}
.mg-body--wide{max-width:58ch;margin-bottom:2rem}
.mg-body strong{font-weight:800;color:#F0EFF8}
.theme-light .mg-body strong{color:#0D0C1A}

/* ── Split ────────────────────────────────────────────────── */
.mg-split{display:grid;grid-template-columns:1fr;gap:2.5rem;align-items:center}
@media(min-width:768px){.mg-split{grid-template-columns:1fr 1fr;gap:4rem}}
@media(min-width:768px){.mg-split--reverse .mg-split-visual{order:-1}}
.mg-img-full{width:100%;display:block;border:1px solid rgba(255,255,255,.07);border-radius:2px}
.theme-light .mg-img-full{border-color:rgba(0,0,0,.08)}

/* ── Two col ──────────────────────────────────────────────── */
.mg-two-col{display:grid;grid-template-columns:1fr;gap:2.5rem}
@media(min-width:768px){.mg-two-col{grid-template-columns:1fr 1fr;gap:4rem;align-items:start}}
.mg-method-cards{display:flex;flex-direction:column;gap:.75rem}

/* ── Cards ────────────────────────────────────────────────── */
.mg-card{border:1px solid rgba(255,255,255,.07);padding:1.25rem;transition:border-color .3s,transform .4s cubic-bezier(.16,1,.3,1)}
.mg-card:hover{border-color:rgba(240,24,90,.35);transform:translateY(-3px)}
.theme-light .mg-card{border-color:rgba(0,0,0,.09)}
.mg-card-label{font-size:.5rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;color:var(--fg-muted);margin-bottom:.6rem}
.mg-card-value{font-family:'Clash Display',sans-serif;font-size:1.05rem;font-weight:600;line-height:1.3;margin-bottom:.5rem}
.mg-card-desc{font-size:.95rem;font-weight:300;line-height:1.7;color:var(--fg-muted)}

/* ── AI block ─────────────────────────────────────────────── */
.mg-ai-block{border:1px solid rgba(240,24,90,.35);padding:2rem;background:rgba(240,24,90,.06);position:relative;overflow:hidden;margin:0 0 5rem}
.mg-ai-block::after{content:'AI';position:absolute;right:1.5rem;top:50%;transform:translateY(-50%);font-family:'Clash Display',sans-serif;font-size:6rem;font-weight:700;color:#F0185A;opacity:.05;pointer-events:none;line-height:1}
.mg-ai-eyebrow{display:flex;align-items:center;gap:.5rem;font-size:.5rem;font-weight:500;letter-spacing:.16em;text-transform:uppercase;color:#F0185A;margin-bottom:.75rem}
.mg-ai-title{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1rem,2.5vw,1.4rem);line-height:1.2;margin-bottom:1rem}
.mg-ai-text{font-size:clamp(.9rem,1.8vw,1.1rem);font-weight:300;line-height:1.85;color:var(--fg-muted);max-width:62ch}

/* ── Findings grid ────────────────────────────────────────── */
.mg-findings-grid{display:grid;grid-template-columns:1fr;gap:1rem;margin-top:2rem}
@media(min-width:640px){.mg-findings-grid{grid-template-columns:1fr 1fr}}
@media(min-width:1024px){.mg-findings-grid{grid-template-columns:repeat(3,1fr)}}
.mg-finding-card{border:1px solid rgba(255,255,255,.07);padding:1.5rem;transition:border-color .3s,background .3s;position:relative;overflow:hidden}
.mg-finding-card::before{content:'';position:absolute;top:0;left:0;right:0;height:2px;background:#F0185A;transform:scaleX(0);transform-origin:left;transition:transform .4s cubic-bezier(.16,1,.3,1)}
.mg-finding-card:hover::before{transform:scaleX(1)}
.mg-finding-card:hover{border-color:rgba(240,24,90,.35);background:rgba(240,24,90,.04)}
.theme-light .mg-finding-card{border-color:rgba(0,0,0,.09)}
.mg-finding-icon{color:#F0185A;margin-bottom:1rem}
.mg-finding-title{font-family:'Clash Display',sans-serif;font-size:1rem;font-weight:600;margin-bottom:.5rem;line-height:1.3}
.mg-finding-text{font-size:.95rem;font-weight:300;line-height:1.75;color:var(--fg-muted)}

/* ── Dashboard grid ───────────────────────────────────────── */
.mg-dashboard-grid{display:grid;grid-template-columns:1fr;gap:.75rem}
@media(min-width:640px){.mg-dashboard-grid{grid-template-columns:1fr 1fr}}
.mg-dash-card{border:1px solid rgba(255,255,255,.07);padding:1.25rem;transition:border-color .3s}
.mg-dash-card:hover{border-color:rgba(240,24,90,.35)}
.theme-light .mg-dash-card{border-color:rgba(0,0,0,.09)}
.mg-dash-tag{display:inline-block;margin-bottom:.75rem;font-size:.45rem;letter-spacing:.14em;text-transform:uppercase;color:#F0185A;background:rgba(240,24,90,.08);padding:.2rem .5rem}
.mg-dash-title{font-family:'Clash Display',sans-serif;font-size:.95rem;font-weight:600;margin-bottom:.5rem}
.mg-dash-text{font-size:.95rem;font-weight:300;line-height:1.7;color:var(--fg-muted)}

/* ── Paths grid ───────────────────────────────────────────── */
.mg-paths-grid{display:grid;grid-template-columns:1fr;gap:1rem}
@media(min-width:640px){.mg-paths-grid{grid-template-columns:1fr 1fr}}
.mg-path-card{border:1px solid rgba(255,255,255,.07);padding:1.5rem;position:relative;transition:border-color .3s,transform .4s cubic-bezier(.16,1,.3,1)}
.mg-path-card:hover{border-color:rgba(240,24,90,.35);transform:translateY(-3px)}
.theme-light .mg-path-card{border-color:rgba(0,0,0,.09)}
.mg-path-num{font-family:'Clash Display',sans-serif;font-size:3rem;font-weight:700;color:rgba(240,24,90,.15);line-height:1;margin-bottom:1rem;transition:color .3s}
.mg-path-card:hover .mg-path-num{color:rgba(240,24,90,.4)}
.mg-path-name{font-family:'Clash Display',sans-serif;font-size:1rem;font-weight:600;margin-bottom:.75rem;line-height:1.2}
.mg-path-desc{font-size:.95rem;font-weight:300;line-height:1.75;color:var(--fg-muted)}

/* ── Closing ──────────────────────────────────────────────── */
.mg-closing{padding:5rem 0;border-top:1px solid rgba(255,255,255,.07);display:flex;flex-direction:column;gap:2rem;align-items:flex-start}
@media(min-width:768px){.mg-closing{flex-direction:row;align-items:center;justify-content:space-between}}
.theme-light .mg-closing{border-top-color:rgba(0,0,0,.08)}
.mg-closing-text{font-family:'Clash Display',sans-serif;font-size:clamp(1.2rem,3vw,1.8rem);font-weight:600;line-height:1.2;letter-spacing:-.01em;max-width:30ch}
.mg-closing-text em{font-style:italic;color:#F0185A}
.mg-closing-actions{display:flex;flex-direction:column;gap:.75rem;width:100%}
@media(min-width:480px){.mg-closing-actions{flex-direction:row;flex-wrap:wrap;width:auto}}

/* ── Buttons ──────────────────────────────────────────────── */
.mg-btn{display:inline-flex;align-items:center;justify-content:center;height:50px;padding:0 1.75rem;text-decoration:none;font-size:.63rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;transition:background .2s,border-color .2s,color .2s;border:1px solid;width:100%}
@media(min-width:480px){.mg-btn{width:auto}}
.mg-btn--solid{background:#F0185A;border-color:#F0185A;color:#fff}
.mg-btn--solid:hover{background:#d4154f;border-color:#d4154f}
.mg-btn--ghost{background:transparent;border-color:rgba(255,255,255,.12);color:#F0EFF8}
.mg-btn--ghost:hover{border-color:rgba(240,24,90,.5);color:#F0185A}
.theme-light .mg-btn--ghost{border-color:rgba(0,0,0,.15);color:#0D0C1A}

/* ── Footer ───────────────────────────────────────────────── */
.mg-footer{position:relative;z-index:2;display:flex;justify-content:space-between;align-items:center;flex-wrap:wrap;gap:.5rem;border-top:1px solid rgba(255,255,255,.07);padding:1.75rem 1.5rem}
@media(min-width:640px){.mg-footer{padding:2rem 3rem}}
@media(min-width:1024px){.mg-footer{padding:2.5rem 7rem}}
@media(min-width:1400px){.mg-footer{padding:3rem 10rem}}
.theme-light .mg-footer{border-top-color:rgba(0,0,0,.08)}
.mg-footer-tag{font-size:.58rem;font-weight:500;letter-spacing:.12em;text-transform:uppercase;color:var(--fg-muted)}
.mg-footer-copy{font-size:.55rem;color:var(--fg-muted);opacity:.5}

/* ── Back to top ──────────────────────────────────────────── */
.btt-btn{position:fixed;bottom:2rem;right:2rem;z-index:999;width:44px;height:44px;border:1px solid rgba(255,255,255,.12);background:rgba(7,7,17,.7);color:#F0EFF8;cursor:pointer;display:flex;align-items:center;justify-content:center;backdrop-filter:blur(10px);-webkit-backdrop-filter:blur(10px);opacity:0;transform:translateY(12px);pointer-events:none;transition:opacity .3s ease,transform .3s ease,border-color .2s ease}
.btt-btn--visible{opacity:1;transform:translateY(0);pointer-events:auto}
.btt-btn:hover{border-color:rgba(255,255,255,.35)}
.theme-light .btt-btn{background:rgba(245,243,255,.85);border-color:rgba(0,0,0,.12);color:#0D0C1A}

/* ── Animations ───────────────────────────────────────────── */
@keyframes mg-pulse{0%,100%{opacity:1;transform:scale(1)}50%{opacity:.3;transform:scale(.75)}}
</style>
