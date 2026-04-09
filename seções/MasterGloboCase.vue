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
          <span>UX Research · Concept Validation · 2025</span>
        </div>
        <h1 class="mg-title">Master<br><em>Globo.</em></h1>
        <div class="mg-rule" aria-hidden="true"></div>
        <div class="mg-hero-meta">
          <p class="mg-hero-desc">
            Como uma pesquisa mixed-methods com IA redefiniu a estratégia de apresentadores de cursos online — e ainda entregou insights que o cliente não esperava receber.
          </p>
          <div class="mg-tags">
            <span class="mg-tag">UX Research</span>
            <span class="mg-tag">Concept Validation</span>
            <span class="mg-tag">Mixed Methods</span>
            <span class="mg-tag">AI-Assisted Analysis</span>
            <span class="mg-tag">1 mês</span>
          </div>
        </div>
      </div>

      <!-- Cover image -->
      <div class="mg-cover-wrap mg-wrap">
        <img :src="coverImg" alt="Master Globo — avatares do curso" class="mg-cover-img" />
      </div>
    </section>

    <!-- IMPACT STRIP -->
    <div class="mg-wrap">
      <div class="mg-impact-strip">
        <div class="mg-impact-cell">
          <b class="mg-impact-n">2.5K+</b>
          <span class="mg-impact-label">Respostas no survey quantitativo</span>
        </div>
        <div class="mg-impact-cell">
          <b class="mg-impact-n">15</b>
          <span class="mg-impact-label">Entrevistas qualitativas em 10 dias</span>
        </div>
        <div class="mg-impact-cell">
          <b class="mg-impact-n">4</b>
          <span class="mg-impact-label">Caminhos estratégicos entregues</span>
        </div>
        <div class="mg-impact-cell">
          <b class="mg-impact-n">30 dias</b>
          <span class="mg-impact-label">Da pesquisa à recomendação executiva</span>
        </div>
      </div>
    </div>

    <!-- CONTEXTO -->
    <div class="mg-wrap">
      <section class="mg-section">
        <div class="mg-rule-label"><span class="mg-dot" aria-hidden="true"></span>Contexto</div>
        <div class="mg-split">
          <div class="mg-split-text">
            <h2 class="mg-headline">Celebridades vendem — mas a que custo?</h2>
            <p class="mg-body">
              A Master Globo utilizava apresentadores famosos em seus cursos online. A estratégia funcionava para gerar atenção, mas carregava riscos reais: disputas contratuais, mudanças de imagem pública, eventos imprevistos. A dependência de um rosto famoso criava uma fragilidade estratégica que o negócio precisava endereçar.
            </p>
            <p class="mg-body">
              A pergunta central: <strong>avatares gerados por IA poderiam substituir celebridades sem sacrificar o engajamento do aluno?</strong>
            </p>
          </div>
          <div class="mg-split-visual">
            <img :src="avatarsImg" alt="Avatares Master Globo" class="mg-img-full" />
          </div>
        </div>
      </section>
    </div>

    <!-- ABORDAGEM -->
    <div class="mg-wrap">
      <section class="mg-section">
        <div class="mg-rule-label"><span class="mg-dot" aria-hidden="true"></span>Abordagem</div>
        <div class="mg-two-col">
          <div>
            <h2 class="mg-headline">Mixed-methods para medir o incomensurável</h2>
            <p class="mg-body">
              Preferência, confiança e conforto com inovação tecnológica são difíceis de capturar com um único método. Combinamos profundidade qualitativa com escala quantitativa para triangular os dados.
            </p>
          </div>
          <div class="mg-method-cards">
            <div class="mg-card">
              <div class="mg-card-label">Fase 01 · Qualitativa</div>
              <div class="mg-card-value">15 entrevistas em profundidade</div>
              <p class="mg-card-desc">Conduzidas em 10 dias. Mapeamento de preferências, percepções e expectativas sobre os formatos de apresentação.</p>
            </div>
            <div class="mg-card">
              <div class="mg-card-label">Fase 02 · Quantitativa</div>
              <div class="mg-card-value">Survey online · 2.500+ respostas</div>
              <p class="mg-card-desc">Duas semanas de coleta. NPS, validação de hipóteses e dados demográficos para representatividade estatística.</p>
            </div>
          </div>
        </div>
      </section>
    </div>

    <!-- AI BLOCK -->
    <div class="mg-wrap">
      <div class="mg-ai-block">
        <div class="mg-ai-eyebrow"><span class="mg-dot" aria-hidden="true"></span>Inovação de processo</div>
        <h3 class="mg-ai-title">IA no processamento dos dados quantitativos</h3>
        <p class="mg-ai-text">
          Com mais de 2.500 respostas abertas no formulário, o processamento manual seria inviável no prazo de um mês. Utilizamos inteligência artificial para análise e categorização dos dados qualitativos do survey — acelerando a extração de padrões e garantindo que nenhum insight fosse perdido na escala. Isso permitiu cruzar variáveis com profundidade e velocidade impossíveis de alcançar manualmente, entregando ao cliente uma análise mais rica no mesmo tempo.
        </p>
      </div>
    </div>

    <!-- ENTREVISTAS -->
    <div class="mg-wrap">
      <section class="mg-section">
        <div class="mg-rule-label"><span class="mg-dot" aria-hidden="true"></span>Processo</div>
        <div class="mg-split mg-split--reverse">
          <div class="mg-split-text">
            <h2 class="mg-headline">Entrevistas online com usuários reais da plataforma</h2>
            <p class="mg-body">
              As entrevistas qualitativas foram conduzidas remotamente com alunos ativos da plataforma Master Globo. O roteiro explorou percepções sobre formatos de apresentação, confiança em conteúdo digital e abertura para inovação tecnológica — gerando insumos ricos para complementar os dados quantitativos.
            </p>
          </div>
          <div class="mg-split-visual">
            <img :src="interviewImg" alt="Entrevista qualitativa Master Globo" class="mg-img-full" />
          </div>
        </div>
      </section>
    </div>

    <!-- PRINCIPAIS ACHADOS -->
    <div class="mg-wrap">
      <section class="mg-section">
        <div class="mg-rule-label"><span class="mg-dot" aria-hidden="true"></span>Principais Achados</div>
        <h2 class="mg-headline">A celebridade não é o produto. A marca é.</h2>
        <div class="mg-findings-grid">
          <div class="mg-finding-card">
            <div class="mg-finding-icon">
              <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/><circle cx="12" cy="12" r="10"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
            </div>
            <div class="mg-finding-title">Humanos ainda preferidos, celebridade irrelevante</div>
            <p class="mg-finding-text">Usuários preferem apresentadores humanos, mas o status de celebridade não foi fator decisivo na escolha do curso. O que importa está além do rosto.</p>
          </div>
          <div class="mg-finding-card">
            <div class="mg-finding-icon">
              <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
            </div>
            <div class="mg-finding-title">A marca vale mais que o apresentador</div>
            <p class="mg-finding-text">Os três fatores mais valorizados foram: credibilidade da marca, qualidade percebida do conteúdo e o prestígio do nome Globo no currículo.</p>
          </div>
          <div class="mg-finding-card">
            <div class="mg-finding-icon">
              <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="3" width="20" height="14" rx="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/></svg>
            </div>
            <div class="mg-finding-title">Cartoon leva por margem mínima</div>
            <p class="mg-finding-text">Entre os tipos de avatar, o estilo cartoon performou ligeiramente melhor que o humanizado — 51% vs 49%. Na prática, um empate técnico que indica abertura para inovação.</p>
          </div>
        </div>
      </section>
    </div>

    <!-- VALOR ALÉM DO ESPERADO -->
    <div class="mg-wrap">
      <section class="mg-section">
        <div class="mg-rule-label"><span class="mg-dot" aria-hidden="true"></span>Valor Além do Esperado</div>
        <h2 class="mg-headline">O dashboard que entregou mais do que foi pedido</h2>
        <p class="mg-body" style="max-width:58ch;margin-bottom:2rem">
          Os dados coletados revelaram oportunidades que iam além da questão dos avatares. Estruturamos um dashboard de insights que transformou respostas dispersas em recomendações acionáveis — sinalizando problemas críticos de produto que o cliente ainda não havia endereçado.
        </p>
        <div class="mg-dashboard-grid">
          <div class="mg-dash-card">
            <span class="mg-dash-tag">Conteúdo</span>
            <div class="mg-dash-title">Carência de material de apoio</div>
            <p class="mg-dash-text">Alunos sinalizaram forte demanda por PDFs, atividades escritas e leituras complementares além das aulas em vídeo.</p>
          </div>
          <div class="mg-dash-card">
            <span class="mg-dash-tag">Plataforma · UX</span>
            <div class="mg-dash-title">Impossível pausar e retomar</div>
            <p class="mg-dash-text">A plataforma não permitia salvar o progresso com facilidade — dor crítica para quem acessa de forma não-linear.</p>
          </div>
          <div class="mg-dash-card">
            <span class="mg-dash-tag">Plataforma · Visual</span>
            <div class="mg-dash-title">Interface desatualizada</div>
            <p class="mg-dash-text">Alunos percebem o visual como "atrasado" e pouco condizente com a reputação inovadora da marca Globo.</p>
          </div>
          <div class="mg-dash-card">
            <span class="mg-dash-tag">Plataforma · Mobile</span>
            <div class="mg-dash-title">Experiência mobile crítica</div>
            <p class="mg-dash-text">A maioria dos alunos acessa via smartphone, mas a plataforma não está otimizada para mobile — impactando diretamente a retenção.</p>
          </div>
        </div>
      </section>
    </div>

    <!-- RECOMENDAÇÕES ESTRATÉGICAS -->
    <div class="mg-wrap">
      <section class="mg-section">
        <div class="mg-rule-label"><span class="mg-dot" aria-hidden="true"></span>Recomendações Estratégicas</div>
        <h2 class="mg-headline">Quatro caminhos. Uma decisão informada.</h2>
        <p class="mg-body" style="max-width:58ch;margin-bottom:2.5rem">
          Em vez de uma recomendação única, entregamos ao cliente um mapa de possibilidades — cada caminho com trade-offs claros para facilitar a tomada de decisão executiva.
        </p>
        <div class="mg-paths-grid">
          <div class="mg-path-card">
            <div class="mg-path-num">01</div>
            <div class="mg-path-name">Transição Gradual</div>
            <p class="mg-path-desc">Introduzir avatares cartoon dentro dos cursos ao lado de apresentadores humanos, permitindo que a audiência se adapte progressivamente à inovação.</p>
          </div>
          <div class="mg-path-card">
            <div class="mg-path-num">02</div>
            <div class="mg-path-name">Abordagem Híbrida</div>
            <p class="mg-path-desc">Avatares entregam o conteúdo, celebridades ficam nas thumbnails e materiais promocionais — preservando visibilidade sem os riscos de dependência contratual.</p>
          </div>
          <div class="mg-path-card">
            <div class="mg-path-num">03</div>
            <div class="mg-path-name">Especialistas + Avatares</div>
            <p class="mg-path-desc">Profissionais reconhecidos (não necessariamente famosos) combinados com avatares — equilibrando autoridade de conteúdo com inovação tecnológica.</p>
          </div>
          <div class="mg-path-card">
            <div class="mg-path-num">04</div>
            <div class="mg-path-name">Substituição Total</div>
            <p class="mg-path-desc">Posicionar a Globo como pioneira no uso de avatares na educação online — uma jogada de branding ousada, sustentada pelos dados de aceitação coletados.</p>
          </div>
        </div>
      </section>
    </div>

    <!-- CLOSING -->
    <div class="mg-wrap">
      <div class="mg-closing">
        <p class="mg-closing-text">
          Pesquisa que responde e<br><em>descobre mais.</em>
        </p>
        <div class="mg-closing-actions">
          <router-link to="/projetos" class="mg-btn mg-btn--ghost">
            <span class="mg-btn-lbl">← Ver todos os cases</span>
          </router-link>
          <a href="mailto:tayna.schultz@gmail.com?subject=Olá%2C%20Tayná%20—%20vi%20seu%20portfólio" class="mg-btn mg-btn--solid">
            <span class="mg-btn-lbl">Vamos conversar →</span>
          </a>
        </div>
      </div>
    </div>

    <!-- FOOTER -->
    <footer class="mg-footer">
      <span class="mg-footer-tag">Master Globo · UX Research · 2025</span>
      <span class="mg-footer-copy">© 2025 Tayná Schultz</span>
    </footer>

    <!-- Back to top -->
    <button class="btt-btn" :class="{ 'btt-btn--visible': showBtt }" @click="scrollToTop" aria-label="Voltar ao topo">
      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="18 15 12 9 6 15"/></svg>
    </button>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
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
.mg-hero-desc{font-size:clamp(1.125rem,2vw,1.3rem);font-weight:300;line-height:1.85;color:var(--fg-muted);max-width:44ch}
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
.mg-impact-cell{background:#070711;padding:2rem 1.5rem;display:flex;flex-direction:column;gap:.5rem;transition:background .3s}
.mg-impact-cell:hover{background:rgba(240,24,90,.06)}
.theme-light .mg-impact-cell{background:#F5F3FF}
.mg-impact-n{font-family:'Clash Display',sans-serif;font-weight:700;font-size:clamp(1.8rem,5vw,3rem);line-height:1;color:#F0185A}
.mg-impact-label{font-size:.5rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;color:var(--fg-muted)}

/* ── Section label ────────────────────────────────────────── */
.mg-section{margin-bottom:5rem}
.mg-rule-label{display:flex;align-items:center;gap:.75rem;font-size:.58rem;font-weight:500;letter-spacing:.18em;text-transform:uppercase;color:#F0185A;margin-bottom:2rem}
.mg-rule-label::after{content:'';flex:1;height:1px;background:linear-gradient(90deg,rgba(240,24,90,.4) 0%,transparent 70%)}

/* ── Typography ───────────────────────────────────────────── */
.mg-headline{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1.2rem,3.5vw,2rem);line-height:1.2;letter-spacing:-.01em;margin-bottom:1.25rem}
.mg-body{font-size:clamp(1.125rem,2vw,1.25rem);font-weight:300;line-height:1.85;color:var(--fg-muted)}
.mg-body + .mg-body{margin-top:1rem}
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
.mg-card-desc{font-size:1.125rem;font-weight:300;line-height:1.7;color:var(--fg-muted)}

/* ── AI block ─────────────────────────────────────────────── */
.mg-ai-block{border:1px solid rgba(240,24,90,.35);padding:2rem 2rem;background:rgba(240,24,90,.06);position:relative;overflow:hidden;margin:0 0 5rem}
.mg-ai-block::after{content:'AI';position:absolute;right:1.5rem;top:50%;transform:translateY(-50%);font-family:'Clash Display',sans-serif;font-size:6rem;font-weight:700;color:#F0185A;opacity:.05;pointer-events:none;line-height:1}
.mg-ai-eyebrow{display:flex;align-items:center;gap:.5rem;font-size:.5rem;font-weight:500;letter-spacing:.16em;text-transform:uppercase;color:#F0185A;margin-bottom:.75rem}
.mg-ai-title{font-family:'Clash Display',sans-serif;font-weight:600;font-size:clamp(1rem,2.5vw,1.4rem);line-height:1.2;margin-bottom:1rem}
.mg-ai-text{font-size:clamp(1.125rem,2vw,1.25rem);font-weight:300;line-height:1.85;color:var(--fg-muted);max-width:62ch}

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
.mg-finding-text{font-size:1.125rem;font-weight:300;line-height:1.75;color:var(--fg-muted)}

/* ── Dashboard grid ───────────────────────────────────────── */
.mg-dashboard-grid{display:grid;grid-template-columns:1fr;gap:.75rem}
@media(min-width:640px){.mg-dashboard-grid{grid-template-columns:1fr 1fr}}
.mg-dash-card{border:1px solid rgba(255,255,255,.07);padding:1.25rem;transition:border-color .3s}
.mg-dash-card:hover{border-color:rgba(240,24,90,.35)}
.theme-light .mg-dash-card{border-color:rgba(0,0,0,.09)}
.mg-dash-tag{display:inline-block;margin-bottom:.75rem;font-size:.45rem;letter-spacing:.14em;text-transform:uppercase;color:#F0185A;background:rgba(240,24,90,.08);padding:.2rem .5rem}
.mg-dash-title{font-family:'Clash Display',sans-serif;font-size:.95rem;font-weight:600;margin-bottom:.5rem}
.mg-dash-text{font-size:1.125rem;font-weight:300;line-height:1.7;color:var(--fg-muted)}

/* ── Paths grid ───────────────────────────────────────────── */
.mg-paths-grid{display:grid;grid-template-columns:1fr;gap:1rem}
@media(min-width:640px){.mg-paths-grid{grid-template-columns:1fr 1fr}}
.mg-path-card{border:1px solid rgba(255,255,255,.07);padding:1.5rem;position:relative;transition:border-color .3s,transform .4s cubic-bezier(.16,1,.3,1)}
.mg-path-card:hover{border-color:rgba(240,24,90,.35);transform:translateY(-3px)}
.theme-light .mg-path-card{border-color:rgba(0,0,0,.09)}
.mg-path-num{font-family:'Clash Display',sans-serif;font-size:3rem;font-weight:700;color:rgba(240,24,90,.15);line-height:1;margin-bottom:1rem;transition:color .3s}
.mg-path-card:hover .mg-path-num{color:rgba(240,24,90,.4)}
.mg-path-name{font-family:'Clash Display',sans-serif;font-size:1rem;font-weight:600;margin-bottom:.75rem;line-height:1.2}
.mg-path-desc{font-size:1.125rem;font-weight:300;line-height:1.75;color:var(--fg-muted)}

/* ── Closing ──────────────────────────────────────────────── */
.mg-closing{padding:5rem 0;border-top:1px solid rgba(255,255,255,.07);display:flex;flex-direction:column;gap:2rem;align-items:flex-start}
@media(min-width:768px){.mg-closing{flex-direction:row;align-items:center;justify-content:space-between}}
.theme-light .mg-closing{border-top-color:rgba(0,0,0,.08)}
.mg-closing-text{font-family:'Clash Display',sans-serif;font-size:clamp(1.2rem,3vw,1.8rem);font-weight:600;line-height:1.2;letter-spacing:-.01em;max-width:30ch}
.mg-closing-text em{font-style:italic;color:#F0185A}
.mg-closing-actions{display:flex;flex-wrap:wrap;gap:1rem}

/* ── Buttons ──────────────────────────────────────────────── */
.mg-btn{display:inline-flex;align-items:center;justify-content:center;height:50px;padding:0 1.75rem;text-decoration:none;font-size:.63rem;font-weight:500;letter-spacing:.14em;text-transform:uppercase;transition:background .2s,border-color .2s,color .2s;border:1px solid}
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

/* ── Animations ───────────────────────────────────────────── */
@keyframes mg-pulse{0%,100%{opacity:1;transform:scale(1)}50%{opacity:.3;transform:scale(.75)}}
</style>
