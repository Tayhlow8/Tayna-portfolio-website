<template>
  <div :class="['rc-root', `theme-${theme}`]">
    <div class="rc-grain" aria-hidden="true"></div>

    <NavBar v-model:lang="lang" v-model:theme="theme" />

    <!-- 01 HERO -->
    <section class="rc-hero">
      <div class="rc-hero-left">
        <div class="rc-eyebrow"><span class="rc-tag">{{ t.tag }}</span><span class="rc-sep">·</span><span class="rc-year">2025</span></div>
        <h1 class="rc-title" v-html="t.title"></h1>
        <p class="rc-subtitle">{{ t.subtitle }}</p>
        <p class="rc-accent">{{ t.accentLine }}</p>
        <blockquote class="rc-ctx">{{ t.context }}</blockquote>
        <div class="rc-roles"><span v-for="r in t.roles" :key="r" class="rc-role">{{ r }}</span></div>
      </div>
      <div class="rc-hero-right">
        <div class="rc-stats-grid">
          <div class="rc-stat"><b class="rc-sn" style="color:#F0185A">129</b><span class="rc-sl">{{ t.stats.profiles }}</span></div>
          <div class="rc-stat"><b class="rc-sn rc-teal">603</b><span class="rc-sl">{{ t.stats.users }}</span></div>
          <div class="rc-stat"><b class="rc-sn" style="color:#FF7C43">6</b><span class="rc-sl">{{ t.stats.months }}</span></div>
          <div class="rc-stat"><b class="rc-sn" style="color:#F0185A">7</b><span class="rc-sl">{{ t.stats.legacy }}</span></div>
        </div>
        <div class="rc-screen"><div class="rc-browser"><span class="rc-dot rc-dot-r"></span><span class="rc-dot rc-dot-y"></span><span class="rc-dot rc-dot-g"></span><span class="rc-url">unica.rodobens.com.br/analise</span></div><img :src="creditDashImg" alt="Interface Unica — análise de crédito" loading="lazy" class="rc-screen-img"/></div>
      </div>
    </section>

    <!-- QUEIXAS -->
    <section class="rc-section">
      <div class="rc-rule"><span class="rc-rule-label">{{ t.complaintsLabel }}</span><span class="rc-rule-line"></span></div>
      <div class="rc-complaints-grid">
        <div v-for="(c, i) in t.complaints" :key="i" class="rc-complaint" :class="{ 'rc-complaint--vis': visC }" :style="{ '--ci': i }" :ref="el => setRef(el, i)">
          <span class="rc-cnum">0{{ i + 1 }}</span><p class="rc-ctxt">{{ c }}</p>
        </div>
      </div>
    </section>

    <!-- OVERVIEW -->
    <section class="rc-section">
      <div class="rc-rule"><span class="rc-rule-label">01 — {{ t.overviewLabel }}</span><span class="rc-rule-line"></span></div>
      <div class="rc-overview-row">
        <p class="rc-overview-body">{{ t.overviewBody }}</p>
        <div class="rc-deliverables"><span v-for="d in t.deliverables" :key="d" class="rc-del"><span class="rc-del-dot"></span>{{ d }}</span></div>
      </div>
      <div class="rc-triads">
        <div v-for="tr in t.triads" :key="tr.title" class="rc-triad"><h3 class="rc-triad-t">{{ tr.title }}</h3><p class="rc-triad-b">{{ tr.body }}</p></div>
      </div>
    </section>

    <!-- 03 SOLUÇÃO DE DESIGN -->
    <section class="rc-section">
      <div class="rc-rule"><span class="rc-rule-label">03 — {{ t.designLabel }}</span><span class="rc-rule-line"></span></div>
      <p class="rc-section-intro">{{ t.designIntro }}</p>

      <div class="rc-screens-list">
        <div v-for="(s, i) in designScreens" :key="s.img" class="rc-design-screen">
          <div class="rc-ds-header"><h3 class="rc-ds-title">{{ s.title }}</h3><p class="rc-ds-desc">{{ s.desc }}</p></div>
          <div class="rc-screen rc-screen--switchable">
            <div class="rc-browser">
              <span class="rc-dot rc-dot-r"></span><span class="rc-dot rc-dot-y"></span><span class="rc-dot rc-dot-g"></span>
              <span class="rc-url">{{ oldView[i] ? 'Sistema legado · vTiger' : s.url }}</span>
            </div>
            <div class="rc-img-wrap">
              <Transition name="rc-flip" mode="out-in">
                <img :key="oldView[i] ? 'old' : 'new'" :src="oldView[i] ? s.oldImg : s.img" :alt="s.title" loading="lazy" class="rc-screen-img"/>
              </Transition>
              <button v-if="s.oldImg" class="rc-before-btn" :class="{ 'rc-before-btn--active': oldView[i] }" @click="toggleOld(i)" type="button">
                <span class="rc-before-icon" aria-hidden="true">{{ oldView[i] ? '←' : '⟵' }}</span>
                <span>{{ oldView[i] ? 'Ver versão nova' : 'Como era antes' }}</span>
              </button>
            </div>
          </div>
          <p v-if="s.note" class="rc-ds-note">{{ s.note }}</p>
        </div>
      </div>

      <div class="rc-ds-banner">
        <p class="rc-ds-banner-title">{{ t.dsBannerTitle }}</p>
        <p class="rc-ds-banner-sub">{{ t.dsBannerSub }}</p>
      </div>

      <div class="rc-principles">
        <div v-for="p in t.principles" :key="p.title" class="rc-principle" :style="{ '--acc': p.color }">
          <h4 class="rc-pr-title">{{ p.title }}</h4><p class="rc-pr-body">{{ p.body }}</p>
        </div>
      </div>

      <div class="rc-decision">
        <h3 class="rc-dec-title">{{ t.decisionTitle }}</h3>
        <p class="rc-dec-sub">{{ t.decisionSub }}</p>
        <div class="rc-dec-cols">
          <div class="rc-dec-col">
            <h4 class="rc-dec-col-title rc-teal">{{ t.decisionBenefitsTitle }}</h4>
            <ul class="rc-dec-list"><li v-for="b in t.decisionBenefits" :key="b.label"><b>{{ b.label }}</b> {{ b.body }}</li></ul>
          </div>
          <div class="rc-dec-col">
            <h4 class="rc-dec-col-title" style="color:#F0185A">{{ t.decisionCustomTitle }}</h4>
            <ul class="rc-dec-list">
              <li v-for="c in t.decisionCustom" :key="c.color" class="rc-dec-custom-item">
                <span class="rc-dec-swatch" :style="{ background: c.color }"></span><span><b>{{ c.label }}</b> {{ c.body }}</span>
              </li>
            </ul>
          </div>
        </div>
        <blockquote class="rc-dec-quote">{{ t.decisionQuote }}</blockquote>
      </div>

      <h3 class="rc-comps-title">{{ t.compsTitle }}</h3>
      <div class="rc-comps-grid">
        <div class="rc-comp-card">
          <h4 class="rc-comp-title">Status Badges</h4>
          <div class="rc-badges-preview">
            <span class="rc-badge-pill" style="background:#05B44C">{{ t.badge1 }}</span>
            <span class="rc-badge-pill" style="background:#F0B100">{{ t.badge2 }}</span>
            <span class="rc-badge-pill" style="background:#FB2C36">{{ t.badge3 }}</span>
            <span class="rc-badge-pill" style="background:#2B7FFF">{{ t.badge4 }}</span>
          </div>
          <p class="rc-comp-note">847 instâncias no sistema</p>
        </div>
        <div class="rc-comp-card">
          <h4 class="rc-comp-title">Data Tables</h4>
          <ul class="rc-comp-list"><li v-for="f in t.tableFeatures" :key="f">{{ f }}</li></ul>
          <p class="rc-comp-note rc-comp-note--i">{{ t.tableNote }}</p>
        </div>
        <div class="rc-comp-card">
          <h4 class="rc-comp-title">Forms & Inputs</h4>
          <div class="rc-input-preview">
            <div class="rc-input-eg rc-input-eg--default">Default state</div>
            <div class="rc-input-eg rc-input-eg--focus">Focus state</div>
            <div class="rc-input-eg rc-input-eg--error">Error state</div>
          </div>
          <p class="rc-comp-note">{{ t.formNote }}</p>
        </div>
        <div class="rc-comp-card">
          <h4 class="rc-comp-title">{{ t.paletteTitle }}</h4>
          <div class="rc-palette">
            <div v-for="sw in palette" :key="sw.hex" class="rc-swatch-row">
              <div class="rc-swatch" :style="{ background: sw.hex }"></div>
              <div><b class="rc-sw-name">{{ sw.name }}</b><span class="rc-sw-hex">{{ sw.hex }}</span></div>
            </div>
          </div>
        </div>
        <div class="rc-comp-card">
          <h4 class="rc-comp-title">{{ t.typographyTitle }}</h4>
          <div class="rc-type-preview">
            <div><span class="rc-type-bold">DM Sans Bold</span><span class="rc-type-role">Headings</span></div>
            <div><span class="rc-type-reg">DM Sans Regular</span><span class="rc-type-role">Body</span></div>
            <div><span class="rc-type-med">DM Sans Medium</span><span class="rc-type-role">Data</span></div>
          </div>
        </div>
        <div class="rc-comp-card">
          <h4 class="rc-comp-title">{{ t.componentsTitle }}</h4>
          <div class="rc-btn-preview">
            <div class="rc-btn-eg rc-btn-eg--primary">Primary Button</div>
            <div class="rc-btn-eg rc-btn-eg--secondary">Secondary Button</div>
          </div>
        </div>
      </div>
    </section>

    <!-- 04 ENTREGÁVEIS -->
    <section class="rc-section rc-section--dark">
      <div class="rc-rule"><span class="rc-rule-label">04 — {{ t.delivLabel }}</span><span class="rc-rule-line"></span></div>
      <h3 class="rc-sub-heading">{{ t.delivHeading }}</h3>
      <div class="rc-deliverables-list">
        <div v-for="d in t.delivList" :key="d" class="rc-deliv-item"><span class="rc-deliv-dot"></span><span>{{ d }}</span></div>
      </div>
      <blockquote class="rc-deliv-quote">{{ t.delivQuote }}</blockquote>
      <h3 class="rc-sub-heading">{{ t.impactHeading }}</h3>
      <div class="rc-impact-grid">
        <div v-for="m in t.metrics" :key="m.num" class="rc-metric">
          <b class="rc-metric-n">{{ m.num }}</b><span class="rc-metric-l">{{ m.label }}</span>
        </div>
      </div>
    </section>

    <!-- 05 REFLEXÕES -->
    <section class="rc-section">
      <div class="rc-rule"><span class="rc-rule-label">05 — {{ t.reflexLabel }}</span><span class="rc-rule-line"></span></div>
      <h3 class="rc-sub-heading">{{ t.teamHeading }}</h3>
      <div class="rc-team">
        <div v-for="m in t.team" :key="m.role" class="rc-team-card">
          <b class="rc-team-role">{{ m.role }}</b><span class="rc-team-name">{{ m.name }}</span>
        </div>
      </div>
      <div class="rc-reflexoes">
        <div v-for="r in t.reflexoes" :key="r.question" class="rc-reflexao">
          <div class="rc-reflexao-icon">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4M12 8h.01"/></svg>
          </div>
          <div><h4 class="rc-ref-q">{{ r.question }}</h4><p class="rc-ref-a">{{ r.answer }}</p></div>
        </div>
      </div>
    </section>

    <footer class="rc-footer">
      <div class="rc-footer-inner">
        <span class="rc-footer-tag">{{ t.footerTag }}</span>
        <div class="rc-footer-links">
          <a href="/" class="rc-footer-link">{{ t.back }}</a>
          <a href="mailto:tayna.schultz@gmail.com" class="rc-footer-link">Email</a>
          <a href="https://www.linkedin.com/in/taynaschultz/" target="_blank" rel="noopener noreferrer" class="rc-footer-link">LinkedIn</a>
        </div>
      </div>
      <p class="rc-footer-copy">Case Study: Rodobens Unica Platform · Discovery, UX Strategy & UI Design · © 2025 Tayná Schultz</p>
    </footer>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import NavBar from './NavBar.vue'

import loginImg           from '../imagens cases/rodobens/login.png'
import kanbanImg          from '../imagens cases/rodobens/kanban.png'
import simulacaoImg       from '../imagens cases/rodobens/simulação.png'
import creditDashImg      from '../imagens cases/rodobens/Credit Analysis Dashboard Layout.png'
import notifImg           from '../imagens cases/rodobens/central de notificações.png'
import loginAntigoImg     from '../imagens cases/rodobens/ANTIGAS/login antigo.png'
import simulacaoAntigaImg from '../imagens cases/rodobens/ANTIGAS/simulação antiga.jpeg'
import negociacaoAntigaImg from '../imagens cases/rodobens/ANTIGAS/negociação antiga.png'
import menuAntigoImg      from '../imagens cases/rodobens/ANTIGAS/MENU antigo.png'

const props = defineProps({ lang: { type: String, default: 'PT' }, theme: { type: String, default: 'dark' } })

// Local mutable copies so NavBar can toggle theme/lang on this page
const lang  = ref(props.lang)
const theme = ref(props.theme)
const visC    = ref(false)
const oldView = ref({}  )   // { [screenIndex]: true } when showing old version
const toggleOld = (i) => { oldView.value = { ...oldView.value, [i]: !oldView.value[i] } }
const cRefs = ref([])
const setRef = (el, i) => { if (el) cRefs.value[i] = el }
let observer = null
onMounted(() => {
  observer = new IntersectionObserver(([e]) => { if (e.isIntersecting) visC.value = true }, { threshold: 0.1 })
  cRefs.value[0] && observer.observe(cRefs.value[0])
})
onUnmounted(() => observer?.disconnect())

const designScreens = [
  { title: 'Login & Autenticação', desc: 'Nova experiência de login com mensagens humanizadas e branding fortalecido', url: 'unica.rodobens.com.br/login', img: loginImg, oldImg: loginAntigoImg, note: null },
  { title: 'Novo Simulador de Crédito', desc: 'Design focado em hierarquia de elementos com heurística de estética e design minimalista', url: 'unica.rodobens.com.br/simulador', img: simulacaoImg, oldImg: simulacaoAntigaImg, note: null },
  { title: 'Kanban Comercial', desc: 'Gestão visual de negociações com comunicação Salesforce para acompanhamento centralizado', url: 'unica.rodobens.com.br/kanban', img: kanbanImg, oldImg: negociacaoAntigaImg, note: null },
  { title: 'Dashboard de Análise de Crédito', desc: 'Visão centralizada de propostas com SLA, alçadas e indicadores de urgência para analistas e gestores', url: 'unica.rodobens.com.br/analise', img: creditDashImg, oldImg: null, note: 'A tela substitui um processo manual em planilhas externas, unificando todas as propostas em andamento com rastreabilidade de prazo e responsável.' },
  { title: 'Central de Notificações', desc: 'Sistema unificado de alertas e notificações contextuais', url: 'unica.rodobens.com.br/notificacoes', img: notifImg, oldImg: menuAntigoImg, note: 'O cliente não possuía funcionalidade de notificações anteriormente. Todas as comunicações eram feitas externamente em outra aplicação.' },
]
const palette = [{ name: 'Primary Green', hex: '#0A5331' }, { name: 'Secondary Green', hex: '#05B44C' }, { name: 'Orange CTA', hex: '#FF7C43' }]

const copy = {
  PT: {
    back: 'Voltar ao portfólio', tag: 'UX · Business Design · Systems',
    title: 'Descomplicando<br><em>o Legado.</em>',
    subtitle: 'Discovery e estratégia de UX para a migração do core financeiro da Rodobens',
    accentLine: 'Mapeamento de 129 perfis de acesso e tradução de regras de negócio complexas em jornadas de usuário escaláveis',
    context: 'Equipe transformou um sistema legado de 7 anos — fragmentado e travando — em uma plataforma coesa. O desafio não era a idade do sistema: eram os problemas diários. Travamentos, falta de automação e dependência forçada de ferramentas externas. Restauramos a eficiência operacional transformando soluções improvisadas em fluxos integrados.',
    roles: ['UX Design', 'Business Design', 'Research', 'Facilitação', 'Handoff'],
    stats: { profiles: 'perfis mapeados', users: 'usuários ativos', months: 'meses de projeto', legacy: 'anos de legado' },
    complaintsLabel: 'Principais queixas dos usuários',
    complaints: ['Lentidão extrema e crashes constantes do sistema', 'Falta de automação em diversos processos críticos', 'Mensagens de erro confusas e feedback limitado ou inexistente', 'Tela inicial irrelevante e lenta — não era utilizada no dia a dia', 'Dificuldade e ineficiência no upload de documentos', 'Ausência de relatórios em tempo real — dependência de planilhas e apps externos'],
    overviewLabel: 'Sobre o Projeto',
    overviewBody: 'O projeto consistiu na modernização do sistema interno de locação e leasing do Grupo Rodobens — empresa com 75 anos de história. A migração do vTiger exigiu uma abordagem de discovery ágil para mapear 129 perfis de acesso, entender regras de negócio não documentadas e redesenhar jornadas críticas sem travar a operação.',
    deliverables: ['Discovery & Research', 'Mapeamento AS IS × TO BE', 'Arquitetura de Informação', 'Protopersonas', 'User Flow Design', 'Wireframes & UI Design'],
    triads: [
      { title: 'O Conflito', body: 'Falta de documentação das regras de negócio causava retrabalho constante e ambiguidade entre as equipes de desenvolvimento e operação.' },
      { title: 'A Decisão', body: 'Discovery Ágil focado em Shadowing e entrevistas com usuários-chave para extrair o conhecimento tácito que estava apenas nas cabeças das pessoas.' },
      { title: 'Trade-off', body: 'Foi necessário sacrificar o research exploratório amplo em favor de sprints de discovery direcionados às dores mais críticas do dia a dia operacional.' },
    ],
    designLabel: 'Solução de Design',
    designIntro: 'Utilização da library kit Nuxt UI v.3 adaptada para o cliente visando redução de tempo em produção e iteração de componentes.',
    dsBannerTitle: 'De HTML legacy a Design System moderno: evolução guiada por dados de usuário',
    dsBannerSub: 'Utilizamos Nuxt UI v3 como fundação, customizando componentes estrategicamente para atender as necessidades específicas do setor financeiro e os 603 usuários da plataforma.',
    principles: [
      { title: 'Redução de Carga Cognitiva', body: 'De overload informacional para hierarquia clara e respirável', color: '#F0185A' },
      { title: 'Escaneabilidade Aumentada', body: 'Usuários identificam prioridades em 3 segundos vs. 30+ segundos anteriormente', color: '#0CFDB5' },
      { title: 'Redução de Fadiga Visual', body: 'Tabelas com ~20 linhas vs. ~50 comprimidas, melhorando precisão na leitura', color: '#FF7C43' },
      { title: 'Formulários Progressivos', body: 'Divisão de ~50 campos em 4–5 steps lógicos, diminuindo taxa de abandono', color: '#F0185A' },
      { title: 'Tomada de Decisão Acelerada', body: 'Analistas identificam red flags em segundos via badges e cores semânticas', color: '#0CFDB5' },
      { title: 'Confiança Financeira', body: 'Cálculos visíveis em tempo real com breakdown de valores aumentam transparência', color: '#FF7C43' },
    ],
    decisionTitle: 'Decisão Estratégica: Biblioteca vs. Custom', decisionSub: 'Por que escolhemos Nuxt UI v3 como fundação:',
    decisionBenefitsTitle: 'Benefícios da Biblioteca',
    decisionBenefits: [
      { label: 'Velocidade:', body: 'Componentes base prontos reduziram 40% do tempo de implementação' },
      { label: 'Customização controlada:', body: 'Token system permitiu adaptação à identidade Rodobens mantendo consistência' },
      { label: 'Acessibilidade nativa:', body: 'WCAG 2.1 AA out-of-the-box (crítico para sistema financeiro)' },
      { label: 'Responsividade intrínseca:', body: 'Garantia de funcionamento cross-device' },
    ],
    decisionCustomTitle: 'O que Customizamos',
    decisionCustom: [
      { color: '#0A5331', label: 'Paleta:', body: 'Adaptação dos greens Rodobens (#0A5331, #05B44C) + orange CTA (#FF7C43)' },
      { color: '#05B44C', label: 'Componentes financeiros:', body: 'Simulador de crédito, cards de análise, status badges' },
      { color: '#FF7C43', label: 'Densidade de informação:', body: 'Ajustes de spacing para contexto B2B' },
      { color: '#111827', label: 'Validações contextuais:', body: 'Regras de negócio específicas do setor financeiro' },
    ],
    decisionQuote: 'A escolha de Nuxt UI v3 não foi sobre economizar tempo — foi sobre investir o tempo certo no que realmente importava: entender as 129 permissões de acesso, traduzir regras de negócio complexas em interfaces intuitivas, e garantir que cada componente refletisse as necessidades reais dos 603 usuários.',
    compsTitle: 'Componentes-Chave do Sistema',
    badge1: 'Aprovado', badge2: 'Pendente', badge3: 'Vencido', badge4: 'Em Análise',
    tableFeatures: ['Sorting multi-coluna', 'Filtros intuitivos', 'Paginação otimizada', 'Ações contextuais por linha'],
    tableNote: 'Densidade ajustada para dados financeiros', formNote: 'Máscaras para CPF/CNPJ e valores monetários',
    paletteTitle: 'Paleta de Cores', typographyTitle: 'Tipografia', componentsTitle: 'Componentes',
    delivLabel: 'Entregáveis & Resultados', delivHeading: 'O que foi entregue',
    delivList: ['Discovery completo com mapeamento de 129 perfis', 'User flows documentados (AS IS × TO BE)', 'Wireframes de todas as telas principais', 'Telas finais navegáveis (além do contrato inicial de wireframes)', 'Regras de negócio documentadas', 'Sistema escalável com possibilidade de adição de novas features'],
    delivQuote: 'Entregamos telas navegáveis versão final, além do contrato que previa wireframes, bem como toda a documentação das regras de negócio, fluxos validados e um sistema escalável, integrado e com usabilidade aprimorada.',
    impactHeading: 'Impacto do Projeto',
    metrics: [{ num: '129', label: 'perfis de acesso mapeados' }, { num: '603', label: 'usuários contemplados' }, { num: '6', label: 'meses de migração' }, { num: '7', label: 'anos de sistema legado modernizado' }, { num: '100%', label: 'das regras de negócio documentadas' }],
    reflexLabel: 'Reflexões & Aprendizados', teamHeading: 'Equipe',
    team: [{ role: 'UX Designer Pleno', name: 'Tayná' }, { role: 'Designer Júnior', name: 'Colaborador' }, { role: 'Líder de Design', name: 'Mentor' }, { role: 'Business Analyst', name: 'Equipe de Negócios' }, { role: 'Desenvolvedor', name: 'Equipe de Desenvolvimento' }],
    reflexoes: [
      { question: 'Qual foi o conflito real que você resolveu?', answer: 'Em negócios: transformar um sistema legado sem documentação em uma plataforma moderna e escalável, garantindo que nenhuma regra de negócio se perdesse. Em pessoas: gerenciamento de expectativas de stakeholders ansiosos por resultados.' },
      { question: 'O que abriu mão para resolvê-lo?', answer: 'Sacrifiquei pesquisa exploratória de longo prazo e relatórios extensos, priorizando shadowing intensivo, entrevistas direcionadas e documentação viva através de user flows — ferramentas que serviam simultaneamente ao time de design e engenharia.' },
      { question: 'Maturidade demonstrada', answer: 'Alinhamento entre expectativas da diretoria e realidade dos 603 usuários • Documentação viva que gerenciou integrações complexas (B3, Autbank) • Atuação como elo entre necessidades do cliente e viabilidade do produto.' },
    ],
    footerTag: 'Rodobens Unica Platform · 2025',
  },
  EN: {
    back: 'Back to portfolio', tag: 'UX · Business Design · Systems',
    title: 'Untangling<br><em>the Legacy.</em>',
    subtitle: "UX discovery and strategy for Rodobens' financial core migration",
    accentLine: 'Mapping 129 access profiles and translating complex business rules into scalable user journeys',
    context: "The team transformed a 7-year-old fragmented legacy system into a cohesive platform. The challenge wasn't the system's age — it was the daily problems: crashes, lack of automation, and forced dependency on external tools.",
    roles: ['UX Design', 'Business Design', 'Research', 'Facilitation', 'Handoff'],
    stats: { profiles: 'profiles mapped', users: 'active users', months: 'months of project', legacy: 'years of legacy' },
    complaintsLabel: 'Main user complaints',
    complaints: ['Extreme slowness and constant system crashes', 'Lack of automation in several critical processes', 'Confusing error messages and limited or no feedback', 'Irrelevant and slow home screen — not used in day-to-day work', 'Difficulty and inefficiency in document uploads', 'No real-time reports — dependency on spreadsheets and external apps'],
    overviewLabel: 'About the Project',
    overviewBody: 'The project involved modernizing the internal leasing system of Rodobens Group — a 75-year-old company. Migrating from vTiger required an agile discovery approach to map 129 access profiles, uncover undocumented business rules, and redesign critical journeys without halting operations.',
    deliverables: ['Discovery & Research', 'AS IS × TO BE Mapping', 'Information Architecture', 'Proto-Personas', 'User Flow Design', 'Wireframes & UI Design'],
    triads: [
      { title: 'The Conflict', body: 'Lack of business rule documentation caused constant rework and ambiguity between development and operations teams.' },
      { title: 'The Decision', body: "Agile Discovery focused on Shadowing and interviews with key users to extract tacit knowledge that existed only in people's heads." },
      { title: 'Trade-off', body: "We had to sacrifice broad exploratory research in favor of targeted discovery sprints focused on the most critical day-to-day operational pain points." },
    ],
    designLabel: 'Design Solution', designIntro: 'Using the Nuxt UI v.3 kit library adapted for the client to reduce production time and component iteration.',
    dsBannerTitle: 'From legacy HTML to modern Design System: evolution guided by user data',
    dsBannerSub: 'We used Nuxt UI v3 as foundation, strategically customizing components to meet the specific needs of the financial sector and the 603 platform users.',
    principles: [
      { title: 'Cognitive Load Reduction', body: 'From information overload to clear, breathable hierarchy', color: '#F0185A' },
      { title: 'Increased Scannability', body: 'Users identify priorities in 3 seconds vs. 30+ seconds previously', color: '#0CFDB5' },
      { title: 'Visual Fatigue Reduction', body: 'Tables with ~20 rows vs. ~50 compressed, improving reading accuracy', color: '#FF7C43' },
      { title: 'Progressive Forms', body: 'Splitting ~50 fields into 4–5 logical steps, reducing abandonment rate', color: '#F0185A' },
      { title: 'Accelerated Decision-Making', body: 'Analysts identify red flags in seconds via badges and semantic colors', color: '#0CFDB5' },
      { title: 'Financial Confidence', body: 'Real-time visible calculations with value breakdowns increase transparency', color: '#FF7C43' },
    ],
    decisionTitle: 'Strategic Decision: Library vs. Custom', decisionSub: 'Why we chose Nuxt UI v3 as foundation:',
    decisionBenefitsTitle: 'Library Benefits',
    decisionBenefits: [
      { label: 'Speed:', body: 'Ready base components reduced 40% of implementation time' },
      { label: 'Controlled customization:', body: 'Token system allowed adaptation to Rodobens identity while maintaining consistency' },
      { label: 'Native accessibility:', body: 'WCAG 2.1 AA out-of-the-box (critical for financial systems)' },
      { label: 'Intrinsic responsiveness:', body: 'Guaranteed cross-device functionality' },
    ],
    decisionCustomTitle: 'What We Customized',
    decisionCustom: [
      { color: '#0A5331', label: 'Color palette:', body: 'Adaptation of Rodobens greens (#0A5331, #05B44C) + orange CTA (#FF7C43)' },
      { color: '#05B44C', label: 'Financial components:', body: 'Credit simulator, analysis cards, status badges' },
      { color: '#FF7C43', label: 'Information density:', body: 'Spacing adjustments for B2B context' },
      { color: '#111827', label: 'Contextual validations:', body: 'Business rules specific to the financial sector' },
    ],
    decisionQuote: "The choice of Nuxt UI v3 wasn't about saving time — it was about investing the right time in what truly mattered: understanding the 129 access permissions and translating complex business rules into intuitive interfaces.",
    compsTitle: 'Key System Components',
    badge1: 'Approved', badge2: 'Pending', badge3: 'Overdue', badge4: 'In Review',
    tableFeatures: ['Multi-column sorting', 'Intuitive filters', 'Optimized pagination', 'Contextual row actions'],
    tableNote: 'Density adjusted for financial data', formNote: 'Masks for tax IDs and monetary values',
    paletteTitle: 'Color Palette', typographyTitle: 'Typography', componentsTitle: 'Components',
    delivLabel: 'Deliverables & Results', delivHeading: 'What was delivered',
    delivList: ['Full discovery with mapping of 129 profiles', 'Documented user flows (AS IS × TO BE)', 'Wireframes for all main screens', 'Final navigable screens (beyond the initial wireframe contract)', 'Documented business rules', 'Scalable system with the ability to add new features'],
    delivQuote: 'We delivered final navigable screens, beyond the wireframe contract, as well as full business rule documentation, validated flows, and a scalable, integrated system with improved usability.',
    impactHeading: 'Project Impact',
    metrics: [{ num: '129', label: 'access profiles mapped' }, { num: '603', label: 'users served' }, { num: '6', label: 'months of migration' }, { num: '7', label: 'years of legacy modernized' }, { num: '100%', label: 'of business rules documented' }],
    reflexLabel: 'Reflections & Learnings', teamHeading: 'Team',
    team: [{ role: 'UX Designer (Mid)', name: 'Tayná' }, { role: 'Junior Designer', name: 'Collaborator' }, { role: 'Design Lead', name: 'Mentor' }, { role: 'Business Analyst', name: 'Business Team' }, { role: 'Developer', name: 'Development Team' }],
    reflexoes: [
      { question: 'What was the real conflict you solved?', answer: 'In business: transforming a legacy system without documentation into a modern, scalable platform, ensuring no business rule was lost. In people: managing the expectations of stakeholders anxious for results.' },
      { question: 'What did you give up to solve it?', answer: 'I sacrificed long-term exploratory research and extensive reports, prioritizing intensive shadowing, targeted interviews, and living documentation through user flows.' },
      { question: 'Demonstrated maturity', answer: 'Aligning board expectations with the reality of 603 users • Living documentation that managed complex integrations (B3, Autbank) • Acting as the link between client needs and product feasibility.' },
    ],
    footerTag: 'Rodobens Unica Platform · 2025',
  },
}
const t = computed(() => copy[lang.value] || copy['PT'])
</script>

<style>
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500&display=swap');
.rc-root{font-family:'DM Sans',sans-serif;min-height:100svh;position:relative;overflow-x:hidden;transition:background .5s,color .5s}
.theme-dark{background:#070711;color:#F0EFF8}
.theme-light{background:#F5F3FF;color:#0D0C1A}
.rc-grain{position:fixed;inset:0;z-index:0;pointer-events:none;opacity:.035;background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");background-size:180px}
.rc-back{position:fixed;top:1.5rem;left:1.5rem;z-index:100;display:inline-flex;align-items:center;gap:.4rem;font-size:.6rem;font-weight:500;letter-spacing:.12em;text-transform:uppercase;text-decoration:none;color:var(--fg-muted,#6B6A82);border:1px solid var(--border,rgba(255,255,255,.07));padding:.4rem .75rem;background:var(--bg,#070711);transition:color .2s,border-color .2s}
.rc-back:hover{color:#F0185A;border-color:rgba(240,24,90,.35)}
.rc-hero{position:relative;z-index:1;padding:7rem 1.5rem 4rem;display:flex;flex-direction:column;gap:2.5rem}
.rc-hero-left{display:flex;flex-direction:column;gap:1.1rem}
.rc-eyebrow{display:flex;align-items:center;gap:.5rem;font-size:.58rem;font-weight:500;letter-spacing:.16em;text-transform:uppercase;color:#F0185A}
.rc-sep,.rc-year{color:var(--fg-muted,#6B6A82)}
.rc-title{font-family:'Clash Display',sans-serif;font-weight:700;font-size:clamp(2.5rem,9vw,6rem);line-height:1;letter-spacing:-.03em}
.rc-title em{font-style:italic;color:#F0185A}
.rc-subtitle{font-size:clamp(1.125rem,2.5vw,1.35rem);font-weight:300;line-height:1.7;color:var(--fg-muted,#6B6A82)}
.rc-accent{font-size:clamp(1.125rem,2vw,1.25rem);font-weight:500;line-height:1.65;color:#F0185A;opacity:.85}
.rc-ctx{border-left:2px solid rgba(240,24,90,.35);padding-left:1rem;font-size:clamp(1.125rem,2vw,1.25rem);font-weight:300;line-height:1.9;color:var(--fg-muted,#6B6A82)}
.rc-roles{display:flex;flex-wrap:wrap;gap:.3rem}
.rc-role{font-size:.58rem;font-weight:500;letter-spacing:.1em;text-transform:uppercase;color:var(--fg-muted,#6B6A82);border:1px solid rgba(255,255,255,.08);padding:.25rem .55rem;transition:color .2s,border-color .2s}
.rc-role:hover{color:#F0185A;border-color:rgba(240,24,90,.35)}
.rc-hero-right{display:flex;flex-direction:column;gap:.85rem}
.rc-stats-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:.45rem}
.rc-stat{display:flex;flex-direction:column;gap:.1rem;background:rgba(255,255,255,.03);border:1px solid rgba(255,255,255,.07);padding:.55rem .65rem}
.rc-sn{font-family:'Clash Display',sans-serif;font-weight:700;font-size:1.3rem;line-height:1}
.rc-sl{font-size:7px;font-weight:500;letter-spacing:.1em;text-transform:uppercase;color:var(--fg-muted,#6B6A82);white-space:nowrap}
.rc-screen{background:var(--bg,#070711);border:1px solid rgba(255,255,255,.08);border-radius:8px;overflow:hidden;box-shadow:0 20px 60px rgba(0,0,0,.4);transition:transform .4s,box-shadow .4s}
.rc-screen:hover{transform:translateY(-3px);box-shadow:0 28px 70px rgba(240,24,90,.07),0 20px 50px rgba(0,0,0,.4)}
.rc-browser{display:flex;align-items:center;gap:.35rem;background:rgba(255,255,255,.04);padding:.5rem .75rem;border-bottom:1px solid rgba(255,255,255,.06)}
.rc-dot{width:7px;height:7px;border-radius:50%;flex-shrink:0}
.rc-dot-r{background:#FF6467}.rc-dot-y{background:#FDC700}.rc-dot-g{background:#05DF72}
.rc-url{font-size:.58rem;color:var(--fg-muted,#6B6A82);background:rgba(255,255,255,.05);border-radius:3px;padding:.12rem .45rem;margin-left:.35rem;flex:1}
.rc-screen-img{width:100%;display:block;object-fit:cover}
.rc-section{position:relative;z-index:1;padding:4rem 1.5rem;border-top:1px solid rgba(255,255,255,.05)}
.rc-section--dark{background:rgba(240,24,90,.03)}
.rc-rule{display:flex;align-items:center;gap:1rem;margin-bottom:2rem}
.rc-rule-label{font-size:.58rem;font-weight:500;letter-spacing:.18em;text-transform:uppercase;color:#F0185A;white-space:nowrap;flex-shrink:0}
.rc-rule-line{flex:1;height:1px;background:linear-gradient(90deg,rgba(240,24,90,.4) 0%,transparent 70%)}
.rc-section-intro{font-size:clamp(1.125rem,2vw,1.25rem);font-weight:300;line-height:1.85;color:var(--fg-muted,#6B6A82);max-width:65ch;margin-bottom:2.5rem}
.rc-sub-heading{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1.1rem,3vw,1.5rem);letter-spacing:-.015em;color:var(--fg,#F0EFF8);margin-bottom:1.25rem}
.rc-complaints-grid{display:grid;grid-template-columns:1fr;gap:.6rem}
.rc-complaint{display:flex;align-items:flex-start;gap:.8rem;border:1px solid rgba(255,255,255,.06);padding:.9rem 1rem;opacity:0;transform:translateY(14px);transition:opacity .5s ease calc(var(--ci,0)*.08s),transform .5s cubic-bezier(.16,1,.3,1) calc(var(--ci,0)*.08s),border-color .2s}
.rc-complaint--vis{opacity:1;transform:translateY(0)}
.rc-complaint:hover{border-color:rgba(240,24,90,.25)}
.rc-cnum{font-family:'Clash Display',sans-serif;font-weight:700;font-size:.6rem;color:#F0185A;opacity:.5;flex-shrink:0;letter-spacing:.1em}
.rc-ctxt{font-size:clamp(1.125rem,2vw,1.25rem);font-weight:300;line-height:1.7;color:var(--fg-muted,#6B6A82)}
.rc-overview-row{display:flex;flex-direction:column;gap:1.25rem;margin-bottom:2rem}
.rc-overview-body{font-size:clamp(1.125rem,2vw,1.3rem);font-weight:300;line-height:1.9;color:var(--fg-muted,#6B6A82);max-width:65ch}
.rc-deliverables{display:flex;flex-wrap:wrap;gap:.35rem}
.rc-del{display:inline-flex;align-items:center;gap:.35rem;font-size:.58rem;font-weight:500;letter-spacing:.1em;text-transform:uppercase;color:var(--fg,#F0EFF8);background:rgba(240,24,90,.07);border:1px solid rgba(240,24,90,.18);padding:.25rem .55rem}
.rc-del-dot{width:4px;height:4px;border-radius:50%;background:#F0185A;flex-shrink:0}
.rc-triads{display:grid;grid-template-columns:1fr;gap:1px;background:rgba(255,255,255,.04)}
.rc-triad{padding:1.25rem;background:var(--bg,#070711);position:relative;transition:border-color .2s}
.rc-triad::before{content:'';position:absolute;top:0;left:0;right:0;height:2px;background:#F0185A;opacity:0;transition:opacity .3s}
.rc-triad:hover::before{opacity:1}
.rc-triad-t{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(.95rem,2.5vw,1.2rem);letter-spacing:-.01em;color:var(--fg,#F0EFF8);margin-bottom:.5rem}
.rc-triad-b{font-size:clamp(1.125rem,2vw,1.25rem);font-weight:300;line-height:1.85;color:var(--fg-muted,#6B6A82)}
.rc-screens-list{display:flex;flex-direction:column;gap:2.5rem;margin-bottom:3rem}
.rc-ds-header{margin-bottom:.85rem}
.rc-ds-title{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1.1rem,3vw,1.45rem);letter-spacing:-.015em;color:var(--fg,#F0EFF8);margin-bottom:.3rem}
.rc-ds-desc{font-size:clamp(1.125rem,2vw,1.25rem);font-weight:300;color:var(--fg-muted,#6B6A82);line-height:1.6;max-width:60ch}
.rc-ds-note{font-size:1.125rem;font-style:italic;color:var(--fg-muted,#6B6A82);margin-top:.65rem;border-left:2px solid rgba(240,24,90,.3);padding-left:.75rem}
.rc-ds-banner{background:#F0185A;border-radius:8px;padding:1.75rem 1.5rem;margin-bottom:2.5rem}
.rc-ds-banner-title{font-family:'Clash Display',sans-serif;font-weight:700;font-size:clamp(1.05rem,3vw,1.5rem);color:#fff;line-height:1.2;margin-bottom:.6rem}
.rc-ds-banner-sub{font-size:clamp(1.125rem,2vw,1.25rem);color:rgba(255,255,255,.85);font-weight:300;line-height:1.75}
.rc-principles{display:grid;grid-template-columns:1fr;gap:.65rem;margin-bottom:2.5rem}
.rc-principle{border:1px solid rgba(255,255,255,.06);border-left:3px solid var(--acc,#F0185A);padding:.9rem 1rem;transition:border-color .2s}
.rc-principle:hover{border-color:rgba(240,24,90,.25)}
.rc-pr-title{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(.9rem,2vw,1rem);color:var(--fg,#F0EFF8);margin-bottom:.3rem}
.rc-pr-body{font-size:clamp(1.125rem,1.8vw,1.25rem);font-weight:300;color:var(--fg-muted,#6B6A82);line-height:1.7}
.rc-decision{background:rgba(255,255,255,.02);border:1px solid rgba(255,255,255,.06);border-left:3px solid #0CFDB5;padding:1.25rem 1.35rem;margin-bottom:2.5rem}
.rc-dec-title{font-family:'Clash Display',sans-serif;font-weight:700;font-size:clamp(.95rem,2.5vw,1.25rem);color:var(--fg,#F0EFF8);margin-bottom:.3rem}
.rc-dec-sub{font-size:1.125rem;color:var(--fg-muted,#6B6A82);margin-bottom:1.1rem}
.rc-dec-cols{display:grid;grid-template-columns:1fr;gap:1.25rem;margin-bottom:1.1rem}
.rc-dec-col-title{font-size:.62rem;font-weight:600;letter-spacing:.12em;text-transform:uppercase;margin-bottom:.65rem}
.rc-dec-list{list-style:none;display:flex;flex-direction:column;gap:.45rem}
.rc-dec-list li{font-size:clamp(1.125rem,1.8vw,1.25rem);font-weight:300;color:var(--fg-muted,#6B6A82);line-height:1.7}
.rc-dec-list li b{font-weight:500;color:var(--fg,#F0EFF8)}
.rc-dec-custom-item{display:flex;align-items:flex-start;gap:.45rem}
.rc-dec-swatch{width:11px;height:11px;border-radius:2px;flex-shrink:0;margin-top:.18rem}
.rc-dec-quote{font-style:italic;font-size:clamp(1.125rem,2vw,1.25rem);color:var(--fg-muted,#6B6A82);border-left:2px solid rgba(240,24,90,.3);padding-left:.8rem;line-height:1.8}
.rc-comps-title{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1.05rem,3vw,1.4rem);letter-spacing:-.015em;color:var(--fg,#F0EFF8);margin-bottom:1.1rem}
.rc-comps-grid{display:grid;grid-template-columns:1fr;gap:.65rem}
.rc-comp-card{background:rgba(255,255,255,.03);border:1px solid rgba(255,255,255,.07);padding:1rem;transition:border-color .2s}
.rc-comp-card:hover{border-color:rgba(240,24,90,.2)}
.rc-comp-title{font-family:'Clash Display',sans-serif;font-weight:600;font-size:.9rem;color:var(--fg,#F0EFF8);margin-bottom:.75rem}
.rc-comp-note{font-size:1.125rem;color:var(--fg-muted,#6B6A82);margin-top:.65rem}
.rc-comp-note--i{font-style:italic}
.rc-comp-list{list-style:none;display:flex;flex-direction:column;gap:.35rem}
.rc-comp-list li{font-size:1.125rem;color:var(--fg-muted,#6B6A82);padding-left:.75rem;position:relative}
.rc-comp-list li::before{content:'·';position:absolute;left:0;color:#F0185A}
.rc-badges-preview{display:flex;flex-wrap:wrap;gap:.35rem;margin-bottom:.4rem}
.rc-badge-pill{font-size:.58rem;font-weight:500;color:#fff;padding:.2rem .6rem;border-radius:999px;white-space:nowrap}
.rc-input-preview{display:flex;flex-direction:column;gap:.35rem}
.rc-input-eg{font-size:.7rem;padding:.38rem .6rem;border-radius:4px;color:var(--fg-muted,#6B6A82)}
.rc-input-eg--default{border:1px solid rgba(255,255,255,.15)}
.rc-input-eg--focus{border:2px solid #0A5331}
.rc-input-eg--error{border:2px solid #FB2C36}
.rc-palette{display:flex;flex-direction:column;gap:.5rem}
.rc-swatch-row{display:flex;align-items:center;gap:.65rem}
.rc-swatch{width:30px;height:30px;border-radius:5px;flex-shrink:0;box-shadow:0 2px 8px rgba(0,0,0,.3)}
.rc-sw-name{display:block;font-size:.72rem;font-weight:500;color:var(--fg,#F0EFF8)}
.rc-sw-hex{font-size:.62rem;color:var(--fg-muted,#6B6A82)}
.rc-type-preview{display:flex;flex-direction:column;gap:.45rem}
.rc-type-preview>div{display:flex;align-items:baseline;gap:.45rem}
.rc-type-bold{font-weight:700;font-size:1.05rem;color:var(--fg,#F0EFF8)}
.rc-type-reg{font-weight:400;font-size:.9rem;color:var(--fg,#F0EFF8)}
.rc-type-med{font-weight:500;font-size:.82rem;color:var(--fg,#F0EFF8)}
.rc-type-role{font-size:.62rem;color:var(--fg-muted,#6B6A82)}
.rc-btn-preview{display:flex;flex-direction:column;gap:.45rem}
.rc-btn-eg{font-size:.7rem;font-weight:500;text-align:center;padding:.55rem;border-radius:8px}
.rc-btn-eg--primary{background:#FF7C43;color:#fff}
.rc-btn-eg--secondary{background:transparent;border:2px solid #0A5331;color:#0A5331}
.rc-deliverables-list{display:flex;flex-direction:column;gap:.45rem;margin-bottom:1.75rem}
.rc-deliv-item{display:flex;align-items:center;gap:.65rem;background:rgba(255,255,255,.03);border:1px solid rgba(255,255,255,.06);padding:.8rem .9rem;font-size:clamp(1.125rem,2vw,1.25rem);color:var(--fg,#F0EFF8);font-weight:300}
.rc-deliv-dot{width:6px;height:6px;border-radius:50%;background:#F0185A;flex-shrink:0}
.rc-deliv-quote{font-style:italic;font-size:clamp(1.125rem,2vw,1.3rem);color:var(--fg,#F0EFF8);border-left:3px solid #F0185A;padding:.9rem 1.1rem;background:rgba(240,24,90,.05);margin-bottom:2rem;line-height:1.8}
.rc-impact-grid{display:grid;grid-template-columns:1fr;gap:.65rem}
.rc-metric{background:#F0185A;border-radius:8px;padding:1.1rem 1.25rem}
.rc-metric-n{display:block;font-family:'Clash Display',sans-serif;font-weight:700;font-size:clamp(1.75rem,5vw,2.5rem);color:#fff;line-height:1;margin-bottom:.3rem}
.rc-metric-l{font-size:clamp(1.125rem,2vw,1.25rem);color:rgba(255,255,255,.85);font-weight:300}
.rc-team{display:flex;flex-wrap:wrap;gap:.45rem;margin-bottom:2rem}
.rc-team-card{background:rgba(255,255,255,.03);border:1px solid rgba(255,255,255,.07);padding:.65rem .9rem}
.rc-team-role{display:block;font-size:1.125rem;font-weight:500;color:var(--fg,#F0EFF8);margin-bottom:.15rem}
.rc-team-name{font-size:1rem;color:var(--fg-muted,#6B6A82)}
.rc-reflexoes{display:flex;flex-direction:column;gap:.85rem}
.rc-reflexao{display:flex;align-items:flex-start;gap:.9rem;border:1px solid rgba(255,255,255,.07);padding:1.1rem;transition:border-color .2s}
.rc-reflexao:hover{border-color:rgba(240,24,90,.25)}
.rc-reflexao-icon{display:flex;align-items:center;justify-content:center;flex-shrink:0;color:#F0185A}
.rc-ref-q{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1.125rem,2vw,1.35rem);color:#F0185A;margin-bottom:.5rem}
.rc-ref-a{font-size:clamp(1.125rem,2vw,1.25rem);font-weight:300;line-height:1.85;color:var(--fg-muted,#6B6A82)}
.rc-footer{position:relative;z-index:1;background:rgba(0,0,0,.4);border-top:1px solid rgba(255,255,255,.07);padding:1.75rem 1.5rem}
.rc-footer-inner{display:flex;justify-content:space-between;align-items:center;margin-bottom:.85rem;flex-wrap:wrap;gap:.65rem}
.rc-footer-tag{font-size:.58rem;font-weight:500;letter-spacing:.12em;text-transform:uppercase;color:var(--fg-muted,#6B6A82)}
.rc-footer-links{display:flex;gap:.9rem}
.rc-footer-link{font-size:.58rem;color:var(--fg-muted,#6B6A82);text-decoration:none;letter-spacing:.08em;text-transform:uppercase;transition:color .2s}
.rc-footer-link:hover{color:#F0185A}
.rc-footer-copy{font-size:.55rem;color:var(--fg-muted,#6B6A82);opacity:.45;text-align:center}
@media(min-width:640px){.rc-hero{padding:8rem 3rem 4rem}.rc-section{padding:5rem 3rem}.rc-back{left:3rem}.rc-complaints-grid{grid-template-columns:repeat(2,1fr)}.rc-triads{grid-template-columns:repeat(3,1fr)}.rc-principles{grid-template-columns:repeat(2,1fr)}.rc-comps-grid{grid-template-columns:repeat(2,1fr)}.rc-impact-grid{grid-template-columns:repeat(2,1fr)}.rc-dec-cols{grid-template-columns:repeat(2,1fr)}.rc-footer{padding:2rem 3rem}}
@media(min-width:1024px){.rc-hero{padding:9rem 7rem 5rem;flex-direction:row;align-items:flex-start;gap:4rem}.rc-hero-left{flex:1}.rc-hero-right{flex:0 0 460px}.rc-section{padding:6rem 7rem}.rc-back{left:7rem}.rc-overview-row{flex-direction:row;align-items:flex-start;gap:2.5rem}.rc-overview-body{flex:1.3}.rc-deliverables{flex:1;flex-direction:column}.rc-del{width:100%}.rc-complaints-grid{grid-template-columns:repeat(3,1fr)}.rc-principles{grid-template-columns:repeat(3,1fr)}.rc-comps-grid{grid-template-columns:repeat(3,1fr)}.rc-impact-grid{grid-template-columns:repeat(5,1fr)}.rc-footer{padding:2.5rem 7rem}}
@media(min-width:1400px){.rc-hero{padding:10rem 10rem 5rem}.rc-section{padding:7rem 10rem}.rc-back{left:10rem}.rc-footer{padding:3rem 10rem}}

/* ── Teal token — high contrast in both themes ── */
.rc-root{--teal:#0CFDB5}
.theme-light.rc-root{--teal:#007A52}
.rc-teal{color:var(--teal)}
.rc-ref-q{color:var(--teal)!important}

/* ── Before/After toggle ── */
.rc-img-wrap{position:relative;overflow:hidden}
.rc-before-btn{
  position:absolute;bottom:.85rem;right:.85rem;
  display:inline-flex;align-items:center;gap:.45rem;
  font-family:'DM Sans',sans-serif;font-size:.62rem;font-weight:600;
  letter-spacing:.1em;text-transform:uppercase;
  background:rgba(7,7,17,.82);color:#F0EFF8;
  border:1px solid rgba(255,255,255,.18);
  padding:.45rem .85rem;border-radius:2px;
  cursor:pointer;backdrop-filter:blur(8px);
  transition:background .2s,border-color .2s,color .2s;
  z-index:10;
}
.theme-light .rc-before-btn{background:rgba(245,243,255,.88);color:#0D0C1A;border-color:rgba(0,0,0,.18)}
.rc-before-btn:hover{background:#F0185A;border-color:#F0185A;color:#fff}
.rc-before-btn--active{background:#0A5331;border-color:#05B44C;color:#fff}
.rc-before-btn--active:hover{background:#05B44C}
.rc-before-icon{font-size:.85rem;line-height:1}

/* ── Flip transition ── */
.rc-flip-enter-active,.rc-flip-leave-active{transition:opacity .25s ease,transform .25s ease}
.rc-flip-enter-from{opacity:0;transform:scale(.98)}
.rc-flip-leave-to{opacity:0;transform:scale(1.01)}
</style>
