<template>
  <div :class="['rc-root', `theme-${theme}`]">
    <div class="rc-grain" aria-hidden="true"></div>

    <NavBar v-model:lang="lang" v-model:theme="theme" />

    <!-- 01 HERO -->
    <section class="rc-hero">
      <div class="rc-hero-left">
        <div class="rc-eyebrow"><span class="rc-tag">{{ t.tag }}</span><span class="rc-sep">·</span><span class="rc-year">2026</span></div>
        <h1 class="rc-title" v-html="t.title"></h1>
        <p class="rc-subtitle" v-html="t.subtitle"></p>
        <p class="rc-accent">{{ t.accentLine }}</p>
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
          <span class="rc-cicon" aria-hidden="true">
            <!-- 0: crashes / slowness -->
            <svg v-if="i === 0" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/>
            </svg>
            <!-- 1: lack of automation -->
            <svg v-else-if="i === 1" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="12" cy="12" r="3"/>
              <path d="M19.07 4.93a10 10 0 0 1 0 14.14M4.93 4.93a10 10 0 0 0 0 14.14"/>
              <path d="M12 2v2M12 20v2M2 12h2M20 12h2"/>
            </svg>
            <!-- 2: confusing error messages -->
            <svg v-else-if="i === 2" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="12" cy="12" r="10"/>
              <line x1="12" y1="8" x2="12" y2="12"/>
              <line x1="12" y1="16" x2="12.01" y2="16"/>
            </svg>
            <!-- 3: useless home screen -->
            <svg v-else-if="i === 3" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <rect x="2" y="3" width="20" height="14" rx="2"/>
              <line x1="8" y1="21" x2="16" y2="21"/>
              <line x1="12" y1="17" x2="12" y2="21"/>
              <line x1="4" y1="7" x2="20" y2="7"/>
            </svg>
            <!-- 4: document upload issues -->
            <svg v-else-if="i === 4" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
              <polyline points="14 2 14 8 20 8"/>
              <line x1="12" y1="18" x2="12" y2="12"/>
              <line x1="9" y1="15" x2="15" y2="15"/>
            </svg>
            <!-- 5: no real-time reports -->
            <svg v-else-if="i === 5" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <line x1="18" y1="20" x2="18" y2="10"/>
              <line x1="12" y1="20" x2="12" y2="4"/>
              <line x1="6" y1="20" x2="6" y2="14"/>
              <line x1="2" y1="20" x2="22" y2="20"/>
            </svg>
          </span>
          <p class="rc-ctxt">{{ c }}</p>
        </div>
      </div>
    </section>

    <!-- OVERVIEW -->
    <section class="rc-section">
      <div class="rc-rule"><span class="rc-rule-label">01 — {{ t.overviewLabel }}</span><span class="rc-rule-line"></span></div>
      <div class="rc-overview-row">
        <p class="rc-overview-body" v-html="t.overviewBody"></p>
        <div class="rc-deliverables"><div v-for="d in t.deliverables" :key="d" class="rc-del"><span class="rc-del-dot"></span>{{ d }}</div></div>
      </div>
      <div class="rc-triads">
        <div v-for="tr in t.triads" :key="tr.title" class="rc-triad"><h3 class="rc-triad-t">{{ tr.title }}</h3><p class="rc-triad-b">{{ tr.body }}</p></div>
      </div>
    </section>

    <!-- 03 SOLUÇÃO DE DESIGN -->
    <section class="rc-section">
      <div class="rc-rule"><span class="rc-rule-label">03 — {{ t.designLabel }}</span><span class="rc-rule-line"></span></div>
      <p class="rc-section-intro" v-html="t.designIntro"></p>

      <div class="rc-screens-list">
        <div v-for="(s, i) in designScreens" :key="s.img" class="rc-design-screen">
          <div class="rc-ds-header">
            <h3 class="rc-ds-title">{{ s.title }}</h3>
            <p class="rc-ds-desc" v-html="s.desc"></p>
            <p v-if="s.note" class="rc-ds-note">{{ s.note }}</p>
          </div>
          <div class="rc-ds-img-col">
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
                  <span>{{ oldView[i] ? t.btnAfter : t.btnBefore }}</span>
                  <span class="rc-before-icon" aria-hidden="true">{{ oldView[i] ? '→' : '←' }}</span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="rc-ds-banner">
        <p class="rc-ds-banner-title">{{ t.dsBannerTitle }}</p>
        <p class="rc-ds-banner-sub">{{ t.dsBannerSub }}</p>
      </div>

      <div class="rc-rule rc-rule--principles"><span class="rc-rule-label">{{ t.principlesLabel }}</span><span class="rc-rule-line"></span></div>

      <div class="rc-principles">
        <div v-for="(p, pi) in t.principles" :key="p.title" class="rc-principle" :style="{ '--acc': p.color }">
          <div class="rc-pr-icon" :style="{ color: p.color }">
            <!-- 0: cognitive load -->
            <svg v-if="pi === 0" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/><circle cx="12" cy="12" r="10"/><line x1="12" y1="17" x2="12.01" y2="17"/>
            </svg>
            <!-- 1: scannability -->
            <svg v-else-if="pi === 1" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
            </svg>
            <!-- 2: visual fatigue -->
            <svg v-else-if="pi === 2" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>
            </svg>
            <!-- 3: progressive forms -->
            <svg v-else-if="pi === 3" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/>
              <line x1="3" y1="6" x2="3.01" y2="6"/><line x1="3" y1="12" x2="3.01" y2="12"/><line x1="3" y1="18" x2="3.01" y2="18"/>
            </svg>
            <!-- 4: decision making -->
            <svg v-else-if="pi === 4" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/>
            </svg>
            <!-- 5: financial confidence -->
            <svg v-else-if="pi === 5" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
            </svg>
          </div>
          <div>
            <h4 class="rc-pr-title">{{ p.title }}</h4>
            <p class="rc-pr-body">{{ p.body }}</p>
          </div>
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
      <p class="rc-footer-copy">Case Study: Rodobens Unica Platform · Discovery, UX Strategy & UI Design · © 2026 Tayná Schultz</p>
    </footer>

    <!-- Back to top -->
    <button class="btt-btn" :class="{ 'btt-btn--visible': showBtt }" @click="scrollToTop" aria-label="Voltar ao topo">
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="18 15 12 9 6 15"/></svg>
    </button>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import NavBar from './NavBar.vue'

import loginImg           from '../imagens cases/rodobens/login.png'
import kanbanImg          from '../imagens cases/rodobens/kanban.png'
import simulacaoImg       from '../imagens cases/rodobens/simulação.png'
import creditDashImg      from '../imagens cases/rodobens/Dashboard crédito.png'
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

// ── Back to top ───────────────────────────────────────────────
const showBtt = ref(false)
function onScrollBtt () {
  const scrolled = window.scrollY / (document.documentElement.scrollHeight - window.innerHeight)
  showBtt.value = scrolled >= (window.innerWidth < 768 ? 0.30 : 0.65)
}
function scrollToTop () { window.scrollTo({ top: 0, behavior: 'smooth' }) }
onMounted(()   => window.addEventListener('scroll', onScrollBtt, { passive: true }))
onUnmounted(() => window.removeEventListener('scroll', onScrollBtt))

const screensCopy = {
  PT: [
    { title: 'Login & Autenticação', desc: 'Iniciamos pela tela de login. <em class="rc-hint">Clique no botão no canto superior direito da imagem para ver como era antes.</em> Aplicamos <b>heurísticas</b> de <b>prevenção de erros</b>, <b>controle e liberdade</b>, <b>visibilidade e status</b> do sistema, e <b>flexibilidade</b> e eficiência de uso apenas adicionando funcionalidades <b>base</b>, como visualização da <b>senha</b>, cenário de <b>erro</b>, <b>cores</b> e <b>hierarquia</b>. Além de reforçarmos o <b>brand</b> da marca com uma tela inicial <b>humanizada</b>. Aqui foi solicitada a remoção da funcionalidade de esquecimento de senha por regras de sistema interno.', note: null },
    { title: 'Novo Simulador de Crédito', desc: 'A antiga tela de simulação possuía <b>termos confusos</b> e fluxo <b>não linear</b>, impossibilidade do usuário <b>editar</b> e falta de <b>clareza</b> na hora de relacionar a adição de seguros ou peças com o veículo a ser financiado. Havia a necessidade de flegar elementos <b>desnecessariamente</b> para seguir o fluxo, excesso de cards e <b>impossibilidade de exclusão</b> ou arquivamento.<br><br>Na nova tela trouxemos o resumo dos principais dados do cliente fixos no topo superior direito, <b>nomenclaturas coesas</b> com as ações do usuário, e visual de calculadora amigável. Também <b>sanamos dores</b> adicionando <b>arquivamento, histórico completo, avisos de sistema e sinalizações claras</b>.', note: null },
    { title: 'Kanban Comercial', desc: 'A operação diária de diversos perfis é feita majoritariamente por planilhas, porém, alguns usuários utilizavam <b>plataformas externas</b> para poderem visualizar a fila de operações em formato de <b>kanban</b>. Com essa necessidade, <b>entendemos</b> que o <b>sistema precisaria</b> das duas visualizações aplicadas em momentos diferentes, uma sendo em andamento e a outra geral. Então, implementamos o kanban, a possibilidade de ordenamento, filtros aplicados em um campo que abre lateralmente no canto superior direito, a lista de negociações em formato de planilha.', note: null },
    { title: 'Dashboard de Análise de Crédito', desc: 'Havia a <b>necessidade</b> de visualização de <b>desempenho de equipe</b> e <b>comparativos</b> mensais por parte das alçadas superiores, dependência de plataformas externas e falta de visualização e <b>senso de urgência</b> de tarefas. A tela inicial de cada perfil de acesso não era útil, trouxemos, então, um dashboard com todas as funcionalidades necessárias e <b>acesso rápido</b> a outras funcionalidades do sistema e fluxos de trabalho diários.', note: null },
    { title: 'Central de Notificações', desc: 'Sistema unificado de alertas e notificações contextuais.', note: 'O cliente não possuía funcionalidade de notificações anteriormente. Todas as comunicações eram feitas externamente em outra aplicação.' },
  ],
  EN: [
    { title: 'Login & Authentication', desc: 'We started with the login screen. <em class="rc-hint">Click the button in the top-right corner of the image to see how it looked before.</em> We applied <b>heuristics</b> of <b>error prevention</b>, <b>user control and freedom</b>, <b>system status visibility</b>, and <b>flexibility</b> and efficiency of use — simply by adding <b>base</b> functionalities such as <b>password</b> visibility, <b>error</b> states, <b>colors</b> and <b>hierarchy</b>. We also reinforced the <b>brand</b> with a <b>humanized</b> login screen. The password recovery feature was removed per internal system rules.', note: null },
    { title: 'New Credit Simulator', desc: 'The old simulation screen had <b>confusing terms</b> and a <b>non-linear</b> flow, no ability to <b>edit</b>, and a lack of <b>clarity</b> when relating insurance or parts to the financed vehicle. Users had to flag items <b>unnecessarily</b> to proceed, with excess cards and <b>no deletion</b> or archiving option.<br><br>In the new screen we brought the main client data summary fixed at the top right, <b>consistent naming</b> aligned with user actions, and a friendly calculator layout. We also <b>resolved pain points</b> by adding <b>archiving, full history, system warnings and clear signals</b>.', note: null },
    { title: 'Commercial Kanban', desc: 'Daily operations across multiple profiles are mostly handled via spreadsheets, but some users relied on <b>external platforms</b> to view the operations queue in <b>kanban</b> format. Given this need, we <b>understood</b> that the <b>system would need</b> both views applied at different moments — one for ongoing and one as a general overview. We implemented the kanban, sorting capability, filters in a side panel opening from the top right, and the negotiations list in spreadsheet format.', note: null },
    { title: 'Credit Analysis Dashboard', desc: 'There was a <b>need</b> to visualize <b>team performance</b> and monthly <b>comparisons</b> by upper management, along with dependency on external platforms and a lack of task visibility and <b>sense of urgency</b>. The home screen for each access profile was not useful, so we brought a dashboard with all necessary features and <b>quick access</b> to other system functions and daily workflows.', note: null },
    { title: 'Notifications Center', desc: 'Unified system of alerts and contextual notifications.', note: 'The client had no notification functionality previously. All communications were handled externally in another application.' },
  ],
  ES: [
    { title: 'Login & Autenticación', desc: 'Comenzamos por la pantalla de login. <em class="rc-hint">Haz clic en el botón en la esquina superior derecha de la imagen para ver cómo era antes.</em> Aplicamos <b>heurísticas</b> de <b>prevención de errores</b>, <b>control y libertad del usuario</b>, <b>visibilidad del estado del sistema</b> y <b>flexibilidad</b> y eficiencia de uso — simplemente añadiendo funcionalidades <b>base</b> como visualización de <b>contraseña</b>, estado de <b>error</b>, <b>colores</b> y <b>jerarquía</b>. También reforzamos el <b>brand</b> con una pantalla inicial <b>humanizada</b>. La funcionalidad de recuperación de contraseña fue eliminada por reglas del sistema interno.', note: null },
    { title: 'Nuevo Simulador de Crédito', desc: 'La antigua pantalla de simulación tenía <b>términos confusos</b> y un flujo <b>no lineal</b>, sin posibilidad de <b>editar</b> y con falta de <b>claridad</b> al relacionar seguros o accesorios con el vehículo a financiar. Era necesario marcar elementos <b>innecesariamente</b> para avanzar, con exceso de cards y <b>sin posibilidad de eliminar</b> o archivar.<br><br>En la nueva pantalla trajimos el resumen de los datos principales del cliente fijo en la parte superior derecha, <b>nomenclaturas coherentes</b> con las acciones del usuario, y un visual de calculadora amigable. También <b>resolvimos problemas</b> añadiendo <b>archivado, historial completo, avisos del sistema y señalizaciones claras</b>.', note: null },
    { title: 'Kanban Comercial', desc: 'La operación diaria de varios perfiles se realiza principalmente con hojas de cálculo, pero algunos usuarios utilizaban <b>plataformas externas</b> para visualizar la cola de operaciones en formato <b>kanban</b>. Con esa necesidad, <b>entendimos</b> que el <b>sistema necesitaría</b> las dos visualizaciones en momentos diferentes — una en curso y otra general. Implementamos el kanban, la posibilidad de ordenamiento, filtros en un panel lateral que se abre desde la esquina superior derecha, y la lista de negociaciones en formato de hoja de cálculo.', note: null },
    { title: 'Dashboard de Análisis de Crédito', desc: 'Había una <b>necesidad</b> de visualizar el <b>rendimiento del equipo</b> y <b>comparativos</b> mensuales por parte de las jerarquías superiores, dependencia de plataformas externas y falta de visibilidad y <b>sentido de urgencia</b> de tareas. La pantalla inicial de cada perfil de acceso no era útil, por lo que trajimos un dashboard con todas las funcionalidades necesarias y <b>acceso rápido</b> a otras funciones del sistema y flujos de trabajo diarios.', note: null },
    { title: 'Central de Notificaciones', desc: 'Sistema unificado de alertas y notificaciones contextuales.', note: 'El cliente no contaba con funcionalidad de notificaciones anteriormente. Todas las comunicaciones se realizaban externamente en otra aplicación.' },
  ],
  DE: [
    { title: 'Login & Authentifizierung', desc: 'Wir begannen mit dem Login-Screen. <em class="rc-hint">Klicke auf den Button oben rechts im Bild, um zu sehen, wie es vorher aussah.</em> Wir wendeten <b>Heuristiken</b> zur <b>Fehlervermeidung</b>, <b>Nutzerkontrolle und Freiheit</b>, <b>Sichtbarkeit des Systemstatus</b> und <b>Flexibilität</b> sowie Nutzungseffizienz an — lediglich durch das Hinzufügen von <b>Basisfunktionen</b> wie <b>Passwort</b>-Sichtbarkeit, <b>Fehlerzustände</b>, <b>Farben</b> und <b>Hierarchie</b>. Außerdem stärkten wir die <b>Markenidentität</b> mit einem <b>humanisierten</b> Login-Screen. Die Passwort-Wiederherstellungsfunktion wurde auf Anweisung interner Systemregeln entfernt.', note: null },
    { title: 'Neuer Kreditsimulator', desc: 'Der alte Simulationsscreen hatte <b>verwirrende Begriffe</b> und einen <b>nicht-linearen</b> Ablauf, keine Möglichkeit zur <b>Bearbeitung</b> und mangelnde <b>Klarheit</b> beim Verknüpfen von Versicherungen oder Teilen mit dem zu finanzierenden Fahrzeug. Nutzer mussten Elemente <b>unnötigerweise</b> markieren, um fortzufahren, mit übermäßig vielen Karten und <b>ohne Möglichkeit zum Löschen</b> oder Archivieren.<br><br>Im neuen Screen brachten wir eine feste Zusammenfassung der wichtigsten Kundendaten oben rechts, <b>konsistente Bezeichnungen</b> passend zu den Nutzeraktionen und ein freundliches Rechner-Layout. Außerdem <b>lösten wir Probleme</b> durch <b>Archivierung, vollständiger Verlauf, Systemhinweise und klare Signalisierungen</b>.', note: null },
    { title: 'Kommerzielles Kanban', desc: 'Der tägliche Betrieb verschiedener Profile erfolgt hauptsächlich über Tabellenkalkulationen, einige Nutzer verwendeten jedoch <b>externe Plattformen</b>, um die Vorgangswarteschlange im <b>Kanban</b>-Format anzuzeigen. Angesichts dieses Bedarfs <b>erkannten</b> wir, dass das <b>System beide Ansichten</b> zu unterschiedlichen Zeitpunkten benötigen würde — eine für laufende Vorgänge und eine als Gesamtübersicht. Wir implementierten das Kanban, Sortiermöglichkeiten, Filter in einem Seitenpanel, das von oben rechts öffnet, und die Verhandlungsliste im Tabellenformat.', note: null },
    { title: 'Kreditanalyse-Dashboard', desc: 'Es bestand ein <b>Bedarf</b> an der Visualisierung der <b>Teamleistung</b> und monatlicher <b>Vergleiche</b> seitens der oberen Führungsebene, Abhängigkeit von externen Plattformen und fehlende Aufgabensichtbarkeit sowie <b>Dringlichkeitsgefühl</b>. Der Startbildschirm für jedes Zugriffsprofil war nicht nützlich, daher brachten wir ein Dashboard mit allen notwendigen Funktionen und <b>schnellem Zugriff</b> auf weitere Systemfunktionen und tägliche Workflows.', note: null },
    { title: 'Benachrichtigungszentrale', desc: 'Einheitliches System für Benachrichtigungen und kontextuelle Hinweise.', note: 'Der Kunde hatte zuvor keine Benachrichtigungsfunktion. Alle Kommunikation erfolgte extern über eine andere Anwendung.' },
  ],
}

const designScreens = computed(() => {
  const imgs = [
    { url: 'unica.rodobens.com.br/login',         img: loginImg,      oldImg: loginAntigoImg },
    { url: 'unica.rodobens.com.br/simulador',      img: simulacaoImg,  oldImg: simulacaoAntigaImg },
    { url: 'unica.rodobens.com.br/kanban',         img: kanbanImg,     oldImg: negociacaoAntigaImg },
    { url: 'unica.rodobens.com.br/analise',        img: creditDashImg, oldImg: null },
    { url: 'unica.rodobens.com.br/notificacoes',   img: notifImg,      oldImg: menuAntigoImg },
  ]
  const texts = screensCopy[lang.value] || screensCopy['PT']
  return texts.map((s, i) => ({ ...s, ...imgs[i] }))
})
const palette = [{ name: 'Primary Green', hex: '#0A5331' }, { name: 'Secondary Green', hex: '#05B44C' }, { name: 'Orange CTA', hex: '#FF7C43' }]

const copy = {
  PT: {
    back: 'Voltar ao portfólio', tag: 'UX · Business Design · Systems',
    btnBefore: 'Como era antes', btnAfter: 'Ver versão nova',
    title: 'Descomplicando<br><em>o Legado.</em>',
    subtitle: 'Juntamente com a equipe de negócios, desenvolvimento e design, transformamos um sistema legado de 7 anos, que apresentava <b>travas</b> e <b>fragmentação</b> no uso, em uma <b>plataforma coesa</b>. O <b>desafio</b> consistiu na quantidade de <b>bugs</b> e aplicação de regras de negócio e regras de acesso por perfis. Usuários relataram as seguintes <b>dores</b>: <b>travamentos</b>, <b>telas inúteis</b>, <b>quedas frequentes de sistema</b>, <b>falta de automação</b> e <b>dependência forçada</b> de ferramentas <b>externas</b>. Restauramos a <b>eficiência operacional</b> transformando soluções improvisadas em <b>fluxos únicos</b> e <b>integrados</b>.',
    accentLine: 'Mapeamento de 129 perfis de acesso e tradução de regras de negócio complexas em jornadas de usuário escaláveis',
    context: 'Equipe transformou um sistema legado de 7 anos — fragmentado e travando — em uma plataforma coesa. O desafio não era a idade do sistema: eram os problemas diários. Travamentos, falta de automação e dependência forçada de ferramentas externas. Restauramos a eficiência operacional transformando soluções improvisadas em fluxos integrados.',
    roles: ['UX Design', 'Business Design', 'Research', 'Facilitação', 'Handoff'],
    stats: { profiles: 'perfis mapeados', users: 'usuários ativos', months: 'meses de projeto', legacy: 'anos de legado' },
    complaintsLabel: 'Principais queixas dos usuários',
    complaints: ['Lentidão extrema e crashes constantes do sistema', 'Falta de automação em diversos processos críticos', 'Mensagens de erro confusas e feedback limitado ou inexistente', 'Tela inicial irrelevante e lenta — não era utilizada no dia a dia', 'Dificuldade e ineficiência no upload de documentos', 'Ausência de relatórios em tempo real — dependência de planilhas e apps externos'],
    overviewLabel: 'Sobre o Projeto',
    overviewBody: 'O projeto consistiu na <b>modernização do sistema</b> interno do Grupo Rodobens, líder brasileiro com 75 anos de história no setor financeiro e varejo automotivo. O ecossistema abrange desde financiamentos convencionais (CDC) até modelos complexos como o Plano Pontual e Finame. Juntamente com o time de produtos da NV8, minha atuação foi focada na <b>modernização das telas</b> a partir do <b>redesenho do fluxo de usuário</b> com base nas <b>regras de negócio</b>, <b>entrevistas com usuários</b> e <b>intermediação das expectativas dos stakeholders</b>, mediando trade-offs em relação à <b>complexidade do negócio</b> vs <b>tempo total do projeto</b>.',
    deliverables: ['Discovery & Research', 'Mapeamento AS IS × TO BE', 'Arquitetura de Informação', 'Protopersonas', 'User Flow Design', 'Wireframes & UI Design'],
    triads: [
      { title: 'O Conflito', body: 'Falta de documentação das regras de negócio causaram lentidão na fase de discovery e retrabalhos na operação de telas e mapeamento de fluxos.' },
      { title: 'A Decisão', body: 'Discovery Ágil utilizando a técnica de Shadowing para mapear microprocessos e diminuir a lacuna entre o que o usuário diz que quer e o que realmente precisa, através de entrevistas online com usuários-chave. Criação de Userflows detalhados que serviram como documentação técnica tanto para Design quanto para Engenharia.' },
      { title: 'Trade-off', body: 'Foi necessário sacrificar o research exploratório amplo em favor de sprints de discovery direcionados às dores mais críticas do dia a dia operacional, priorizando às soluções críticas dentro do tempo total de projeto.' },
    ],
    designLabel: 'Solução de Design',
    designIntro: 'Durante o discovery e mapeamento dos perfis de acesso, optamos pela utilização da library <b>Nuxt UI v.3</b> adaptada para o cliente visando a redução do tempo em produção e iteração de componentes. O uso de uma lib no projeto também facilita a escalabilidade de projetos internos. O sistema atual do cliente foi construído em base de remendos, então o layout não seguia padronizações, hierarquias e exigia muitas voltas para realizar tarefas simples.',
    principlesLabel: 'Melhorias percebidas',
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
    footerTag: 'Rodobens Unica Platform · 2026',
  },
  EN: {
    back: 'Back to portfolio', tag: 'UX · Business Design · Systems',
    btnBefore: 'How it was before', btnAfter: 'See new version',
    title: 'Untangling<br><em>the Legacy.</em>',
    subtitle: 'Together with the business, development, and design team, we transformed a 7-year-old legacy system, plagued by <b>bottlenecks</b> and <b>fragmentation</b>, into a <b>cohesive platform</b>. The <b>challenge</b> lay in the volume of <b>bugs</b> and the application of business rules and access rules by profile. Users reported the following <b>pain points</b>: <b>crashes</b>, <b>useless screens</b>, <b>frequent system outages</b>, <b>lack of automation</b>, and <b>forced dependency</b> on <b>external</b> tools. We restored <b>operational efficiency</b> by transforming improvised workarounds into <b>single, integrated</b> flows.',
    accentLine: 'Mapping 129 access profiles and translating complex business rules into scalable user journeys',
    context: "The team transformed a 7-year-old fragmented legacy system into a cohesive platform. The challenge wasn't the system's age — it was the daily problems: crashes, lack of automation, and forced dependency on external tools.",
    roles: ['UX Design', 'Business Design', 'Research', 'Facilitation', 'Handoff'],
    stats: { profiles: 'profiles mapped', users: 'active users', months: 'months of project', legacy: 'years of legacy' },
    complaintsLabel: 'Main user complaints',
    complaints: ['Extreme slowness and constant system crashes', 'Lack of automation in several critical processes', 'Confusing error messages and limited or no feedback', 'Irrelevant and slow home screen — not used in day-to-day work', 'Difficulty and inefficiency in document uploads', 'No real-time reports — dependency on spreadsheets and external apps'],
    overviewLabel: 'About the Project',
    overviewBody: 'The project consisted of <b>modernizing the internal system</b> of Rodobens Group, a Brazilian leader with 75 years of history in the financial and automotive retail sector. The ecosystem spans from conventional financing (CDC) to complex models such as Plano Pontual and Finame. Together with the NV8 product team, my role was focused on <b>modernizing the screens</b> through the <b>redesign of user flows</b> based on <b>business rules</b>, <b>user interviews</b>, and <b>stakeholder expectation management</b>, mediating trade-offs between <b>business complexity</b> vs <b>total project timeline</b>.',
    deliverables: ['Discovery & Research', 'AS IS × TO BE Mapping', 'Information Architecture', 'Proto-Personas', 'User Flow Design', 'Wireframes & UI Design'],
    triads: [
      { title: 'The Conflict', body: 'Lack of business rule documentation slowed down the discovery phase and caused rework in screen operations and flow mapping.' },
      { title: 'The Decision', body: 'Agile Discovery using the Shadowing technique to map microprocesses and narrow the gap between what users say they want and what they actually need, through online interviews with key users. Creation of detailed Userflows that served as technical documentation for both Design and Engineering.' },
      { title: 'Trade-off', body: 'Broad exploratory research had to be sacrificed in favor of targeted discovery sprints focused on the most critical day-to-day operational pain points, prioritizing critical solutions within the total project timeline.' },
    ],
    designLabel: 'Design Solution', designIntro: 'During the discovery and access profile mapping, we chose to use the <b>Nuxt UI v.3</b> library adapted for the client to reduce production time and component iteration. Using a library also facilitates scalability for internal projects. The client\'s current system was built on patches, so the layout lacked standardization and hierarchy and required many steps to complete simple tasks.',
    principlesLabel: 'Perceived Improvements',
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
    footerTag: 'Rodobens Unica Platform · 2026',
  },
  ES: {
    back: 'Volver al portafolio', tag: 'UX · Business Design · Systems',
    btnBefore: 'Cómo era antes', btnAfter: 'Ver versión nueva',
    title: 'Desenredando<br><em>el Legado.</em>',
    subtitle: 'Junto con el equipo de negocio, desarrollo y diseño, transformamos un sistema legado de 7 años, que presentaba <b>bloqueos</b> y <b>fragmentación</b>, en una <b>plataforma cohesiva</b>. El <b>desafío</b> consistió en la cantidad de <b>bugs</b> y la aplicación de reglas de negocio y reglas de acceso por perfiles. Los usuarios reportaron los siguientes <b>problemas</b>: <b>bloqueos</b>, <b>pantallas inútiles</b>, <b>caídas frecuentes del sistema</b>, <b>falta de automatización</b> y <b>dependencia forzada</b> de herramientas <b>externas</b>. Restauramos la <b>eficiencia operacional</b> transformando soluciones improvisadas en <b>flujos únicos</b> e <b>integrados</b>.',
    accentLine: 'Mapeo de 129 perfiles de acceso y traducción de reglas de negocio complejas en journeys de usuario escalables',
    context: 'El equipo transformó un sistema legado de 7 años — fragmentado y con bloqueos — en una plataforma cohesiva.',
    roles: ['UX Design', 'Business Design', 'Research', 'Facilitación', 'Handoff'],
    stats: { profiles: 'perfiles mapeados', users: 'usuarios activos', months: 'meses de proyecto', legacy: 'años de legado' },
    complaintsLabel: 'Principales quejas de los usuarios',
    complaints: ['Lentitud extrema y caídas constantes del sistema', 'Falta de automatización en varios procesos críticos', 'Mensajes de error confusos y feedback limitado o inexistente', 'Pantalla de inicio irrelevante y lenta — no se usaba en el día a día', 'Dificultad e ineficiencia en la carga de documentos', 'Sin informes en tiempo real — dependencia de hojas de cálculo y apps externas'],
    overviewLabel: 'Sobre el Proyecto',
    overviewBody: 'El proyecto consistió en la <b>modernización del sistema</b> interno del Grupo Rodobens, líder brasileño con 75 años de historia en el sector financiero y retail automotriz. El ecosistema abarca desde financiamientos convencionales (CDC) hasta modelos complejos como el Plano Pontual y Finame. Junto al equipo de producto de NV8, mi rol se centró en la <b>modernización de las pantallas</b> a partir del <b>rediseño del flujo de usuario</b> con base en las <b>reglas de negocio</b>, <b>entrevistas con usuarios</b> y <b>gestión de expectativas de stakeholders</b>, mediando trade-offs entre <b>complejidad del negocio</b> vs <b>tiempo total del proyecto</b>.',
    deliverables: ['Discovery & Research', 'Mapeo AS IS × TO BE', 'Arquitectura de Información', 'Proto-Personas', 'User Flow Design', 'Wireframes & UI Design'],
    triads: [
      { title: 'El Conflicto', body: 'La falta de documentación de las reglas de negocio generó lentitud en la fase de discovery y retrabajo en la operación de pantallas y mapeo de flujos.' },
      { title: 'La Decisión', body: 'Discovery Ágil utilizando la técnica de Shadowing para mapear microprocesos y reducir la brecha entre lo que el usuario dice que quiere y lo que realmente necesita, a través de entrevistas online con usuarios clave. Creación de Userflows detallados que funcionaron como documentación técnica tanto para Diseño como para Ingeniería.' },
      { title: 'Trade-off', body: 'Fue necesario sacrificar la investigación exploratoria amplia en favor de sprints de discovery dirigidos a los problemas más críticos del día a día operacional, priorizando las soluciones críticas dentro del tiempo total de proyecto.' },
    ],
    designLabel: 'Solución de Diseño',
    designIntro: 'Durante el discovery y mapeo de perfiles de acceso, optamos por utilizar la librería <b>Nuxt UI v.3</b> adaptada para el cliente, con el objetivo de reducir el tiempo de producción e iteración de componentes. El uso de una lib en el proyecto también facilita la escalabilidad de proyectos internos. El sistema actual del cliente fue construido a base de remiendos, por lo que el layout no seguía estandarizaciones ni jerarquías, y requería muchos pasos para realizar tareas simples.',
    principlesLabel: 'Mejoras percibidas',
    dsBannerTitle: 'De HTML legacy a Design System moderno: evolución guiada por datos de usuario',
    dsBannerSub: 'Usamos Nuxt UI v3 como base, personalizando componentes estratégicamente para satisfacer las necesidades específicas del sector financiero y los 603 usuarios de la plataforma.',
    principles: [
      { title: 'Reducción de Carga Cognitiva', body: 'De sobrecarga informacional a jerarquía clara y respirable', color: '#F0185A' },
      { title: 'Escaneabilidad Aumentada', body: 'Los usuarios identifican prioridades en 3 segundos vs. 30+ segundos antes', color: '#0CFDB5' },
      { title: 'Reducción de Fatiga Visual', body: 'Tablas con ~20 filas vs. ~50 comprimidas, mejorando la precisión de lectura', color: '#FF7C43' },
      { title: 'Formularios Progresivos', body: 'División de ~50 campos en 4–5 pasos lógicos, reduciendo la tasa de abandono', color: '#F0185A' },
      { title: 'Toma de Decisiones Acelerada', body: 'Los analistas identifican red flags en segundos vía badges y colores semánticos', color: '#0CFDB5' },
      { title: 'Confianza Financiera', body: 'Cálculos visibles en tiempo real con desglose de valores aumentan la transparencia', color: '#FF7C43' },
    ],
    decisionTitle: 'Decisión Estratégica: Librería vs. Custom', decisionSub: '¿Por qué elegimos Nuxt UI v3 como base?',
    decisionBenefitsTitle: 'Beneficios de la Librería',
    decisionBenefits: [
      { label: 'Velocidad:', body: 'Componentes base listos redujeron un 40% el tiempo de implementación' },
      { label: 'Personalización controlada:', body: 'El sistema de tokens permitió adaptar la identidad Rodobens manteniendo consistencia' },
      { label: 'Accesibilidad nativa:', body: 'WCAG 2.1 AA out-of-the-box (crítico para sistemas financieros)' },
      { label: 'Responsividad intrínseca:', body: 'Funcionamiento garantizado en todos los dispositivos' },
    ],
    decisionCustomTitle: 'Qué Personalizamos',
    decisionCustom: [
      { color: '#0A5331', label: 'Paleta:', body: 'Adaptación de los greens Rodobens (#0A5331, #05B44C) + orange CTA (#FF7C43)' },
      { color: '#05B44C', label: 'Componentes financieros:', body: 'Simulador de crédito, cards de análisis, status badges' },
      { color: '#FF7C43', label: 'Densidad de información:', body: 'Ajustes de spacing para contexto B2B' },
      { color: '#111827', label: 'Validaciones contextuales:', body: 'Reglas de negocio específicas del sector financiero' },
    ],
    decisionQuote: 'La elección de Nuxt UI v3 no fue sobre ahorrar tiempo — fue sobre invertir el tiempo correcto en lo que realmente importaba: entender los 129 permisos de acceso, traducir reglas de negocio complejas en interfaces intuitivas, y garantizar que cada componente reflejara las necesidades reales de los 603 usuarios.',
    compsTitle: 'Componentes Clave del Sistema',
    badge1: 'Aprobado', badge2: 'Pendiente', badge3: 'Vencido', badge4: 'En Revisión',
    tableFeatures: ['Ordenamiento multi-columna', 'Filtros intuitivos', 'Paginación optimizada', 'Acciones contextuales por fila'],
    tableNote: 'Densidad ajustada para datos financieros', formNote: 'Máscaras para IDs fiscales y valores monetarios',
    paletteTitle: 'Paleta de Colores', typographyTitle: 'Tipografía', componentsTitle: 'Componentes',
    delivLabel: 'Entregables & Resultados', delivHeading: 'Qué fue entregado',
    delivList: ['Discovery completo con mapeo de 129 perfiles', 'User flows documentados (AS IS × TO BE)', 'Wireframes de todas las pantallas principales', 'Pantallas finales navegables (más allá del contrato inicial de wireframes)', 'Reglas de negocio documentadas', 'Sistema escalable con posibilidad de agregar nuevas funcionalidades'],
    delivQuote: 'Entregamos pantallas navegables en versión final, más allá del contrato de wireframes, junto con toda la documentación de reglas de negocio, flujos validados y un sistema escalable, integrado y con usabilidad mejorada.',
    impactHeading: 'Impacto del Proyecto',
    metrics: [{ num: '129', label: 'perfiles de acceso mapeados' }, { num: '603', label: 'usuarios contemplados' }, { num: '6', label: 'meses de migración' }, { num: '7', label: 'años de sistema legado modernizado' }, { num: '100%', label: 'de las reglas de negocio documentadas' }],
    reflexLabel: 'Reflexiones & Aprendizajes', teamHeading: 'Equipo',
    team: [{ role: 'UX Designer Semi-Senior', name: 'Tayná' }, { role: 'Designer Junior', name: 'Colaborador' }, { role: 'Líder de Diseño', name: 'Mentor' }, { role: 'Business Analyst', name: 'Equipo de Negocio' }, { role: 'Desarrollador', name: 'Equipo de Desarrollo' }],
    reflexoes: [
      { question: '¿Cuál fue el conflicto real que resolviste?', answer: 'En negocios: transformar un sistema legado sin documentación en una plataforma moderna y escalable, garantizando que ninguna regla de negocio se perdiera. En personas: gestión de expectativas de stakeholders ansiosos por resultados.' },
      { question: '¿A qué renunciaste para resolverlo?', answer: 'Sacrifiqué la investigación exploratoria de largo plazo y los informes extensos, priorizando shadowing intensivo, entrevistas dirigidas y documentación viva a través de user flows — herramientas que servían simultáneamente al equipo de diseño e ingeniería.' },
      { question: 'Madurez demostrada', answer: 'Alineación entre las expectativas de la dirección y la realidad de los 603 usuarios • Documentación viva que gestionó integraciones complejas (B3, Autbank) • Actuación como nexo entre las necesidades del cliente y la viabilidad del producto.' },
    ],
    footerTag: 'Rodobens Unica Platform · 2026',
  },
  DE: {
    back: 'Zurück zum Portfolio', tag: 'UX · Business Design · Systems',
    btnBefore: 'So war es vorher', btnAfter: 'Neue Version ansehen',
    title: 'Das Erbe<br><em>entwirren.</em>',
    subtitle: 'Gemeinsam mit dem Business-, Entwicklungs- und Designteam haben wir ein 7 Jahre altes Legacy-System, das durch <b>Blockaden</b> und <b>Fragmentierung</b> geprägt war, in eine <b>kohärente Plattform</b> verwandelt. Die <b>Herausforderung</b> lag in der Menge an <b>Bugs</b> sowie der Anwendung von Geschäfts- und Zugriffsregeln nach Profilen. Nutzer berichteten von folgenden <b>Problemen</b>: <b>Abstürze</b>, <b>nutzlose Screens</b>, <b>häufige Systemausfälle</b>, <b>fehlende Automatisierung</b> und <b>erzwungene Abhängigkeit</b> von <b>externen</b> Tools. Wir stellten die <b>betriebliche Effizienz</b> wieder her, indem wir improvisierte Workarounds in <b>einheitliche, integrierte</b> Flows umwandelten.',
    accentLine: 'Kartierung von 129 Zugriffsprofilen und Übersetzung komplexer Geschäftsregeln in skalierbare User Journeys',
    context: 'Das Team verwandelte ein 7 Jahre altes, fragmentiertes Legacy-System in eine kohärente Plattform.',
    roles: ['UX Design', 'Business Design', 'Research', 'Facilitation', 'Handoff'],
    stats: { profiles: 'kartierte Profile', users: 'aktive Nutzer', months: 'Projektmonate', legacy: 'Jahre Legacy' },
    complaintsLabel: 'Hauptbeschwerden der Nutzer',
    complaints: ['Extreme Langsamkeit und ständige Systemabstürze', 'Fehlende Automatisierung in mehreren kritischen Prozessen', 'Verwirrende Fehlermeldungen und begrenztes oder kein Feedback', 'Irrelevanter und langsamer Startbildschirm — im Alltag nicht genutzt', 'Schwierigkeiten und Ineffizienz beim Hochladen von Dokumenten', 'Keine Echtzeit-Berichte — Abhängigkeit von Tabellenkalkulationen und externen Apps'],
    overviewLabel: 'Über das Projekt',
    overviewBody: 'Das Projekt bestand in der <b>Modernisierung des internen Systems</b> der Rodobens Group, einem brasilianischen Marktführer mit 75-jähriger Geschichte im Finanz- und Automobileinzelhandel. Das Ökosystem umfasst konventionelle Finanzierungen (CDC) bis hin zu komplexen Modellen wie Plano Pontual und Finame. Gemeinsam mit dem NV8-Produktteam konzentrierte sich meine Arbeit auf die <b>Modernisierung der Oberflächen</b> durch das <b>Redesign der User Flows</b> basierend auf <b>Geschäftsregeln</b>, <b>Nutzerinterviews</b> und <b>Stakeholder-Erwartungsmanagement</b>, mit Abwägung von Trade-offs zwischen <b>Geschäftskomplexität</b> vs. <b>Gesamtprojektlaufzeit</b>.',
    deliverables: ['Discovery & Research', 'AS IS × TO BE Kartierung', 'Informationsarchitektur', 'Proto-Personas', 'User Flow Design', 'Wireframes & UI Design'],
    triads: [
      { title: 'Der Konflikt', body: 'Fehlende Dokumentation der Geschäftsregeln verlangsamte die Discovery-Phase und verursachte Nacharbeiten bei der Bildschirmgestaltung und der Flow-Kartierung.' },
      { title: 'Die Entscheidung', body: 'Agile Discovery mit der Shadowing-Technik zur Kartierung von Mikroprozessen und zur Verringerung der Lücke zwischen dem, was Nutzer sagen zu wollen, und dem, was sie wirklich brauchen — durch Online-Interviews mit Schlüsselnutzern. Erstellung detaillierter Userflows, die als technische Dokumentation für Design und Engineering dienten.' },
      { title: 'Trade-off', body: 'Breit angelegte explorative Forschung musste zugunsten gezielter Discovery-Sprints geopfert werden, die sich auf die kritischsten operativen Alltagsprobleme konzentrierten und kritische Lösungen innerhalb der Gesamtprojektlaufzeit priorisierten.' },
    ],
    designLabel: 'Design-Lösung',
    designIntro: 'Während der Discovery und der Kartierung der Zugriffsprofile entschieden wir uns für den Einsatz der <b>Nuxt UI v.3</b>-Bibliothek, angepasst für den Kunden, um die Produktionszeit und Komponenteniteration zu reduzieren. Der Einsatz einer Bibliothek erleichtert zudem die Skalierbarkeit interner Projekte. Das bestehende System des Kunden war auf Flickwerk aufgebaut — das Layout folgte keinen Standards oder Hierarchien und erforderte viele Schritte für einfache Aufgaben.',
    principlesLabel: 'Wahrgenommene Verbesserungen',
    dsBannerTitle: 'Von Legacy-HTML zum modernen Design System: Entwicklung durch Nutzerdaten',
    dsBannerSub: 'Wir nutzten Nuxt UI v3 als Grundlage und passten Komponenten strategisch an die spezifischen Anforderungen des Finanzsektors und der 603 Plattformnutzer an.',
    principles: [
      { title: 'Reduzierung der kognitiven Last', body: 'Von Informationsüberlastung zu klarer, atmender Hierarchie', color: '#F0185A' },
      { title: 'Erhöhte Scannbarkeit', body: 'Nutzer identifizieren Prioritäten in 3 Sekunden vs. zuvor 30+ Sekunden', color: '#0CFDB5' },
      { title: 'Reduzierung der visuellen Ermüdung', body: 'Tabellen mit ~20 Zeilen vs. ~50 komprimierte, verbesserte Lesegenauigkeit', color: '#FF7C43' },
      { title: 'Progressive Formulare', body: 'Aufteilung von ~50 Feldern in 4–5 logische Schritte, Senkung der Abbruchrate', color: '#F0185A' },
      { title: 'Beschleunigte Entscheidungsfindung', body: 'Analysten erkennen Red Flags in Sekunden via Badges und semantische Farben', color: '#0CFDB5' },
      { title: 'Finanzielles Vertrauen', body: 'Echtzeit-Berechnungen mit Aufschlüsselung der Werte erhöhen die Transparenz', color: '#FF7C43' },
    ],
    decisionTitle: 'Strategische Entscheidung: Bibliothek vs. Custom', decisionSub: 'Warum wir Nuxt UI v3 als Grundlage gewählt haben:',
    decisionBenefitsTitle: 'Vorteile der Bibliothek',
    decisionBenefits: [
      { label: 'Geschwindigkeit:', body: 'Fertige Basiskomponenten reduzierten die Implementierungszeit um 40%' },
      { label: 'Kontrollierte Anpassung:', body: 'Das Token-System ermöglichte die Adaption an die Rodobens-Identität bei gleichbleibender Konsistenz' },
      { label: 'Native Barrierefreiheit:', body: 'WCAG 2.1 AA out-of-the-box (kritisch für Finanzsysteme)' },
      { label: 'Intrinsive Responsivität:', body: 'Garantiertes geräteübergreifendes Funktionieren' },
    ],
    decisionCustomTitle: 'Was wir angepasst haben',
    decisionCustom: [
      { color: '#0A5331', label: 'Farbpalette:', body: 'Adaption der Rodobens-Grüntöne (#0A5331, #05B44C) + Orange CTA (#FF7C43)' },
      { color: '#05B44C', label: 'Finanzkomponenten:', body: 'Kreditsimulator, Analysekarten, Status-Badges' },
      { color: '#FF7C43', label: 'Informationsdichte:', body: 'Spacing-Anpassungen für B2B-Kontext' },
      { color: '#111827', label: 'Kontextuelle Validierungen:', body: 'Branchenspezifische Geschäftsregeln des Finanzsektors' },
    ],
    decisionQuote: 'Die Wahl von Nuxt UI v3 war keine Frage der Zeitersparnis — es ging darum, die richtige Zeit in das zu investieren, was wirklich zählte: die 129 Zugriffsberechtigungen zu verstehen, komplexe Geschäftsregeln in intuitive Interfaces zu übersetzen und sicherzustellen, dass jede Komponente die echten Bedürfnisse der 603 Nutzer widerspiegelt.',
    compsTitle: 'Schlüsselkomponenten des Systems',
    badge1: 'Genehmigt', badge2: 'Ausstehend', badge3: 'Überfällig', badge4: 'In Prüfung',
    tableFeatures: ['Mehrspaltiges Sortieren', 'Intuitive Filter', 'Optimierte Paginierung', 'Kontextuelle Zeilenaktionen'],
    tableNote: 'Dichte für Finanzdaten angepasst', formNote: 'Masken für Steuer-IDs und Geldbeträge',
    paletteTitle: 'Farbpalette', typographyTitle: 'Typografie', componentsTitle: 'Komponenten',
    delivLabel: 'Lieferergebnisse & Resultate', delivHeading: 'Was geliefert wurde',
    delivList: ['Vollständige Discovery mit Kartierung von 129 Profilen', 'Dokumentierte User Flows (AS IS × TO BE)', 'Wireframes aller Hauptbildschirme', 'Finale navigierbare Screens (über den ursprünglichen Wireframe-Vertrag hinaus)', 'Dokumentierte Geschäftsregeln', 'Skalierbares System mit der Möglichkeit, neue Features hinzuzufügen'],
    delivQuote: 'Wir lieferten finale navigierbare Screens — über den Wireframe-Vertrag hinaus — sowie die vollständige Dokumentation der Geschäftsregeln, validierte Flows und ein skalierbares, integriertes System mit verbesserter Usability.',
    impactHeading: 'Projektauswirkungen',
    metrics: [{ num: '129', label: 'kartierte Zugriffsprofile' }, { num: '603', label: 'betroffene Nutzer' }, { num: '6', label: 'Migrationsmonate' }, { num: '7', label: 'Jahre modernisiertes Legacy-System' }, { num: '100%', label: 'der dokumentierten Geschäftsregeln' }],
    reflexLabel: 'Reflexionen & Erkenntnisse', teamHeading: 'Team',
    team: [{ role: 'UX Designer (Mid)', name: 'Tayná' }, { role: 'Junior Designer', name: 'Mitarbeiter' }, { role: 'Design Lead', name: 'Mentor' }, { role: 'Business Analyst', name: 'Business-Team' }, { role: 'Entwickler', name: 'Entwicklungsteam' }],
    reflexoes: [
      { question: 'Was war der eigentliche Konflikt, den du gelöst hast?', answer: 'Im Business: ein Legacy-System ohne Dokumentation in eine moderne, skalierbare Plattform zu verwandeln und sicherzustellen, dass keine Geschäftsregel verloren geht. Bei Menschen: das Erwartungsmanagement von Stakeholdern, die ungeduldig auf Ergebnisse warteten.' },
      { question: 'Worauf hast du verzichtet, um es zu lösen?', answer: 'Ich verzichtete auf langfristige explorative Forschung und umfangreiche Berichte und priorisierte stattdessen intensives Shadowing, gezielte Interviews und lebende Dokumentation durch User Flows — Werkzeuge, die gleichzeitig dem Design- und Engineering-Team dienten.' },
      { question: 'Gezeigte Reife', answer: 'Abstimmung zwischen den Erwartungen der Geschäftsführung und der Realität der 603 Nutzer • Lebende Dokumentation, die komplexe Integrationen (B3, Autbank) verwaltete • Funktion als Bindeglied zwischen Kundenbedürfnissen und Produktmachbarkeit.' },
    ],
    footerTag: 'Rodobens Unica Platform · 2026',
  },
}
const t = computed(() => copy[lang.value] || copy['PT'])
</script>

<style>
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500;0,9..40,700;0,9..40,800&display=swap');
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
.rc-subtitle b{font-weight:800;color:var(--fg,#F0EFF8);font-style:normal}
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
.rc-section-intro b{font-weight:800;color:var(--fg,#F0EFF8)}
.rc-hint{font-style:italic;color:#F0185A;font-weight:400}
.rc-sub-heading{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1.1rem,3vw,1.5rem);letter-spacing:-.015em;color:var(--fg,#F0EFF8);margin-bottom:1.25rem}
.rc-complaints-grid{display:grid;grid-template-columns:1fr;gap:.6rem}
.rc-complaint{display:flex;align-items:flex-start;gap:.8rem;border:1px solid rgba(255,255,255,.06);padding:.9rem 1rem;opacity:0;transform:translateY(14px);transition:opacity .5s ease calc(var(--ci,0)*.08s),transform .5s cubic-bezier(.16,1,.3,1) calc(var(--ci,0)*.08s),border-color .2s}
.rc-complaint--vis{opacity:1;transform:translateY(0)}
.rc-complaint:hover{border-color:rgba(240,24,90,.25)}
.rc-cicon{display:flex;align-items:center;justify-content:center;flex-shrink:0;color:#F0185A;opacity:.75;margin-top:.2rem}
.rc-ctxt{font-size:clamp(1.125rem,2vw,1.25rem);font-weight:300;line-height:1.7;color:var(--fg-muted,#6B6A82)}
.rc-overview-row{display:flex;flex-direction:column;gap:1.25rem;margin-bottom:2rem}
.rc-overview-body{font-size:clamp(1.125rem,2vw,1.3rem);font-weight:300;line-height:1.9;color:var(--fg-muted,#6B6A82);max-width:65ch}
.rc-overview-body b{font-weight:800;color:var(--fg,#F0EFF8);font-style:normal}
.rc-deliverables{display:grid;grid-template-columns:repeat(2,1fr);gap:.5rem}
.rc-del{display:flex;align-items:center;gap:.75rem;font-size:.75rem;font-weight:500;letter-spacing:.08em;text-transform:uppercase;color:var(--fg,#F0EFF8);background:rgba(240,24,90,.06);border:1px solid rgba(240,24,90,.18);padding:.85rem 1rem;transition:background .2s,border-color .2s}
.rc-del:hover{background:rgba(240,24,90,.12);border-color:rgba(240,24,90,.35)}
.rc-del-dot{width:6px;height:6px;border-radius:50%;background:#F0185A;flex-shrink:0}
.rc-triads{display:grid;grid-template-columns:1fr;gap:1.25rem;background:none}
.rc-triad{
  padding:1.75rem 1.5rem 2rem;
  background:#F0185A;
  position:relative;
  transition:transform .2s ease,box-shadow .2s ease;
  box-shadow:3px 4px 0 rgba(0,0,0,.18);
  border-radius:2px;
}
.rc-triad::after{
  content:'';
  position:absolute;
  top:0;right:0;
  width:0;height:0;
  border-style:solid;
  border-width:0 18px 18px 0;
  border-color:transparent rgba(0,0,0,.18) transparent transparent;
}
.rc-triad:hover{transform:translateY(-3px) rotate(.4deg);box-shadow:5px 7px 0 rgba(0,0,0,.22)}
.rc-triad-t{font-family:'Clash Display',sans-serif;font-weight:700;font-size:clamp(.7rem,1.5vw,.85rem);letter-spacing:.12em;text-transform:uppercase;color:rgba(255,255,255,.7);margin-bottom:.75rem}
.rc-triad-b{font-size:clamp(.9rem,1.8vw,1rem);font-weight:400;line-height:1.75;color:#fff}
.rc-screens-list{display:flex;flex-direction:column;gap:5rem;margin-bottom:3rem}
.rc-design-screen{display:flex;flex-direction:column;gap:1.75rem}
.rc-ds-header{display:flex;flex-direction:column;justify-content:center;gap:.75rem}
.rc-ds-img-col{flex:1}
.rc-ds-title{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1.1rem,3vw,1.45rem);letter-spacing:-.015em;color:var(--fg,#F0EFF8);margin-bottom:.3rem}
.rc-ds-desc{font-size:clamp(1.125rem,2vw,1.25rem);font-weight:300;color:var(--fg-muted,#6B6A82);line-height:1.6;max-width:60ch}
.rc-ds-desc b{font-weight:800;color:var(--fg,#F0EFF8)}
.rc-ds-note{font-size:1.125rem;font-style:italic;color:var(--fg-muted,#6B6A82);margin-top:.65rem;border-left:2px solid rgba(240,24,90,.3);padding-left:.75rem}
.rc-ds-banner{background:#F0185A;border-radius:8px;padding:1.75rem 1.5rem;margin-bottom:2.5rem}
.rc-ds-banner-title{font-family:'Clash Display',sans-serif;font-weight:700;font-size:clamp(1.05rem,3vw,1.5rem);color:#fff;line-height:1.2;margin-bottom:.6rem}
.rc-ds-banner-sub{font-size:clamp(1.125rem,2vw,1.25rem);color:rgba(255,255,255,.85);font-weight:300;line-height:1.75}
.rc-rule--principles{margin-top:2.5rem}
.rc-principles{display:grid;grid-template-columns:1fr;gap:.75rem;margin-bottom:2.5rem}
.rc-principle{display:flex;align-items:flex-start;gap:1.25rem;border:1px solid rgba(255,255,255,.06);border-left:3px solid var(--acc,#F0185A);padding:1.25rem 1.25rem;transition:border-color .2s,background .2s}
.rc-principle:hover{border-color:var(--acc,#F0185A);background:rgba(255,255,255,.02)}
.rc-pr-icon{flex-shrink:0;opacity:.85;margin-top:.1rem}
.rc-pr-title{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1rem,2vw,1.15rem);color:var(--fg,#F0EFF8);margin-bottom:.4rem}
.rc-pr-body{font-size:clamp(1rem,1.8vw,1.1rem);font-weight:300;color:var(--fg-muted,#6B6A82);line-height:1.7}
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
.rc-root{--teal:#0CFDB5;--fg-muted:#A8A6C0}
.theme-light.rc-root{--teal:#007A52;--fg-muted:#5C5A72}
.rc-teal{color:var(--teal)}

/* ── Before/After toggle ── */
.rc-img-wrap{position:relative;overflow:hidden}
.rc-before-btn{
  position:absolute;top:.85rem;right:.85rem;
  display:inline-flex;align-items:center;gap:.5rem;
  font-family:'DM Sans',sans-serif;font-size:.6rem;font-weight:600;
  letter-spacing:.12em;text-transform:uppercase;
  background:#F0185A;color:#fff;
  border:1px solid #F0185A;
  padding:.45rem .9rem;border-radius:0;
  cursor:pointer;
  transition:background .2s,border-color .2s,color .2s;
  z-index:10;
}
.rc-before-btn:hover{background:#d4154f;border-color:#d4154f}
.rc-before-btn--active{background:transparent;color:#F0185A;border-color:rgba(240,24,90,.5)}
.rc-before-btn--active:hover{background:rgba(240,24,90,.08);border-color:#F0185A}
.rc-before-icon{font-size:.8rem;line-height:1}

/* ── Flip transition ── */
.rc-flip-enter-active,.rc-flip-leave-active{transition:opacity .25s ease,transform .25s ease}
.rc-flip-enter-from{opacity:0;transform:scale(.98)}
.rc-flip-leave-to{opacity:0;transform:scale(1.01)}

@media(min-width:1024px){
  .rc-design-screen{flex-direction:row;align-items:flex-start;gap:3.5rem}
  .rc-ds-header{flex:0 0 38%;max-width:38%}
  .rc-ds-img-col{flex:1;min-width:0}
  /* Alternate: odd cards image left, even cards text left */
  .rc-design-screen:nth-child(even){flex-direction:row-reverse}
}
</style>
