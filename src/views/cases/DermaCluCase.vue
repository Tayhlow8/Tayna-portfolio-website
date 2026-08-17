<template>
  <article ref="rootEl" :class="['case-page', `theme-${theme}`]">
    <NavBar v-model:lang="lang" v-model:theme="theme" />

    <!-- Grain overlay -->
    <div class="grain" aria-hidden="true"></div>

    <!-- ── HERO ──────────────────────────────────────────────── -->
    <header class="case-hero">
      <div class="case-wrap">
        <div class="case-eyebrow">
          <span class="pf-dot" aria-hidden="true"></span>
          <span>L'Oréal Group · DermaClub · VTEX</span>
        </div>

        <h1 class="case-title">
          {{ t.titleLine1 }}<br />
          <em>{{ t.titleEm }}</em>
        </h1>

        <p class="case-subtitle" v-html="t.subtitle"></p>

        <div class="case-meta-row">
          <div class="case-meta-item">
            <span class="case-meta-label">{{ t.metaRoleLabel }}</span>
            <span class="case-meta-value">UX Designer</span>
          </div>
          <div class="case-meta-divider" aria-hidden="true"></div>
          <div class="case-meta-item">
            <span class="case-meta-label">{{ t.metaPlatformLabel }}</span>
            <span class="case-meta-value">VTEX Commerce</span>
          </div>
          <div class="case-meta-divider" aria-hidden="true"></div>
          <div class="case-meta-item">
            <span class="case-meta-label">{{ t.metaScopeLabel }}</span>
            <span class="case-meta-value">{{ t.metaScopeValue }}</span>
          </div>
        </div>
      </div>
    </header>

    <!-- ── RESULTS BANNER ────────────────────────────────────── -->
    <section class="results-band" :aria-label="t.resultsAria">
      <div class="case-wrap">
        <div class="results-grid">
          <div class="result-item">
            <span class="result-num">+7.10%</span>
            <span class="result-label">{{ t.resRevenue }}</span>
          </div>
          <div class="result-divider" aria-hidden="true"></div>
          <div class="result-item">
            <span class="result-num">+5.71%</span>
            <span class="result-label">{{ t.resConversion }}</span>
          </div>
          <div class="result-divider" aria-hidden="true"></div>
          <div class="result-item">
            <span class="result-num">+32%</span>
            <span class="result-label">{{ t.resCTR }}</span>
          </div>
        </div>
      </div>
    </section>

    <!-- ── CONTEXT ────────────────────────────────────────────── -->
    <section class="case-section">
      <div class="case-wrap">
        <div class="context-grid">
          <div class="context-text">
            <div class="section-label" aria-hidden="true">{{ t.problemLabel }}</div>
            <h2 class="section-heading">{{ t.problemHeading }}</h2>
            <p class="section-body" v-html="t.problemBody1"></p>
            <p class="section-body" v-html="t.problemBody2"></p>
            <p class="section-body" v-html="t.problemBody3"></p>
          </div>
          <div class="context-image-wrap">
            <img
              :src="imgContext"
              :alt="t.contextAlt"
              class="context-image"
              loading="lazy"
            />
          </div>
        </div>
      </div>
    </section>

    <!-- ── CONSTRAINTS ───────────────────────────────────────── -->
    <section class="case-section">
      <div class="case-wrap">
        <div class="section-label" aria-hidden="true">{{ t.constraintsLabel }}</div>
        <h2 class="section-heading case-wrap--narrow" style="max-width: none">
          {{ t.constraintsHeading }}
        </h2>
        <p class="section-body">{{ t.constraintsBody1 }}</p>
        <p class="section-body" v-html="t.constraintsBody2"></p>
        <p class="section-body" v-html="t.constraintsBody3"></p>
        <p class="section-body" v-html="t.constraintsBody4"></p>
      </div>
    </section>

    <!-- ── BEFORE / AFTER ────────────────────────────────────── -->
    <section class="case-section">
      <div class="case-wrap">
        <div class="section-label" aria-hidden="true">{{ t.baLabel }}</div>
        <h2 class="section-heading case-wrap--narrow" style="max-width: none">
          {{ t.baHeading }}
        </h2>

        <div class="ba-grid">
          <!-- BEFORE -->
          <div class="ba-col">
            <div class="ba-badge ba-badge--before">{{ t.badgeBefore }}</div>
            <div class="ba-image-wrap">
              <img
                :src="imgBefore"
                :alt="t.beforeAlt"
                class="ba-image"
                loading="lazy"
              />
            </div>
            <ul class="ba-issues" :aria-label="t.beforeAria">
              <li v-for="(item, i) in t.beforeIssues" :key="i">{{ item }}</li>
            </ul>
          </div>

          <!-- AFTER -->
          <div class="ba-col">
            <div class="ba-badge ba-badge--after">{{ t.badgeAfter }}</div>
            <div class="ba-image-wrap">
              <img
                :src="imgAfter"
                :alt="t.afterAlt"
                class="ba-image"
                loading="lazy"
              />
            </div>
            <ul
              class="ba-issues ba-issues--after"
              :aria-label="t.afterAria"
            >
              <li v-for="(item, i) in t.afterIssues" :key="i">{{ item }}</li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <!-- ── DESIGN DECISIONS ──────────────────────────────────── -->
    <section class="case-section case-section--alt">
      <div class="case-wrap">
        <div class="section-label" aria-hidden="true">{{ t.decisionsLabel }}</div>
        <h2 class="section-heading case-wrap--narrow" style="max-width: none">
          {{ t.decisionsHeading }}
        </h2>

        <p class="section-body">{{ t.decisionsIntro }}</p>

        <div class="decisions-grid">
          <div
            v-for="(d, i) in t.decisions"
            :key="i"
            class="decision-card"
            :style="`--anim-delay: ${i * 0.07}s`"
          >
            <div class="decision-num" aria-hidden="true">
              {{ String(i + 1).padStart(2, "0") }}
            </div>
            <h3 class="decision-title">{{ d.title }}</h3>
            <p class="decision-body">{{ d.body }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- ── MOBILE PROBLEMS + RESULTS (side by side on desktop) ── -->
    <section class="case-section">
      <div class="case-wrap">
        <div class="case-two-col">
          <!-- LEFT: Mobile Issues (04) + Learnings (06) -->
          <div class="two-col-left">
            <div class="section-label" aria-hidden="true">{{ t.mobileLabel }}</div>
            <h2 class="section-heading">{{ t.mobileHeading }}</h2>
            <p class="section-body">{{ t.mobileBody }}</p>
            <div class="mobile-issues-list">
              <div v-for="(m, i) in t.mobileIssues" :key="i" class="mobile-issue">
                <span class="mobile-issue-marker" aria-hidden="true"></span>
                <p>{{ m }}</p>
              </div>
            </div>

            <div class="col-learnings">
              <div class="section-label" aria-hidden="true">{{ t.learningsLabel }}</div>
              <h2 class="section-heading">{{ t.learningsHeading }}</h2>
              <p class="section-body">{{ t.learningsBody1 }}</p>
              <p class="section-body">{{ t.learningsBody2 }}</p>
            </div>
          </div>

          <!-- RIGHT: Results -->
          <div class="two-col-right">
            <div class="section-label" aria-hidden="true">{{ t.resultsLabel }}</div>
            <h2 class="section-heading">{{ t.resultsHeading }}</h2>
            <p class="section-body">{{ t.resultsBody }}</p>

            <div class="results-cards">
              <div v-for="(r, i) in t.results" :key="i" class="result-card">
                <span class="result-card-num">{{ r.num }}</span>
                <span class="result-card-label">{{ r.label }}</span>
                <p class="result-card-desc">{{ r.desc }}</p>
              </div>
            </div>

            <p class="section-body" style="margin-top: 2rem">
              {{ t.resultsClosing }}
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- ── FOOTER ───────────────────────────────────────────── -->
    <ContactSection :lang="lang" :theme="theme" />

    <!-- ── NAV FOOTER ────────────────────────────────────────── -->
    <nav class="case-footer-nav" aria-label="Case study navigation">
      <div class="case-wrap">
        <div class="case-footer-nav-inner">
          <router-link to="/work" class="case-nav-link case-nav-link--back">
            <span class="case-nav-arr" aria-hidden="true">←</span>
            {{ t.navBack }}
          </router-link>
          <router-link
            to="/work/lancome"
            class="case-nav-link case-nav-link--next"
          >
            {{ t.navNext }}
            <span class="case-nav-arr" aria-hidden="true">→</span>
          </router-link>
        </div>
      </div>
    </nav>
  </article>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from "vue";
import NavBar from "../../../secoes/NavBar.vue";
import { useLang } from "../../composables/useLang";
import ContactSection from "../../../secoes/ContactSection.vue";
import imgBefore from "../../../imagens cases/dermaclub/checkout before.avif";
import imgAfter from "../../../imagens cases/dermaclub/checkout after.avif";
import imgContext from "../../assets/dermaclub checkout.png";

const props = defineProps({
  lang: { type: String, default: "EN" },
  theme: { type: String, default: "light" },
});

const { lang } = useLang();
const theme = ref(props.theme);

// ── Parallax ─────────────────────────────────────────────────
const rootEl = ref(null);
let rafId = null;

function updateParallax() {
  if (!rootEl.value) return;
  const vh = window.innerHeight;
  rootEl.value
    .querySelectorAll(".result-num, .result-card-num")
    .forEach((el) => {
      const rect = el.getBoundingClientRect();
      if (rect.top > vh || rect.bottom < 0) {
        el.style.transform = "";
        return;
      }
      // t: 0 when element center is at top of viewport, 1 when at bottom
      const t = (rect.top + rect.height / 2) / vh;
      // shift from +25px (entering from bottom) to -25px (leaving top)
      el.style.transform = `translateY(${(t - 0.5) * 50}px)`;
    });
}

function onScroll() {
  if (rafId) cancelAnimationFrame(rafId);
  rafId = requestAnimationFrame(updateParallax);
}

onMounted(() => {
  window.addEventListener("scroll", onScroll, { passive: true });
});
onUnmounted(() => {
  window.removeEventListener("scroll", onScroll);
  if (rafId) cancelAnimationFrame(rafId);
});

const copy = {
  EN: {
    titleLine1: "The Checkout",
    titleEm: "Rescue",
    subtitle:
      "DermaClub's checkout was generating an abnormal volume of customer bug reports — bleeding conversion in real time. Drawing on hands-on VTEX experience, I diagnosed the root cause on sight, sequenced the fixes with an effort-vs-impact matrix, and validated the redesign with an A/B test that lifted revenue by&nbsp;+7.1%.",
    metaRoleLabel: "Role",
    metaPlatformLabel: "Platform",
    metaScopeLabel: "Scope",
    metaScopeValue: "Research · UX · UI",
    resultsAria: "Key results",
    resRevenue: "Revenue",
    resConversion: "Conversion Rate",
    resCTR: "Pass Through Rate",
    problemLabel: "01 · The Problem",
    problemHeading: "An urgent conversion problem",
    problemBody1:
      "DermaClub is L'Oréal Group's dermocosmetics loyalty brand in Brazil, running on VTEX. This engagement didn't start as a redesign — it started as an emergency. The client came to us with an <strong>abnormally high volume of customer bug reports</strong> at checkout, and those bugs were hitting conversion directly. The funnel confirmed it: users reached checkout in healthy numbers, then abandoned en masse before completing the purchase. This wasn't a cosmetic complaint — it was revenue leaving through a broken funnel, and it needed to be stopped fast.",
    problemBody2:
      "The moment I opened the checkout, two problems stood out. First, an excessive amount of <strong>custom content</strong> — buttons, images, cards, and heavily stylized elements added over time to match the brand guidelines. Second, the brand guidelines themselves: low-contrast color pairings and more than one accent color, chosen to feel young and energetic for a younger audience, but working against legibility at the worst possible moment.",
    problemBody3:
      "Having worked with VTEX checkout before, I recognized the root cause immediately — and the client didn't. On VTEX, the checkout is deliberately standardized: platform best practice is to customize it as little as possible, precisely so the flow stays seamless and stable. The volume of custom content the page was being asked to render was exactly what broke it — <em>CTAs disappearing or going unresponsive, raw code leaking into the frontend, layout collapsing across breakpoints</em>. I could name the cause on sight because I'd lived inside the platform's constraints before.",
    contextAlt:
      "DermaClub checkout screen highlighting the fragmented layout identified through heatmap analysis",
    constraintsLabel: "02 · Constraints",
    constraintsHeading: "Two constraints to design around",
    constraintsBody1:
      "Knowing the cause isn't the same as knowing where to start. Two hard constraints shaped every decision that followed — and neither of them left room for the obvious move.",
    constraintsBody2:
      "The first was <strong>trust</strong>. A full redesign was tempting, and wrong. Ripping out a checkout that users already know — even a flawed one — breaks the mental model they rely on to complete a purchase, and risks trading one set of problems for another. Regular shoppers had learned to navigate this flow; the goal was to remove friction without forcing them to relearn where anything lived. That ruled out a clean-slate rebuild and pushed me toward targeted, reversible changes.",
    constraintsBody3:
      "The second was the <strong>brand</strong>. DermaClub's guidelines failed basic contrast tests — a pink background paired with white text — but the guidelines weren't mine to discard. My job wasn't to override the brand; it was to make it accessible from inside its own system. Rather than introduce a foreign color, I worked within the palette the brand had already defined, finding a compliant pairing that still read unmistakably as DermaClub.",
    constraintsBody4:
      "With those two constraints fixed, I mapped the issues on an <strong>effort-vs-impact matrix</strong> and sequenced the work: stop the bleeding first, correct for brand and accessibility second, and only then test a hypothesis.",
    baLabel: "03 · Before & After",
    baHeading: "Side by side",
    badgeBefore: "Before",
    badgeAfter: "After",
    beforeAlt:
      "DermaClub checkout before the redesign: broken layout, low contrast, loyalty points and order summary scattered at the bottom of the page",
    afterAlt:
      "DermaClub checkout after the redesign: light background, reorganized order summary, rounded boxes with brand-compliant contrast colors, free shipping highlighted",
    beforeAria: "Issues identified",
    afterAria: "Improvements shipped",
    beforeIssues: [
      "Excessive custom content (buttons, cards, images) overloading a platform built to stay standard",
      "CTAs disappearing or going unresponsive; raw code leaking into the frontend",
      "Broken layout across desktop & mobile breakpoints",
      "Pink background paired with white text — failing every WCAG contrast check",
      "More than one accent color competing for attention at the decision moment",
      "Promotional text crowding the first step, pulling focus from the primary action",
    ],
    afterIssues: [
      "Reset to the VTEX standard checkout layout — eliminating the bugs at their source",
      "A dark-blue shade pulled from the brand palette, restoring WCAG-compliant contrast",
      "Promotional text removed from the first step to cut cognitive load",
      "Primary CTA highlighted and given clear visual priority",
      "Consistent styling across cart items despite platform grouping constraints",
      "Free shipping surfaced prominently — a proven conversion lever",
    ],
    decisionsLabel: "04 · Design Decisions",
    decisionsHeading: "Every change had a reason",
    decisionsIntro:
      "I sequenced the work by effort and impact: kill the platform bugs first, correct brand and accessibility second, then reduce friction — each change defensible by data or platform reality, not by taste.",
    decisions: [
      {
        title: "Reset to the VTEX standard checkout layout",
        body: "The single highest-impact, lowest-effort move — so it went first. Reverting the over-customized checkout to VTEX's native layout eliminated the rendering bugs at their source: CTAs reappeared and stayed responsive, code stopped leaking into the frontend, and the layout held across breakpoints. It stopped the bleeding before anything else touched the page.",
      },
      {
        title: "A dark blue from the brand's own palette",
        body: "The brand paired a pink background with white text, failing every WCAG contrast test. Instead of fighting the brand, I pulled a dark-blue shade already defined in its guidelines to pair with the pink — resolving accessibility and identity at once, without introducing a single new color.",
      },
      {
        title: "Remove promotional text from the first step",
        body: "The opening checkout step was crowded with promo copy competing with the primary action. Stripping it reduced cognitive load exactly where users decide whether to proceed — recognition over recall, minimalist design over stimulation.",
      },
      {
        title: "Highlight the primary CTA",
        body: "With the noise cleared, the confirm action was given unmistakable visual priority. Users should never have to hunt for the next step at the most decisive moment of the funnel.",
      },
      {
        title: "Progressive disclosure for loyalty points",
        body: "Centering and minimizing the scoring block respects a core UX principle: show information when it's contextually useful, not just because it exists. Loyalty data during order confirmation was competing with the CTA for attention it shouldn't have.",
      },
      {
        title: "Visual unity despite platform grouping constraints",
        body: "VTEX prevented us from grouping product samples into a single container. I compensated through consistent styling — matching spacing, backgrounds, typography, and interaction states — so the interface felt intentional, not fragmented.",
      },
      {
        title: "Free shipping made unmissable",
        body: "Free shipping is one of the strongest known drivers of checkout completion. I elevated its visual prominence so it delivers its positive reinforcement precisely where cart-abandonment risk peaks.",
      },
    ],
    mobileLabel: "05 · Mobile-Specific Issues",
    mobileHeading: "Mobile was a different beast",
    mobileBody:
      "The desktop issues were significant, but mobile had its own layer of problems that heatmap analysis made impossible to ignore.",
    mobileIssues: [
      "Elements overflowed the grid and broke the layout on small screens.",
      "Button hierarchy was flat — primary CTA did not stand out visually.",
      "No scrollbar indicators left users unaware that content continued below the fold.",
      "Heatmap data showed significant tap volume on the breadcrumb at the top — a non-interactive element — indicating user confusion about navigation and progress.",
    ],
    learningsLabel: "07 · Learnings",
    learningsHeading: "What I took from this",
    learningsBody1:
      "Platform expertise is a diagnostic tool. Because I'd worked inside VTEX before, I could name the root cause the moment I saw the page — while the client, understandably, could not. Deep familiarity with a platform's constraints isn't a limitation; it's what lets you move fast and correctly under pressure.",
    learningsBody2:
      "Just as important: knowing the fix doesn't justify shipping it all at once. Sequencing the work by effort and impact — stabilize, then correct, then optimize — protected the trust of users who already knew the flow, and let each change be measured on its own terms rather than lost inside a single risky redesign.",
    resultsLabel: "06 · Results",
    resultsHeading: "The test won",
    resultsBody:
      "With the checkout stable and accessible, the final move was a controlled A/B test. The hypothesis was specific: removing promotional text from the first step and giving the primary CTA clear visual priority would lower cognitive load — and a lower-effort decision would convert better. The variant beat the original on all three primary metrics.",
    results: [
      {
        num: "+7.10%",
        label: "Revenue",
        desc: "A stable, cleaner checkout with fewer obstacles at the decision moment drove measurable uplift in overall revenue during the test window.",
      },
      {
        num: "+5.71%",
        label: "Conversion Rate",
        desc: "More users who entered the checkout completed their purchase — a direct reflection of the reduced cognitive load the variant was built to deliver.",
      },
      {
        num: "+32%",
        label: "Pass Through Rate",
        desc: "Far more users advanced from the first step into the next — evidence that clearing promo clutter and highlighting the CTA moved people forward.",
      },
    ],
    resultsClosing:
      "Within the constraints of the VTEX platform — which limits the degree of checkout customisation available to designers — these gains demonstrate that well-reasoned UX improvements, grounded in real behavioral data, move the needle even when you can't fully control the canvas.",
    navBack: "All work",
    navNext: "Next case",
  },

  PT: {
    titleLine1: "O Resgate do",
    titleEm: "Checkout",
    subtitle:
      "O checkout da DermaClub gerava um volume anormal de reports de bugs dos clientes — perdendo conversão em tempo real. Apoiada na minha experiência prática com VTEX, diagnostiquei a causa raiz de imediato, sequenciei as correções com uma matriz de esforço x impacto e validei o redesign com um teste A/B que elevou a receita em&nbsp;+7,1%.",
    metaRoleLabel: "Função",
    metaPlatformLabel: "Plataforma",
    metaScopeLabel: "Escopo",
    metaScopeValue: "Pesquisa · UX · UI",
    resultsAria: "Principais resultados",
    resRevenue: "Receita",
    resConversion: "Taxa de Conversão",
    resCTR: "Taxa de Passagem",
    problemLabel: "01 · O Problema",
    problemHeading: "Um problema urgente de conversão",
    problemBody1:
      "A DermaClub é a marca de fidelidade dermocosmética do Grupo L'Oréal no Brasil, rodando em VTEX. Este projeto não começou como um redesign — começou como uma emergência. O cliente nos procurou com um <strong>volume anormalmente alto de reports de bugs dos clientes</strong> no checkout, e esses bugs impactavam a conversão diretamente. O funil confirmava: os usuários chegavam ao checkout em bom número e depois abandonavam em massa antes de concluir a compra. Não era uma reclamação estética — era receita escapando por um funil quebrado, e precisava ser estancada rápido.",
    problemBody2:
      "No momento em que abri o checkout, dois problemas saltaram aos olhos. Primeiro, um excesso de <strong>conteúdo customizado</strong> — botões, imagens, cards e elementos muito estilizados adicionados ao longo do tempo para seguir o guia da marca. Segundo, o próprio guia da marca: combinações de cores com baixo contraste e mais de uma cor de destaque, escolhidas para transmitir jovialidade e energia a um público mais jovem, mas trabalhando contra a legibilidade no pior momento possível.",
    problemBody3:
      "Como eu já havia trabalhado com o checkout da VTEX antes, reconheci a causa raiz imediatamente — e o cliente não. Na VTEX, o checkout é deliberadamente padronizado: a boa prática da plataforma é customizá-lo o mínimo possível, justamente para que o fluxo permaneça fluido e estável. O volume de conteúdo customizado que a página precisava renderizar era exatamente o que a quebrava — <em>CTAs sumindo ou ficando sem resposta, código vazando para o frontend, layout colapsando entre breakpoints</em>. Consegui nomear a causa de imediato porque já havia vivido dentro das restrições da plataforma.",
    contextAlt:
      "Tela do checkout da DermaClub destacando o layout fragmentado identificado pela análise de heatmap",
    constraintsLabel: "02 · Restrições",
    constraintsHeading: "Duas restrições para contornar no design",
    constraintsBody1:
      "Saber a causa não é o mesmo que saber por onde começar. Duas restrições difíceis moldaram cada decisão seguinte — e nenhuma delas deixava espaço para o caminho óbvio.",
    constraintsBody2:
      "A primeira era <strong>confiança</strong>. Um redesign completo era tentador, e errado. Arrancar um checkout que os usuários já conhecem — mesmo falho — quebra o modelo mental do qual eles dependem para concluir a compra, e arrisca trocar um conjunto de problemas por outro. Compradores recorrentes já haviam aprendido a navegar esse fluxo; o objetivo era remover fricção sem obrigá-los a reaprender onde cada coisa ficava. Isso descartava uma reconstrução do zero e me empurrava para mudanças pontuais e reversíveis.",
    constraintsBody3:
      "A segunda era a <strong>marca</strong>. As diretrizes da DermaClub falhavam em testes básicos de contraste — um fundo rosa combinado com texto branco — mas as diretrizes não eram minhas para descartar. Meu papel não era passar por cima da marca; era torná-la acessível de dentro do seu próprio sistema. Em vez de introduzir uma cor estranha ao guia, trabalhei dentro da paleta que a marca já havia definido, encontrando uma combinação em conformidade que ainda assim lia inconfundivelmente como DermaClub.",
    constraintsBody4:
      "Com essas duas restrições definidas, mapeei os problemas em uma <strong>matriz de esforço x impacto</strong> e sequenciei o trabalho: primeiro estancar a sangria, depois corrigir marca e acessibilidade e, só então, testar uma hipótese.",
    baLabel: "03 · Antes & Depois",
    baHeading: "Lado a lado",
    badgeBefore: "Antes",
    badgeAfter: "Depois",
    beforeAlt:
      "Checkout da DermaClub antes do redesign: layout quebrado, baixo contraste, pontos de fidelidade e resumo do pedido espalhados na parte inferior da página",
    afterAlt:
      "Checkout da DermaClub depois do redesign: fundo claro, resumo do pedido reorganizado, caixas arredondadas com cores de contraste em conformidade com a marca, frete grátis em destaque",
    beforeAria: "Problemas identificados",
    afterAria: "Melhorias entregues",
    beforeIssues: [
      "Excesso de conteúdo customizado (botões, cards, imagens) sobrecarregando uma plataforma feita para permanecer padrão",
      "CTAs sumindo ou ficando sem resposta; código vazando para o frontend",
      "Layout quebrado entre breakpoints de desktop e mobile",
      "Fundo rosa combinado com texto branco — falhando em todo teste de contraste WCAG",
      "Mais de uma cor de destaque disputando atenção no momento da decisão",
      "Texto promocional lotando o primeiro passo, tirando o foco da ação principal",
    ],
    afterIssues: [
      "Retorno ao layout padrão de checkout da VTEX — eliminando os bugs na origem",
      "Um tom de azul-escuro extraído da paleta da marca, restaurando o contraste em conformidade com a WCAG",
      "Texto promocional removido do primeiro passo para reduzir a carga cognitiva",
      "CTA principal destacada e com clara prioridade visual",
      "Estilização consistente entre os itens do carrinho apesar das restrições de agrupamento da plataforma",
      "Frete grátis em evidência — uma alavanca de conversão comprovada",
    ],
    decisionsLabel: "04 · Decisões de Design",
    decisionsHeading: "Cada mudança tinha um motivo",
    decisionsIntro:
      "Sequenciei o trabalho por esforço e impacto: primeiro matar os bugs da plataforma, depois corrigir marca e acessibilidade e então reduzir fricção — cada mudança defensável por dados ou pela realidade da plataforma, não por gosto.",
    decisions: [
      {
        title: "Retorno ao layout padrão de checkout da VTEX",
        body: "A ação de maior impacto e menor esforço — por isso veio primeiro. Reverter o checkout supercustomizado para o layout nativo da VTEX eliminou os bugs de renderização na origem: as CTAs reapareceram e voltaram a responder, o código parou de vazar para o frontend e o layout se manteve entre breakpoints. Estancou a sangria antes que qualquer outra coisa tocasse na página.",
      },
      {
        title: "Um azul-escuro da própria paleta da marca",
        body: "A marca combinava um fundo rosa com texto branco, falhando em todo teste de contraste WCAG. Em vez de brigar com a marca, extraí um tom de azul-escuro já definido em suas diretrizes para combinar com o rosa — resolvendo acessibilidade e identidade de uma só vez, sem introduzir uma única cor nova.",
      },
      {
        title: "Remover o texto promocional do primeiro passo",
        body: "O passo inicial do checkout estava lotado de texto promocional competindo com a ação principal. Removê-lo reduziu a carga cognitiva exatamente onde o usuário decide se avança — reconhecimento em vez de memória, design minimalista em vez de estímulo.",
      },
      {
        title: "Destacar a CTA principal",
        body: "Com o ruído eliminado, a ação de confirmar ganhou prioridade visual inconfundível. O usuário nunca deveria ter de procurar o próximo passo no momento mais decisivo do funil.",
      },
      {
        title: "Divulgação progressiva dos pontos de fidelidade",
        body: "Centralizar e minimizar o bloco de pontuação respeita um princípio central de UX: mostrar a informação quando ela é contextualmente útil, não só porque existe. Os dados de fidelidade durante a confirmação do pedido estavam competindo com a CTA por uma atenção que não deveriam ter.",
      },
      {
        title: "Unidade visual apesar das restrições de agrupamento da plataforma",
        body: "A VTEX impedia agrupar as amostras de produto em um único container. Compensei com estilização consistente — mesmo espaçamento, fundos, tipografia e estados de interação — para que a interface parecesse intencional, não fragmentada.",
      },
      {
        title: "Frete grátis impossível de ignorar",
        body: "Frete grátis é um dos maiores impulsionadores conhecidos de conclusão de checkout. Elevei seu destaque visual para que entregue seu reforço positivo exatamente onde o risco de abandono do carrinho é maior.",
      },
    ],
    mobileLabel: "05 · Problemas Específicos de Mobile",
    mobileHeading: "O mobile era outra fera",
    mobileBody:
      "Os problemas de desktop eram significativos, mas o mobile tinha sua própria camada de problemas que a análise de heatmap tornou impossível ignorar.",
    mobileIssues: [
      "Elementos transbordavam o grid e quebravam o layout em telas pequenas.",
      "A hierarquia de botões era plana — a CTA principal não se destacava visualmente.",
      "Sem indicadores de barra de rolagem, os usuários não percebiam que o conteúdo continuava abaixo da dobra.",
      "Os dados de heatmap mostravam volume significativo de toques no breadcrumb no topo — um elemento não interativo — indicando confusão sobre navegação e progresso.",
    ],
    learningsLabel: "07 · Aprendizados",
    learningsHeading: "O que levei disso",
    learningsBody1:
      "Domínio de plataforma é uma ferramenta de diagnóstico. Por já ter trabalhado dentro da VTEX, consegui nomear a causa raiz no instante em que vi a página — enquanto o cliente, compreensivelmente, não conseguia. Familiaridade profunda com as restrições de uma plataforma não é limitação; é o que permite agir rápido e certo sob pressão.",
    learningsBody2:
      "Igualmente importante: saber a correção não justifica entregá-la toda de uma vez. Sequenciar o trabalho por esforço e impacto — estabilizar, depois corrigir, depois otimizar — protegeu a confiança dos usuários que já conheciam o fluxo e permitiu medir cada mudança por seus próprios méritos, em vez de perdê-la dentro de um único redesign arriscado.",
    resultsLabel: "06 · Resultados",
    resultsHeading: "O teste venceu",
    resultsBody:
      "Com o checkout estável e acessível, o passo final foi um teste A/B controlado. A hipótese era específica: remover o texto promocional do primeiro passo e dar à CTA principal clara prioridade visual reduziria a carga cognitiva — e uma decisão de menor esforço converteria melhor. A variante superou a original nas três métricas principais.",
    results: [
      {
        num: "+7,10%",
        label: "Receita",
        desc: "Um checkout estável e mais limpo, com menos obstáculos no momento da decisão, gerou aumento mensurável na receita total durante a janela do teste.",
      },
      {
        num: "+5,71%",
        label: "Taxa de Conversão",
        desc: "Mais usuários que entraram no checkout concluíram a compra — reflexo direto da redução de carga cognitiva que a variante foi feita para entregar.",
      },
      {
        num: "+32%",
        label: "Taxa de Passagem",
        desc: "Muito mais usuários avançaram do primeiro passo para o seguinte — evidência de que limpar o ruído promocional e destacar a CTA moveu as pessoas adiante.",
      },
    ],
    resultsClosing:
      "Dentro das restrições da plataforma VTEX — que limita o grau de customização do checkout disponível aos designers — esses ganhos demonstram que melhorias de UX bem fundamentadas, apoiadas em dados reais de comportamento, movem o ponteiro mesmo quando não se controla totalmente o canvas.",
    navBack: "Todos os projetos",
    navNext: "Próximo case",
  },

  ES: {
    titleLine1: "El Rescate del",
    titleEm: "Checkout",
    subtitle:
      "El checkout de DermaClub generaba un volumen anormal de reportes de bugs de los clientes — perdiendo conversión en tiempo real. Apoyándome en mi experiencia práctica con VTEX, diagnostiqué la causa raíz de inmediato, secuencié las correcciones con una matriz de esfuerzo e impacto y validé el rediseño con una prueba A/B que elevó los ingresos un&nbsp;+7,1%.",
    metaRoleLabel: "Rol",
    metaPlatformLabel: "Plataforma",
    metaScopeLabel: "Alcance",
    metaScopeValue: "Investigación · UX · UI",
    resultsAria: "Resultados clave",
    resRevenue: "Ingresos",
    resConversion: "Tasa de Conversión",
    resCTR: "Tasa de Paso",
    problemLabel: "01 · El Problema",
    problemHeading: "Un problema urgente de conversión",
    problemBody1:
      "DermaClub es la marca de fidelización dermocosmética del Grupo L'Oréal en Brasil, funcionando sobre VTEX. Este proyecto no empezó como un rediseño — empezó como una emergencia. El cliente acudió a nosotros con un <strong>volumen anormalmente alto de reportes de bugs de los clientes</strong> en el checkout, y esos bugs afectaban la conversión directamente. El embudo lo confirmaba: los usuarios llegaban al checkout en buen número y luego abandonaban en masa antes de completar la compra. No era una queja estética — eran ingresos escapando por un embudo roto, y había que detenerlos rápido.",
    problemBody2:
      "En el momento en que abrí el checkout, dos problemas resaltaron. Primero, un exceso de <strong>contenido personalizado</strong> — botones, imágenes, tarjetas y elementos muy estilizados añadidos con el tiempo para respetar la guía de marca. Segundo, la propia guía de marca: combinaciones de colores de bajo contraste y más de un color de acento, elegidas para transmitir juventud y energía a un público más joven, pero trabajando en contra de la legibilidad en el peor momento posible.",
    problemBody3:
      "Como ya había trabajado con el checkout de VTEX, reconocí la causa raíz de inmediato — y el cliente no. En VTEX, el checkout está deliberadamente estandarizado: la buena práctica de la plataforma es personalizarlo lo menos posible, precisamente para que el flujo se mantenga fluido y estable. El volumen de contenido personalizado que la página debía renderizar era exactamente lo que la rompía — <em>CTAs que desaparecían o dejaban de responder, código filtrándose al frontend, el layout colapsando entre breakpoints</em>. Pude nombrar la causa a primera vista porque ya había vivido dentro de las restricciones de la plataforma.",
    contextAlt:
      "Pantalla del checkout de DermaClub que resalta el layout fragmentado identificado mediante análisis de heatmap",
    constraintsLabel: "02 · Restricciones",
    constraintsHeading: "Dos restricciones para sortear en el diseño",
    constraintsBody1:
      "Conocer la causa no es lo mismo que saber por dónde empezar. Dos restricciones difíciles moldearon cada decisión posterior — y ninguna dejaba espacio para el camino obvio.",
    constraintsBody2:
      "La primera era la <strong>confianza</strong>. Un rediseño completo era tentador, y erróneo. Arrancar un checkout que los usuarios ya conocen — aun defectuoso — rompe el modelo mental del que dependen para completar la compra, y arriesga cambiar un conjunto de problemas por otro. Los compradores habituales ya habían aprendido a navegar este flujo; el objetivo era quitar fricción sin obligarlos a reaprender dónde estaba cada cosa. Eso descartaba una reconstrucción desde cero y me empujaba hacia cambios puntuales y reversibles.",
    constraintsBody3:
      "La segunda era la <strong>marca</strong>. Las guías de DermaClub fallaban pruebas básicas de contraste — un fondo rosa combinado con texto blanco — pero las guías no eran mías para descartar. Mi trabajo no era pasar por encima de la marca; era hacerla accesible desde dentro de su propio sistema. En lugar de introducir un color ajeno, trabajé dentro de la paleta que la marca ya había definido, encontrando una combinación conforme que aun así se leía inconfundiblemente como DermaClub.",
    constraintsBody4:
      "Con esas dos restricciones fijadas, mapeé los problemas en una <strong>matriz de esfuerzo e impacto</strong> y secuencié el trabajo: primero detener la hemorragia, luego corregir marca y accesibilidad y, solo entonces, probar una hipótesis.",
    baLabel: "03 · Antes y Después",
    baHeading: "Lado a lado",
    badgeBefore: "Antes",
    badgeAfter: "Después",
    beforeAlt:
      "Checkout de DermaClub antes del rediseño: layout roto, bajo contraste, puntos de fidelidad y resumen del pedido dispersos en la parte inferior de la página",
    afterAlt:
      "Checkout de DermaClub después del rediseño: fondo claro, resumen del pedido reorganizado, cajas redondeadas con colores de contraste conformes a la marca, envío gratis destacado",
    beforeAria: "Problemas identificados",
    afterAria: "Mejoras entregadas",
    beforeIssues: [
      "Exceso de contenido personalizado (botones, tarjetas, imágenes) sobrecargando una plataforma pensada para mantenerse estándar",
      "CTAs que desaparecían o dejaban de responder; código filtrándose al frontend",
      "Layout roto entre breakpoints de escritorio y móvil",
      "Fondo rosa combinado con texto blanco — fallando toda prueba de contraste WCAG",
      "Más de un color de acento compitiendo por la atención en el momento de la decisión",
      "Texto promocional saturando el primer paso, restando foco a la acción principal",
    ],
    afterIssues: [
      "Vuelta al layout estándar de checkout de VTEX — eliminando los bugs en su origen",
      "Un tono azul oscuro extraído de la paleta de la marca, restaurando el contraste conforme a WCAG",
      "Texto promocional eliminado del primer paso para reducir la carga cognitiva",
      "CTA principal destacada y con clara prioridad visual",
      "Estilo consistente entre los ítems del carrito pese a las restricciones de agrupación de la plataforma",
      "Envío gratis en evidencia — una palanca de conversión comprobada",
    ],
    decisionsLabel: "04 · Decisiones de Diseño",
    decisionsHeading: "Cada cambio tenía una razón",
    decisionsIntro:
      "Secuencié el trabajo por esfuerzo e impacto: primero matar los bugs de la plataforma, luego corregir marca y accesibilidad y después reducir fricción — cada cambio defendible por datos o por la realidad de la plataforma, no por gusto.",
    decisions: [
      {
        title: "Vuelta al layout estándar de checkout de VTEX",
        body: "La acción de mayor impacto y menor esfuerzo — por eso fue primero. Revertir el checkout sobrepersonalizado al layout nativo de VTEX eliminó los bugs de renderizado en su origen: las CTAs reaparecieron y volvieron a responder, el código dejó de filtrarse al frontend y el layout se mantuvo entre breakpoints. Detuvo la hemorragia antes de que nada más tocara la página.",
      },
      {
        title: "Un azul oscuro de la propia paleta de la marca",
        body: "La marca combinaba un fondo rosa con texto blanco, fallando toda prueba de contraste WCAG. En lugar de pelear con la marca, extraje un tono azul oscuro ya definido en sus guías para combinar con el rosa — resolviendo accesibilidad e identidad a la vez, sin introducir un solo color nuevo.",
      },
      {
        title: "Quitar el texto promocional del primer paso",
        body: "El paso inicial del checkout estaba saturado de texto promocional compitiendo con la acción principal. Quitarlo redujo la carga cognitiva justo donde el usuario decide si avanza — reconocimiento en vez de memoria, diseño minimalista en vez de estímulo.",
      },
      {
        title: "Destacar la CTA principal",
        body: "Con el ruido eliminado, la acción de confirmar recibió una prioridad visual inconfundible. El usuario nunca debería tener que buscar el siguiente paso en el momento más decisivo del embudo.",
      },
      {
        title: "Divulgación progresiva de los puntos de fidelidad",
        body: "Centrar y minimizar el bloque de puntuación respeta un principio central de UX: mostrar la información cuando es contextualmente útil, no solo porque existe. Los datos de fidelidad durante la confirmación del pedido competían con la CTA por una atención que no deberían tener.",
      },
      {
        title: "Unidad visual pese a las restricciones de agrupación de la plataforma",
        body: "VTEX impedía agrupar las muestras de producto en un único contenedor. Lo compensé con un estilo consistente — mismo espaciado, fondos, tipografía y estados de interacción — para que la interfaz se sintiera intencional, no fragmentada.",
      },
      {
        title: "Envío gratis imposible de ignorar",
        body: "El envío gratis es uno de los mayores impulsores conocidos de finalización de checkout. Elevé su prominencia visual para que entregue su refuerzo positivo justo donde el riesgo de abandono del carrito es mayor.",
      },
    ],
    mobileLabel: "05 · Problemas Específicos de Móvil",
    mobileHeading: "El móvil era otra bestia",
    mobileBody:
      "Los problemas de escritorio eran significativos, pero el móvil tenía su propia capa de problemas que el análisis de heatmap hizo imposible ignorar.",
    mobileIssues: [
      "Los elementos desbordaban el grid y rompían el layout en pantallas pequeñas.",
      "La jerarquía de botones era plana — la CTA principal no se destacaba visualmente.",
      "Sin indicadores de barra de desplazamiento, los usuarios no percibían que el contenido seguía bajo el pliegue.",
      "Los datos de heatmap mostraban un volumen significativo de toques en el breadcrumb en la parte superior — un elemento no interactivo — indicando confusión sobre navegación y progreso.",
    ],
    learningsLabel: "07 · Aprendizajes",
    learningsHeading: "Lo que me llevé de esto",
    learningsBody1:
      "El dominio de la plataforma es una herramienta de diagnóstico. Por haber trabajado dentro de VTEX, pude nombrar la causa raíz en el instante en que vi la página — mientras el cliente, comprensiblemente, no podía. La familiaridad profunda con las restricciones de una plataforma no es una limitación; es lo que permite actuar rápido y bien bajo presión.",
    learningsBody2:
      "Igual de importante: conocer la solución no justifica entregarla toda de una vez. Secuenciar el trabajo por esfuerzo e impacto — estabilizar, luego corregir, luego optimizar — protegió la confianza de los usuarios que ya conocían el flujo y permitió medir cada cambio por sus propios méritos, en lugar de perderlo dentro de un único rediseño arriesgado.",
    resultsLabel: "06 · Resultados",
    resultsHeading: "La prueba ganó",
    resultsBody:
      "Con el checkout estable y accesible, el paso final fue una prueba A/B controlada. La hipótesis era específica: quitar el texto promocional del primer paso y dar a la CTA principal una clara prioridad visual reduciría la carga cognitiva — y una decisión de menor esfuerzo convertiría mejor. La variante superó a la original en las tres métricas principales.",
    results: [
      {
        num: "+7,10%",
        label: "Ingresos",
        desc: "Un checkout estable y más limpio, con menos obstáculos en el momento de la decisión, generó un aumento medible en los ingresos totales durante la ventana de la prueba.",
      },
      {
        num: "+5,71%",
        label: "Tasa de Conversión",
        desc: "Más usuarios que entraron al checkout completaron la compra — reflejo directo de la reducción de carga cognitiva que la variante fue creada para entregar.",
      },
      {
        num: "+32%",
        label: "Tasa de Paso",
        desc: "Muchos más usuarios avanzaron del primer paso al siguiente — evidencia de que limpiar el ruido promocional y destacar la CTA movió a las personas hacia adelante.",
      },
    ],
    resultsClosing:
      "Dentro de las restricciones de la plataforma VTEX — que limita el grado de personalización del checkout disponible para los diseñadores — estas ganancias demuestran que las mejoras de UX bien fundamentadas, apoyadas en datos reales de comportamiento, mueven la aguja incluso cuando no se controla del todo el lienzo.",
    navBack: "Todos los proyectos",
    navNext: "Siguiente caso",
  },

  DE: {
    titleLine1: "Die Rettung des",
    titleEm: "Checkouts",
    subtitle:
      "Der Checkout von DermaClub erzeugte ein ungewöhnlich hohes Volumen an Bug-Meldungen von Kund:innen — und verlor Conversions in Echtzeit. Gestützt auf meine praktische VTEX-Erfahrung diagnostizierte ich die Grundursache sofort, priorisierte die Korrekturen mit einer Aufwand-Wirkungs-Matrix und validierte das Redesign mit einem A/B-Test, der den Umsatz um&nbsp;+7,1% steigerte.",
    metaRoleLabel: "Rolle",
    metaPlatformLabel: "Plattform",
    metaScopeLabel: "Umfang",
    metaScopeValue: "Research · UX · UI",
    resultsAria: "Wichtigste Ergebnisse",
    resRevenue: "Umsatz",
    resConversion: "Conversion-Rate",
    resCTR: "Durchlaufrate",
    problemLabel: "01 · Das Problem",
    problemHeading: "Ein dringendes Conversion-Problem",
    problemBody1:
      "DermaClub ist die Dermokosmetik-Loyalty-Marke der L'Oréal-Gruppe in Brasilien und läuft auf VTEX. Dieses Projekt begann nicht als Redesign — es begann als Notfall. Der Kunde kam mit einem <strong>ungewöhnlich hohen Volumen an Bug-Meldungen von Kund:innen</strong> im Checkout auf uns zu, und diese Bugs trafen die Conversion direkt. Der Funnel bestätigte es: Nutzer:innen erreichten den Checkout in gesunder Zahl und brachen dann massenhaft ab, bevor sie den Kauf abschlossen. Das war keine kosmetische Beschwerde — es war Umsatz, der durch einen kaputten Funnel entwich, und er musste schnell gestoppt werden.",
    problemBody2:
      "In dem Moment, als ich den Checkout öffnete, stachen zwei Probleme hervor. Erstens ein Übermaß an <strong>individuellem Content</strong> — Buttons, Bilder, Cards und stark gestaltete Elemente, die im Lauf der Zeit hinzugefügt wurden, um den Markenrichtlinien zu entsprechen. Zweitens die Markenrichtlinien selbst: kontrastarme Farbkombinationen und mehr als eine Akzentfarbe, gewählt, um für ein jüngeres Publikum jung und energetisch zu wirken, aber der Lesbarkeit im schlechtesten Moment entgegenwirkend.",
    problemBody3:
      "Da ich zuvor bereits mit dem VTEX-Checkout gearbeitet hatte, erkannte ich die Grundursache sofort — der Kunde nicht. Bei VTEX ist der Checkout bewusst standardisiert: Best Practice der Plattform ist, ihn so wenig wie möglich anzupassen, gerade damit der Ablauf reibungslos und stabil bleibt. Das Volumen an individuellem Content, das die Seite rendern sollte, war genau das, was sie kaputt machte — <em>CTAs, die verschwanden oder nicht mehr reagierten, Code, der ins Frontend durchsickerte, ein Layout, das über Breakpoints hinweg zusammenbrach</em>. Ich konnte die Ursache auf den ersten Blick benennen, weil ich zuvor innerhalb der Grenzen der Plattform gearbeitet hatte.",
    contextAlt:
      "DermaClub-Checkout-Screen, der das durch Heatmap-Analyse identifizierte fragmentierte Layout hervorhebt",
    constraintsLabel: "02 · Rahmenbedingungen",
    constraintsHeading: "Zwei Rahmenbedingungen, um die herum zu gestalten war",
    constraintsBody1:
      "Die Ursache zu kennen ist nicht dasselbe wie zu wissen, wo man anfängt. Zwei harte Rahmenbedingungen prägten jede folgende Entscheidung — und keine ließ Raum für den naheliegenden Schritt.",
    constraintsBody2:
      "Die erste war <strong>Vertrauen</strong>. Ein komplettes Redesign war verlockend und falsch. Einen Checkout herauszureißen, den Nutzer:innen bereits kennen — auch einen fehlerhaften — zerstört das mentale Modell, auf das sie sich beim Kaufabschluss verlassen, und riskiert, eine Reihe von Problemen gegen eine andere einzutauschen. Stammkund:innen hatten gelernt, diesen Ablauf zu navigieren; das Ziel war, Reibung zu entfernen, ohne sie zu zwingen, neu zu lernen, wo alles liegt. Das schloss einen Neuaufbau von Grund auf aus und lenkte mich zu gezielten, reversiblen Änderungen.",
    constraintsBody3:
      "Die zweite war die <strong>Marke</strong>. Die Richtlinien von DermaClub bestanden grundlegende Kontrasttests nicht — ein rosa Hintergrund kombiniert mit weißem Text — aber die Richtlinien waren nicht meine, um sie zu verwerfen. Meine Aufgabe war nicht, die Marke zu übergehen; sie war, die Marke von innen heraus zugänglich zu machen. Statt eine fremde Farbe einzuführen, arbeitete ich innerhalb der Palette, die die Marke bereits definiert hatte, und fand eine konforme Kombination, die sich dennoch unverkennbar nach DermaClub las.",
    constraintsBody4:
      "Mit diesen beiden fixierten Rahmenbedingungen kartierte ich die Probleme in einer <strong>Aufwand-Wirkungs-Matrix</strong> und priorisierte die Arbeit: erst die Blutung stoppen, dann Marke und Barrierefreiheit korrigieren und erst dann eine Hypothese testen.",
    baLabel: "03 · Vorher & Nachher",
    baHeading: "Nebeneinander",
    badgeBefore: "Vorher",
    badgeAfter: "Nachher",
    beforeAlt:
      "DermaClub-Checkout vor dem Redesign: kaputtes Layout, geringer Kontrast, Treuepunkte und Bestellübersicht am Seitenende verstreut",
    afterAlt:
      "DermaClub-Checkout nach dem Redesign: heller Hintergrund, neu geordnete Bestellübersicht, abgerundete Boxen mit markenkonformen Kontrastfarben, kostenloser Versand hervorgehoben",
    beforeAria: "Identifizierte Probleme",
    afterAria: "Umgesetzte Verbesserungen",
    beforeIssues: [
      "Übermäßiger individueller Content (Buttons, Cards, Bilder), der eine auf Standard ausgelegte Plattform überlastet",
      "CTAs, die verschwanden oder nicht mehr reagierten; Code, der ins Frontend durchsickerte",
      "Kaputtes Layout über Desktop- und Mobile-Breakpoints hinweg",
      "Rosa Hintergrund mit weißem Text kombiniert — scheiterte an jedem WCAG-Kontrasttest",
      "Mehr als eine Akzentfarbe, die im Entscheidungsmoment um Aufmerksamkeit konkurrierte",
      "Werbetext überfüllte den ersten Schritt und zog den Fokus von der Hauptaktion ab",
    ],
    afterIssues: [
      "Zurück zum Standard-Checkout-Layout von VTEX — die Bugs an der Quelle beseitigt",
      "Ein dunkelblauer Ton aus der Markenpalette, der WCAG-konformen Kontrast wiederherstellt",
      "Werbetext aus dem ersten Schritt entfernt, um die kognitive Last zu senken",
      "Haupt-CTA hervorgehoben und mit klarer visueller Priorität versehen",
      "Konsistentes Styling über Warenkorb-Items hinweg trotz Gruppierungs-Beschränkungen der Plattform",
      "Kostenloser Versand prominent platziert — ein bewährter Conversion-Hebel",
    ],
    decisionsLabel: "04 · Design-Entscheidungen",
    decisionsHeading: "Jede Änderung hatte einen Grund",
    decisionsIntro:
      "Ich priorisierte die Arbeit nach Aufwand und Wirkung: zuerst die Plattform-Bugs beseitigen, dann Marke und Barrierefreiheit korrigieren, dann Reibung reduzieren — jede Änderung durch Daten oder die Realität der Plattform vertretbar, nicht durch Geschmack.",
    decisions: [
      {
        title: "Zurück zum Standard-Checkout-Layout von VTEX",
        body: "Der Schritt mit der größten Wirkung und dem geringsten Aufwand — deshalb kam er zuerst. Das Zurücksetzen des überangepassten Checkouts auf das native VTEX-Layout beseitigte die Rendering-Bugs an ihrer Quelle: CTAs erschienen wieder und blieben reaktionsfähig, Code sickerte nicht mehr ins Frontend, und das Layout hielt über Breakpoints hinweg. Es stoppte die Blutung, bevor irgendetwas anderes die Seite berührte.",
      },
      {
        title: "Ein Dunkelblau aus der eigenen Palette der Marke",
        body: "Die Marke kombinierte einen rosa Hintergrund mit weißem Text und scheiterte an jedem WCAG-Kontrasttest. Statt gegen die Marke zu kämpfen, entnahm ich einen bereits in ihren Richtlinien definierten dunkelblauen Ton, um ihn mit dem Rosa zu kombinieren — und löste Barrierefreiheit und Identität auf einmal, ohne eine einzige neue Farbe einzuführen.",
      },
      {
        title: "Werbetext aus dem ersten Schritt entfernen",
        body: "Der erste Checkout-Schritt war mit Werbetext überfüllt, der mit der Hauptaktion konkurrierte. Ihn zu entfernen senkte die kognitive Last genau dort, wo Nutzer:innen entscheiden, ob sie weitergehen — Wiedererkennen statt Erinnern, minimalistisches Design statt Reiz.",
      },
      {
        title: "Die Haupt-CTA hervorheben",
        body: "Mit beseitigtem Rauschen erhielt die Bestätigungsaktion unverkennbare visuelle Priorität. Nutzer:innen sollten im entscheidendsten Moment des Funnels nie nach dem nächsten Schritt suchen müssen.",
      },
      {
        title: "Progressive Offenlegung der Treuepunkte",
        body: "Den Punkte-Block zu zentrieren und zu minimieren respektiert ein zentrales UX-Prinzip: Information dann zeigen, wenn sie im Kontext nützlich ist, nicht nur, weil sie existiert. Treuedaten während der Bestellbestätigung konkurrierten mit der CTA um Aufmerksamkeit, die sie nicht haben sollten.",
      },
      {
        title: "Visuelle Einheit trotz Gruppierungs-Beschränkungen der Plattform",
        body: "VTEX verhinderte, die Produktproben in einem einzigen Container zu gruppieren. Ich glich das durch konsistentes Styling aus — gleiche Abstände, Hintergründe, Typografie und Interaktionszustände — damit sich die Oberfläche gewollt anfühlte, nicht fragmentiert.",
      },
      {
        title: "Kostenloser Versand unübersehbar gemacht",
        body: "Kostenloser Versand ist einer der stärksten bekannten Treiber für den Checkout-Abschluss. Ich erhöhte seine visuelle Prominenz, damit er seine positive Verstärkung genau dort liefert, wo das Risiko des Warenkorbabbruchs am höchsten ist.",
      },
    ],
    mobileLabel: "05 · Mobile-spezifische Probleme",
    mobileHeading: "Mobile war ein anderes Biest",
    mobileBody:
      "Die Desktop-Probleme waren erheblich, aber Mobile hatte seine eigene Ebene von Problemen, die die Heatmap-Analyse unmöglich zu ignorieren machte.",
    mobileIssues: [
      "Elemente liefen über das Grid hinaus und brachen das Layout auf kleinen Bildschirmen.",
      "Die Button-Hierarchie war flach — die Haupt-CTA hob sich visuell nicht ab.",
      "Ohne Scrollbalken-Hinweise bemerkten Nutzer:innen nicht, dass der Inhalt unter dem Fold weiterging.",
      "Heatmap-Daten zeigten erhebliches Tap-Volumen auf dem Breadcrumb oben — einem nicht interaktiven Element — was auf Verwirrung über Navigation und Fortschritt hindeutete.",
    ],
    learningsLabel: "07 · Erkenntnisse",
    learningsHeading: "Was ich daraus mitgenommen habe",
    learningsBody1:
      "Plattform-Expertise ist ein Diagnosewerkzeug. Weil ich zuvor innerhalb von VTEX gearbeitet hatte, konnte ich die Grundursache in dem Moment benennen, als ich die Seite sah — während der Kunde es verständlicherweise nicht konnte. Tiefe Vertrautheit mit den Grenzen einer Plattform ist keine Einschränkung; sie ist das, was schnelles und richtiges Handeln unter Druck ermöglicht.",
    learningsBody2:
      "Ebenso wichtig: die Lösung zu kennen rechtfertigt nicht, sie auf einmal auszuliefern. Die Arbeit nach Aufwand und Wirkung zu priorisieren — stabilisieren, dann korrigieren, dann optimieren — schützte das Vertrauen der Nutzer:innen, die den Ablauf bereits kannten, und ließ jede Änderung an ihren eigenen Maßstäben messen, statt sie in einem einzigen riskanten Redesign zu verlieren.",
    resultsLabel: "06 · Ergebnisse",
    resultsHeading: "Der Test gewann",
    resultsBody:
      "Mit stabilem und barrierefreiem Checkout war der letzte Schritt ein kontrollierter A/B-Test. Die Hypothese war konkret: Werbetext aus dem ersten Schritt zu entfernen und der Haupt-CTA klare visuelle Priorität zu geben, würde die kognitive Last senken — und eine aufwandsärmere Entscheidung würde besser konvertieren. Die Variante schlug das Original in allen drei Hauptmetriken.",
    results: [
      {
        num: "+7,10%",
        label: "Umsatz",
        desc: "Ein stabiler, aufgeräumterer Checkout mit weniger Hindernissen im Entscheidungsmoment führte im Testzeitraum zu einem messbaren Umsatzanstieg.",
      },
      {
        num: "+5,71%",
        label: "Conversion-Rate",
        desc: "Mehr Nutzer:innen, die den Checkout betraten, schlossen ihren Kauf ab — ein direkter Ausdruck der reduzierten kognitiven Last, die die Variante liefern sollte.",
      },
      {
        num: "+32%",
        label: "Durchlaufrate",
        desc: "Weit mehr Nutzer:innen gingen vom ersten Schritt zum nächsten über — ein Beleg dafür, dass das Entfernen des Werbe-Rauschens und das Hervorheben der CTA die Menschen voranbrachte.",
      },
    ],
    resultsClosing:
      "Innerhalb der Grenzen der VTEX-Plattform — die den Grad der für Designer verfügbaren Checkout-Anpassung begrenzt — zeigen diese Zuwächse, dass gut begründete UX-Verbesserungen, gestützt auf echte Verhaltensdaten, den Unterschied machen, selbst wenn man die Leinwand nicht vollständig kontrolliert.",
    navBack: "Alle Projekte",
    navNext: "Nächster Case",
  },
};

const t = computed(() => copy[lang.value] ?? copy.EN);
</script>

<style scoped>
/* ── TOKENS (local) ───────────────────────────────────────── */
.case-page {
  --accent: #f0185a;
  --accent-glow: rgba(240, 24, 90, 0.12);
  --accent-soft: rgba(240, 24, 90, 0.4);
  --font-display: "Clash Display", sans-serif;
  --font-body: "DM Sans", sans-serif;
  --ease-expo: cubic-bezier(0.16, 1, 0.3, 1);

  position: relative;
  overflow-x: hidden;
  font-family: var(--font-body);
  -webkit-font-smoothing: antialiased;
}

.theme-dark {
  --bg: #070711;
  --fg: #f0eff8;
  --fg-muted: #6b6a82;
  --fg-faint: #22213a;
  --border: rgba(255, 255, 255, 0.07);
  --ghost-border: rgba(255, 255, 255, 0.11);
  --alt-bg: #0c0c1a;
}
.theme-light {
  --bg: #f5f3ff;
  --fg: #0d0c1a;
  --fg-muted: #62607a;
  --fg-faint: #d2cfea;
  --border: rgba(0, 0, 0, 0.08);
  --ghost-border: rgba(13, 12, 26, 0.12);
  --alt-bg: #edeaf8;
}

/* ── BASE ────────────────────────────────────────────────── */
.case-page {
  background: var(--bg);
  color: var(--fg);
}

.grain {
  position: fixed;
  inset: 0;
  pointer-events: none;
  z-index: 1;
  opacity: 0.04;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
  background-size: 180px 180px;
}

.case-wrap {
  position: relative;
  z-index: 2;
  padding: 0 1.5rem;
}
.case-wrap--narrow {
  max-width: 680px;
}

/* ── HERO ────────────────────────────────────────────────── */
.case-hero {
  padding: clamp(7rem, 14vw, 11rem) 0 clamp(4rem, 7vw, 6rem);
  position: relative;
  z-index: 2;
}

.case-eyebrow {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.6rem;
  font-weight: 500;
  letter-spacing: 0.16em;
  text-transform: uppercase;
  color: var(--fg-muted);
  margin-bottom: 2rem;
}

.pf-dot {
  display: inline-block;
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: var(--accent);
  flex-shrink: 0;
  animation: pulse 2.5s ease-in-out infinite;
}

.case-title {
  font-family: var(--font-display);
  font-weight: 700;
  font-size: clamp(3.2rem, 10vw, 7rem);
  line-height: 0.87;
  letter-spacing: -0.025em;
  margin-bottom: 2rem;
}
.case-title em {
  font-style: italic;
  color: var(--accent);
}

.case-subtitle {
  font-size: clamp(0.875rem, 2vw, 1.05rem);
  font-weight: 300;
  line-height: 1.8;
  color: var(--fg-muted);
  max-width: 52ch;
  margin-bottom: 3rem;
}

.case-meta-row {
  display: flex;
  align-items: center;
  gap: 2rem;
  flex-wrap: wrap;
}
.case-meta-item {
  display: flex;
  flex-direction: column;
  gap: 0.3rem;
}
.case-meta-label {
  font-size: 0.5rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--fg-muted);
}
.case-meta-value {
  font-family: var(--font-display);
  font-size: 0.8rem;
  font-weight: 600;
  letter-spacing: 0.04em;
  color: var(--fg);
}
.case-meta-divider {
  width: 1px;
  height: 32px;
  background: var(--border);
}

/* ── RESULTS BAND ────────────────────────────────────────── */
.results-band {
  position: relative;
  z-index: 2;
  border-top: 1px solid var(--border);
  border-bottom: 1px solid var(--border);
  padding: 2.5rem 0;
  overflow: hidden;
}
.results-band::before {
  content: "";
  position: absolute;
  inset: 0;
  background: var(--accent-glow);
}
.results-grid {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 3rem;
  flex-wrap: wrap;
}
.result-item {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.4rem;
}
.result-num {
  font-family: var(--font-display);
  font-size: clamp(2rem, 5vw, 3rem);
  font-weight: 700;
  color: var(--accent);
  line-height: 1;
  will-change: transform;
  display: inline-block;
}
.result-label {
  font-size: 0.55rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--fg-muted);
}
.result-divider {
  width: 1px;
  height: 48px;
  background: var(--border);
}

/* ── SECTIONS ────────────────────────────────────────────── */
.case-section {
  padding: clamp(4rem, 8vw, 7rem) 0;
  position: relative;
  z-index: 2;
}
.case-section--alt {
  background: var(--alt-bg);
}
.case-section--alt::before {
  content: "";
  position: absolute;
  inset: 0;
  border-top: 1px solid var(--border);
  border-bottom: 1px solid var(--border);
  pointer-events: none;
}

.section-label {
  font-size: 0.55rem;
  font-weight: 500;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--accent);
  margin-bottom: 1.25rem;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}
.section-label::before {
  content: "";
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background: var(--accent);
  animation: pulse 2.5s ease-in-out infinite;
}

.section-heading {
  font-family: var(--font-display);
  font-weight: 600;
  font-size: clamp(1.4rem, 4vw, 2.4rem);
  line-height: 1.15;
  letter-spacing: -0.01em;
  margin-bottom: 1.5rem;
}

.section-body {
  font-size: clamp(0.875rem, 2vw, 0.975rem);
  font-weight: 300;
  line-height: 1.85;
  color: var(--fg-muted);
  max-width: 62ch;
  margin-bottom: 1.25rem;
}
.section-body:last-child {
  margin-bottom: 0;
}
.section-body strong {
  color: var(--fg);
  font-weight: 600;
}
.section-body em {
  font-style: italic;
  color: var(--accent);
}

/* ── CONTEXT GRID ────────────────────────────────────────── */
.context-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 3rem;
  align-items: center;
}
@media (min-width: 1024px) {
  .context-grid {
    grid-template-columns: 1fr 1fr;
    gap: 5rem;
  }
}

.context-text .section-body {
  max-width: 56ch;
}

.context-image-wrap {
  overflow: hidden;
  background: var(--fg-faint);
  border: 1px solid var(--border);
  border-radius: 12px;
  aspect-ratio: 4 / 3;
}
.context-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: top;
  display: block;
  transition: transform 0.6s var(--ease-expo);
}
.context-image-wrap:hover .context-image {
  transform: scale(1.02);
}

/* ── BEFORE / AFTER ──────────────────────────────────────── */
.ba-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2px;
  margin-top: 2.5rem;
  border: 1px solid var(--border);
}
@media (max-width: 768px) {
  .ba-grid {
    grid-template-columns: 1fr;
  }
}

.ba-col {
  display: flex;
  flex-direction: column;
}
.ba-col:first-child {
  border-right: 1px solid var(--border);
}

@media (max-width: 768px) {
  .ba-col:first-child {
    border-right: none;
    border-bottom: 1px solid var(--border);
  }
}

.ba-badge {
  display: inline-block;
  font-size: 0.5rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  padding: 0.5rem 1rem;
  border-bottom: 1px solid var(--border);
}
.ba-badge--before {
  color: var(--fg-muted);
  background: transparent;
}
.ba-badge--after {
  color: #fff;
  background: var(--accent);
  border-color: var(--accent);
}

.ba-image-wrap {
  overflow: hidden;
  background: var(--fg-faint);
  border-bottom: 1px solid var(--border);
  aspect-ratio: 3 / 4;
}
.ba-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: top;
  display: block;
  transition: transform 0.6s var(--ease-expo);
}
.ba-image-wrap:hover .ba-image {
  transform: scale(1.02);
}

.ba-issues {
  list-style: none;
  padding: 1.5rem;
  margin: 0;
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}
.ba-issues li {
  font-size: 0.8rem;
  font-weight: 300;
  line-height: 1.6;
  color: var(--fg-muted);
  padding-left: 1rem;
  position: relative;
}
.ba-issues li::before {
  content: "—";
  position: absolute;
  left: 0;
  color: var(--fg-muted);
}
.ba-issues--after li {
  color: var(--fg);
}
.ba-issues--after li::before {
  color: var(--accent);
  content: "+";
}

/* ── DECISIONS GRID ──────────────────────────────────────── */
.decisions-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 1px;
  margin-top: 2.5rem;
  border: 1px solid var(--border);
}

.decision-card {
  padding: 2rem 1.75rem;
  border-right: 1px solid var(--border);
  border-bottom: 1px solid var(--border);
  transition: background 0.2s ease;
}
.decision-card:hover {
  background: var(--accent-glow);
}

.decision-num {
  font-family: var(--font-display);
  font-size: 0.7rem;
  font-weight: 700;
  color: var(--accent);
  letter-spacing: 0.08em;
  margin-bottom: 1rem;
}

.decision-title {
  font-family: var(--font-display);
  font-size: 0.95rem;
  font-weight: 600;
  line-height: 1.3;
  margin-bottom: 0.75rem;
  color: var(--fg);
}

.decision-body {
  font-size: 0.8rem;
  font-weight: 300;
  line-height: 1.75;
  color: var(--fg-muted);
}

/* ── MOBILE ISSUES ───────────────────────────────────────── */
.mobile-issues-list {
  display: flex;
  flex-direction: column;
  gap: 1rem;
  margin-top: 2rem;
}
.mobile-issue {
  display: flex;
  gap: 1rem;
  align-items: flex-start;
}
.mobile-issue-marker {
  flex-shrink: 0;
  width: 1px;
  height: 1.4rem;
  background: var(--accent);
  margin-top: 0.1rem;
}
.mobile-issue p {
  font-size: 0.875rem;
  font-weight: 300;
  line-height: 1.75;
  color: var(--fg-muted);
  margin: 0;
}

/* ── RESULTS CARDS ───────────────────────────────────────── */
.results-cards {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1px;
  margin-top: 2.5rem;
  border: 1px solid var(--border);
}
@media (max-width: 640px) {
  .results-cards {
    grid-template-columns: 1fr;
  }
}

.result-card {
  padding: 2rem 1.5rem;
  border-right: 1px solid var(--border);
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}
.result-card:last-child {
  border-right: none;
}

.result-card-num {
  font-family: var(--font-display);
  font-size: clamp(1.8rem, 4vw, 2.5rem);
  font-weight: 700;
  color: var(--accent);
  line-height: 1;
  will-change: transform;
  display: inline-block;
}
.result-card-label {
  font-size: 0.55rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--fg);
}
.result-card-desc {
  font-size: 0.78rem;
  font-weight: 300;
  line-height: 1.7;
  color: var(--fg-muted);
  margin: 0.5rem 0 0;
}

/* ── LEARNINGS INSIDE LEFT COL ───────────────────────────── */
.col-learnings {
  margin-top: 3rem;
  padding-top: 3rem;
  border-top: 1px solid var(--border);
}

/* ── TWO-COLUMN CONTENT LAYOUT ──────────────────────────── */
.case-two-col {
  display: grid;
  grid-template-columns: 1fr;
  gap: 3rem;
}

@media (min-width: 1024px) {
  .case-two-col {
    grid-template-columns: 1fr 1fr;
    gap: 0;
    align-items: start;
  }

  .two-col-left {
    padding-right: 4rem;
    border-right: 1px solid var(--border);
  }

  .two-col-right {
    padding-left: 4rem;
  }

  .two-col-right .results-cards {
    grid-template-columns: 1fr;
  }

  .two-col-right .result-card {
    border-right: none;
    border-bottom: 1px solid var(--border);
  }

  .two-col-right .result-card:last-child {
    border-bottom: none;
  }
}

/* ── FOOTER NAV ──────────────────────────────────────────── */
.case-footer-nav {
  border-top: 1px solid var(--border);
  padding: 2.5rem 0;
  position: relative;
  z-index: 2;
}
.case-footer-nav-inner {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.case-nav-link {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  font-size: 0.6rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--fg-muted);
  text-decoration: none;
  transition: color 0.2s ease;
}
.case-nav-link:hover {
  color: var(--accent);
}
.case-nav-arr {
  font-size: 1rem;
  transition: transform 0.2s ease;
}
.case-nav-link--back:hover .case-nav-arr {
  transform: translateX(-4px);
}
.case-nav-link--next:hover .case-nav-arr {
  transform: translateX(4px);
}

/* ── ANIMATIONS ──────────────────────────────────────────── */
@keyframes pulse {
  0%,
  100% {
    opacity: 1;
    transform: scale(1);
  }
  50% {
    opacity: 0.4;
    transform: scale(0.8);
  }
}

/* ── RESPONSIVE ──────────────────────────────────────────── */
@media (min-width: 640px) {
  .case-wrap {
    padding: 0 3rem;
  }
}
@media (min-width: 1024px) {
  .case-wrap {
    padding: 0 7rem;
  }
}
@media (min-width: 1400px) {
  .case-wrap {
    padding: 0 10rem;
  }
}

@media (max-width: 640px) {
  .case-meta-row {
    gap: 1rem;
  }
  .case-meta-divider {
    display: none;
  }
  .results-grid {
    gap: 1.5rem;
  }
  .result-divider {
    display: none;
  }
  .decisions-grid {
    grid-template-columns: 1fr;
  }
}
</style>
