<template>
  <div :class="['it-root', `theme-${theme}`]">
    <div class="it-grain" aria-hidden="true" />
    <div class="it-glow" aria-hidden="true" />

    <NavBar v-model:lang="lang" v-model:theme="theme" />

    <!-- BACK -->
    <button class="it-back" @click="$router.push('/projetos')">
      ← {{ t.back }}
    </button>

    <!-- HERO -->
    <section class="it-hero">
      <div class="it-hero-inner">
        <div class="it-eyebrow">
          <span class="it-pulse" aria-hidden="true" />
          {{ t.tag }}
        </div>
        <div
          class="it-hero-context-chip"
          @click="$router.push('/projetos/rodobens')"
        >
          {{ t.contextChip }} ↗
        </div>
        <h1 class="it-title" v-html="t.title" />
        <p class="it-subtitle">{{ t.subtitle }}</p>
        <div class="it-roles">
          <span v-for="r in t.roles" :key="r" class="it-role">{{ r }}</span>
        </div>
      </div>
      <!-- Decorative iteration counter -->
      <div class="it-hero-deco" aria-hidden="true">
        <span class="it-deco-label">{{ t.decoLabel }}</span>
        <div class="it-deco-track">
          <div
            v-for="n in 5"
            :key="n"
            :class="['it-deco-step', { 'it-deco-step--active': n <= 3 }]"
          >
            <span class="it-deco-n">v{{ n }}.0</span>
          </div>
        </div>
      </div>
    </section>

    <!-- 01 THE CONSTRAINT -->
    <section class="it-section" ref="s1">
      <div class="it-rule">
        <span class="it-rule-label">01 — {{ t.constraintLabel }}</span>
        <span class="it-rule-line" />
      </div>
      <div class="it-two-col">
        <div class="it-col-main">
          <h2 class="it-sh" v-html="t.constraintTitle" />
          <div class="it-body-stack">
            <p class="it-body" v-for="p in t.constraintBody" :key="p">
              {{ p }}
            </p>
          </div>
        </div>
        <div class="it-col-aside">
          <div class="it-stat-card">
            <span class="it-stat-n">7</span>
            <span class="it-stat-l">{{ t.stat1 }}</span>
          </div>
          <div class="it-stat-card">
            <span class="it-stat-n">129</span>
            <span class="it-stat-l">{{ t.stat2 }}</span>
          </div>
          <div class="it-stat-card">
            <span class="it-stat-n">8</span>
            <span class="it-stat-l">{{ t.stat3 }}</span>
          </div>
        </div>
      </div>
    </section>

    <!-- 02 THE MIRROR -->
    <section class="it-section it-section--dark">
      <div class="it-rule">
        <span class="it-rule-label">02 — {{ t.mirrorLabel }}</span>
        <span class="it-rule-line" />
      </div>
      <h2 class="it-sh" v-html="t.mirrorTitle" />
      <p class="it-body it-body--wide">{{ t.mirrorBody }}</p>
      <div class="it-compare-grid">
        <figure class="it-compare-fig">
          <div class="it-compare-badge it-compare-badge--legacy">
            {{ t.legacy }}
          </div>
          <img
            :src="legacyImg"
            alt="Legacy system — blocking modal for add vehicle"
            class="it-compare-img it-zoomable"
            loading="lazy"
            @click="
              openLightbox(
                legacyImg,
                t.legacyCap,
                'Legacy system — blocking modal for add vehicle',
              )
            "
          />
          <figcaption class="it-compare-cap">{{ t.legacyCap }}</figcaption>
        </figure>
        <figure class="it-compare-fig">
          <div class="it-compare-badge it-compare-badge--wire">
            {{ t.wireframe }}
          </div>
          <img
            :src="wireframeImg"
            alt="Wireframe pre-iteration — mirroring legacy structure"
            class="it-compare-img it-zoomable"
            loading="lazy"
            @click="
              openLightbox(
                wireframeImg,
                t.wireframeCap,
                'Wireframe pre-iteration — mirroring legacy structure',
              )
            "
          />
          <figcaption class="it-compare-cap">{{ t.wireframeCap }}</figcaption>
        </figure>
      </div>
      <div class="it-insight-bar">
        <span class="it-insight-icon" aria-hidden="true">↺</span>
        <p class="it-insight-text">{{ t.mirrorInsight }}</p>
      </div>
    </section>

    <!-- 03 THE ROOM -->
    <section class="it-section">
      <div class="it-rule">
        <span class="it-rule-label">03 — {{ t.roomLabel }}</span>
        <span class="it-rule-line" />
      </div>
      <div class="it-room-layout">
        <div class="it-room-text">
          <h2 class="it-sh" v-html="t.roomTitle" />
          <div class="it-body-stack">
            <p class="it-body" v-for="p in t.roomBody" :key="p" v-html="p"></p>
          </div>
        </div>
        <div class="it-room-people">
          <p class="it-room-label">{{ t.roomWho }}</p>
          <div class="it-people-grid">
            <div
              v-for="person in t.people"
              :key="person.role"
              class="it-person"
            >
              <span class="it-person-dot" aria-hidden="true" />
              <span class="it-person-role">{{ person.role }}</span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 04 THREE DECISIONS -->
    <section class="it-section">
      <div class="it-rule">
        <span class="it-rule-label">04 — {{ t.decisionsLabel }}</span>
        <span class="it-rule-line" />
      </div>
      <h2 class="it-sh" v-html="t.decisionsTitle" />

      <!-- Decision 1 -->
      <div class="it-decision">
        <div class="it-decision-header">
          <span class="it-decision-num">01</span>
          <h3 class="it-decision-title">{{ t.d1Title }}</h3>
        </div>
        <div class="it-decision-body">
          <div class="it-decision-text">
            <p class="it-body" v-for="p in t.d1Body" :key="p">{{ p }}</p>
          </div>
          <div class="it-decision-visual">
            <div
              class="it-gif-frame it-zoomable"
              @click="
                openLightbox(
                  addVehicleGif,
                  t.d1GifCap,
                  'Add vehicle side panel',
                )
              "
            >
              <div class="it-gif-bar" aria-hidden="true">
                <span class="it-gd it-gd--r" /><span
                  class="it-gd it-gd--y"
                /><span class="it-gd it-gd--g" />
              </div>
              <img
                :src="addVehicleGif"
                alt="GIF: empty state to add vehicle side panel"
                class="it-gif-img"
                loading="lazy"
              />
            </div>
            <p class="it-gif-cap">{{ t.d1GifCap }}</p>
          </div>
        </div>
      </div>

      <!-- Divider -->
      <div class="it-decision-divider" aria-hidden="true" />

      <!-- Decision 2 -->
      <div class="it-decision">
        <div class="it-decision-header">
          <span class="it-decision-num">02</span>
          <h3 class="it-decision-title">{{ t.d2Title }}</h3>
        </div>
        <!-- Text + badges: single column, contained width -->
        <div class="it-d2-intro">
          <div class="it-body-stack">
            <p class="it-body" v-for="p in t.d2Body" :key="p">{{ p }}</p>
          </div>
          <div class="it-badges-demo">
            <span
              v-for="badge in t.badges"
              :key="badge.label"
              :class="['it-badge', `it-badge--${badge.type}`]"
              >{{ badge.label }}</span
            >
          </div>
          <p class="it-instances">{{ t.instances }}</p>
        </div>

        <!-- Full-bleed horizontal carousel -->
        <div class="it-carousel-wrap">
          <div class="it-carousel-viewport">
            <div
              class="it-carousel-track"
              :style="{ transform: `translateX(-${d2Idx * 100}%)` }"
            >
              <figure
                v-for="(slide, i) in d2Slides"
                :key="i"
                class="it-carousel-slide"
              >
                <div
                  :class="[
                    'it-compare-badge',
                    `it-compare-badge--${slide.badge}`,
                  ]"
                >
                  {{ slide.badgeLabel }}
                </div>
                <img
                  :src="slide.src"
                  :alt="slide.alt"
                  class="it-carousel-img it-zoomable"
                  loading="lazy"
                  @click="openLightbox(slide.src, slide.caption, slide.alt)"
                />
              </figure>
            </div>
          </div>

          <button
            class="it-carousel-arrow it-carousel-arrow--prev"
            @click="d2Idx = Math.max(0, d2Idx - 1)"
            :disabled="d2Idx === 0"
            aria-label="Previous"
          >
            ←
          </button>
          <button
            class="it-carousel-arrow it-carousel-arrow--next"
            @click="d2Idx = Math.min(d2Slides.length - 1, d2Idx + 1)"
            :disabled="d2Idx === d2Slides.length - 1"
            aria-label="Next"
          >
            →
          </button>
        </div>

        <!-- Caption + dots below carousel, back inside normal padding -->
        <div class="it-carousel-footer">
          <p class="it-carousel-cap">{{ d2Slides[d2Idx].caption }}</p>
          <div class="it-carousel-dots">
            <button
              v-for="(_, i) in d2Slides"
              :key="i"
              :class="[
                'it-carousel-dot',
                { 'it-carousel-dot--active': i === d2Idx },
              ]"
              @click="d2Idx = i"
              :aria-label="`Slide ${i + 1}`"
            />
          </div>
        </div>
      </div>

      <!-- Divider -->
      <div class="it-decision-divider" aria-hidden="true" />

      <!-- Decision 3 -->
      <div class="it-decision">
        <div class="it-decision-header">
          <span class="it-decision-num">03</span>
          <h3 class="it-decision-title">{{ t.d3Title }}</h3>
        </div>
        <div class="it-body-stack it-d3-text">
          <p class="it-body" v-for="p in t.d3Body" :key="p" v-html="p"></p>
        </div>
        <div class="it-compare-grid it-d3-grid">
          <figure class="it-compare-fig">
            <div class="it-compare-badge it-compare-badge--wire">
              {{ t.wireframe }}
            </div>
            <img
              :src="wireframeCardsImg"
              alt="Wireframe — simulation cards pre-iteration"
              class="it-compare-img it-zoomable"
              loading="lazy"
              @click="
                openLightbox(
                  wireframeCardsImg,
                  t.d3WireCap,
                  'Wireframe — simulation cards pre-iteration',
                )
              "
            />
            <figcaption class="it-compare-cap">{{ t.d3WireCap }}</figcaption>
          </figure>
          <figure class="it-compare-fig">
            <div class="it-compare-badge it-compare-badge--final">FINAL</div>
            <img
              :src="simulationAnalysisImg"
              alt="Simulation — analysis status screen"
              class="it-compare-img it-zoomable"
              loading="lazy"
              @click="
                openLightbox(
                  simulationAnalysisImg,
                  t.d3GifCap,
                  'Simulation — analysis status screen',
                )
              "
            />
            <figcaption class="it-compare-cap">{{ t.d3GifCap }}</figcaption>
          </figure>
        </div>
      </div>
    </section>

    <!-- 05 WHAT WE LEARNED -->
    <section class="it-section it-section--dark">
      <div class="it-rule">
        <span class="it-rule-label">05 — {{ t.learnedLabel }}</span>
        <span class="it-rule-line" />
      </div>
      <div class="it-learned-layout">
        <div class="it-learned-text">
          <h2 class="it-sh" v-html="t.learnedTitle" />
          <div class="it-body-stack">
            <p class="it-body" v-for="p in t.learnedBody" :key="p">{{ p }}</p>
          </div>
        </div>
        <div class="it-metric-card">
          <span class="it-metric-n">72%</span>
          <span class="it-metric-l">{{ t.metricLabel }}</span>
          <span class="it-metric-sub">{{ t.metricSub }}</span>
        </div>
      </div>
      <div class="it-kpis-grid">
        <div v-for="kpi in t.kpis" :key="kpi.num" class="it-kpi">
          <b class="it-kpi-n">{{ kpi.num }}</b>
          <span class="it-kpi-l">{{ kpi.label }}</span>
        </div>
      </div>
      <button class="it-kpis-btn" @click="$router.push('/projetos/rodobens')">
        {{ t.kpisBtn }}
      </button>
    </section>

    <!-- 06 PRINCIPLE -->
    <section class="it-section it-section--principle">
      <div class="it-rule">
        <span class="it-rule-label">06 — {{ t.principleLabel }}</span>
        <span class="it-rule-line" />
      </div>
      <blockquote class="it-quote">
        <span class="it-quote-mark" aria-hidden="true">"</span>
        <p class="it-quote-text">{{ t.quote }}</p>
      </blockquote>
    </section>

    <!-- FOOTER NAV -->
    <footer class="it-footer">
      <div class="it-footer-inner">
        <button
          class="it-footer-btn"
          @click="$router.push('/projetos/rodobens')"
        >
          ← {{ t.footerRodobens }}
        </button>
        <button
          class="it-footer-btn it-footer-btn--accent"
          @click="$router.push('/projetos')"
        >
          {{ t.footerProjects }} →
        </button>
      </div>
      <p class="it-footer-copy">© 2026 Tayná Schultz</p>
    </footer>

    <!-- LIGHTBOX -->
    <Teleport to="body">
      <div
        v-if="lb.open"
        class="lb-backdrop"
        @click.self="closeLightbox"
        role="dialog"
        aria-modal="true"
      >
        <button class="lb-close" @click="closeLightbox" aria-label="Close">
          ✕
        </button>
        <figure class="lb-figure">
          <img :src="lb.src" :alt="lb.alt" class="lb-img" />
          <figcaption v-if="lb.caption" class="lb-caption">
            {{ lb.caption }}
          </figcaption>
        </figure>
      </div>
    </Teleport>
  </div>
</template>

<script setup>
import { ref, computed } from "vue";
import NavBar from "./NavBar.vue";

// — swap simulationGif for final .gif when ready (Decision 3 placeholder)
import legacyImg from "../src/assets/iteration/adicionar veículo legado.png";
import wireframeImg from "../src/assets/iteration/wireframe pre iteration add vehicle.png";
import addVehicleGif from "../src/assets/iteration/Única - Rodobens (Entrega) -   add veiculo gif.gif";
import legacyCardsImg from "../src/assets/iteration/Legado antes cards simulação.png";
import wireframeCardsImg from "../src/assets/iteration/Desktop - Precificação wireframe.png";
import wireframeCardsImg2 from "../src/assets/iteration/Desktop - Precificação wireframe 2.png";
import simulationGif from "../src/assets/iteration/Única - Rodobens (Entrega) -   Simulacao GIF.gif";
import simulationAnalysisImg from "../src/assets/iteration/Simulador - Simulação em análise de crivo.png";

const props = defineProps({
  lang: { type: String, default: "EN" },
  theme: { type: String, default: "dark" },
});

const lang = ref(props.lang);
const theme = ref(props.theme);

const copy = {
  EN: {
    back: "Back to portfolio",
    tag: "Process · Iteration · Systems Design · 2026",
    contextChip: "Part of the Rodobens · Única Platform project",
    title:
      "The <em>Iteration Process</em> Behind<br><em>a Complex ERP journey.</em>",
    subtitle:
      "How intentionally mirroring a broken legacy system unlocked the design decisions we couldn't have reached any other way.",
    roles: [
      "UX Research",
      "Interaction Design",
      "Facilitation",
      "Systems Thinking",
    ],
    decoLabel: "iterations",

    // Section 01
    constraintLabel: "The Constraint",
    constraintTitle: "Seven months.<br><em>129 journeys. 8 to ship.</em>",
    constraintBody: [
      "The simulation journey was the heart of the finantial system — simulations were actions users performed daily, tied directly to revenue. It was also the most complained-about screen in the legacy platform: color-coded cards with no consistent logic, simulations that couldn't be deleted, and tax rates that couldn't be adjusted case by case.",
      "We knew it needed to change. What we didn't know yet was exactly how — because the simulation engine ran on financial and credit business rules we were still learning. Vehicle financing, interest rates, banking product tiers — this was new territory for the design team, and the timeline didn't allow for deep exploratory research on every journey.",
      "So we ran one exploratory session with key users before wireframing this flow, then designed it anyway — copying the legacy structure almost exactly, applying the new design system on top, and using the presentation meeting itself as the iteration space.",
      "Looking back, I'd describe it less as a compromise and more as a pressure valve: a way to move forward without pretending we had answers we didn't have yet.",
    ],
    stat1: "months",
    stat2: "journeys mapped",
    stat3: "delivered end-to-end",

    // Section 02
    mirrorLabel: "The Mirror",
    mirrorTitle: "Same structure.<br><em>Different frame.</em>",
    mirrorBody:
      "In the legacy system, the journey up to adding a adding a vehicle meant dealing with a blocking modal that took over the entire screen. It interrupted the flow, removed all page context, and forced the user to complete the action before returning to anything else. The accordions would force the users to look for informations. With not much time available to iterate, our wireframe at this stage changed accordion logic but reproduced that modal almost exactly — same structure, same field arrangement, same logic. The design system made it look cleaner. But the interaction problem was still there, sitting quietly inside a prettier frame. That was the point. We needed everyone in the room to see the same thing at the same time.",
    legacy: "LEGACY",
    legacyCap: "Legacy system — blocking modal, 5+ undefined color states",
    wireframe: "WIREFRAME",
    wireframeCap:
      "Pre-iteration wireframe — same structure, design system applied on top",
    mirrorInsight:
      "First solution pushed us to deliver a screen that looked like the legacy, that's why we used the presentation meeting as the iteration space",

    // Section 03
    roomLabel: "The Room",
    roomTitle: "The session that<br><em>changed the  and the flow.</em>",
    roomBody: [
      "We understood how pop ups made users feel <strong>interrupted</strong>, how informations felt like being <strong>hidden</strong> by accordions and how the color system was <strong>overwhelming</strong>. Also understood how difficult the system was for <strong>begginers</strong>. So we iterated, <strong>benchmarked solutions</strong> out there, replaced pop ups for <strong>sidebars</strong>, made informations more <strong>accessible</strong> and reduced the color system to a more <strong>semantic</strong> one. Added icons and instructions to make the system more <strong>intuitive</strong> for new users.",
    ],
    roomWho: "Who was in the room",
    people: [
      { role: "Rodobens Business & Operations" },
      { role: "Key users — simulation journey" },
      { role: "NV8 Development team" },
      { role: "NV8 Design team" },
      { role: "Business stakeholders" },
    ],

    // Section 04
    decisionsLabel: "Three Decisions",
    decisionsTitle: "What changed,<br><em>and why.</em>",
    d1Title: "From blocking modal to side panel",
    d1Body: [
      "During the iteration session, the designer team challenged me to rethink the modal from scratch — not just fix it, but question whether a modal was the right pattern at all. We worked through it together and landed on a persistent side panel: the user could add a vehicle without losing the page context they were already working in.",
      "That decision didn't stay local. We ended up <strong>standardizing</strong> the side panel across the entire system. Modals became reserved for <strong>critical moments only</strong> — deletions, approvals, journey handoffs. Everything that needed to coexist with the current page became a panel.",
    ],
    d1GifCap:
      "Empty state → CTA click → side panel opens without losing page context",
    d2Title: "From color chaos to semantic status",
    d2Body: [
      "The legacy system used over 5 colors to communicate card states, with no documented rationale and no consistency across the platform. The design team went back to the user interviews, identified the states that actually drove decisions in the workflow, and reduced the system to 4 semantic badges.",
    ],
    badges: [
      { label: "Aprovado", type: "approved" },
      { label: "Pendente", type: "pending" },
      { label: "Recusada", type: "rejected" },
      { label: "Em Revisão", type: "review" },
    ],
    instances: "847 instances across the system. One consistent language.",
    d2BeforeCap:
      "Legacy system — one of the most complained screens: cards with no color logic, icons and actions confusing, inability to delete or archive simulations.",
    d2WireCap:
      "Wireframe — first solution solved the visual noise but kept the same structure. Add vehicle was still separated from the simulation cards, icons were still confusing for begginers and still didnt solve the amount of cards generated that couldnt be deleted or archived.",
    d2AfterCap:
      "Final design — system allows users to run several simulations with different taxes and choose to save according to clients needs and without necessity of a full customer register.Icons were reduced to  print and archive, simulations can run multiple vehicles and be deleted or archived, and the color system was reduced to a more semantic one.",
    d3Title: "From flat cards to a simulation flow",
    d3Body: [
      "The wireframe showed <strong>flat</strong>, equal-weight cards with <strong>no visual relationship</strong> between simulations. In practice, a simulation card often derives from a previous one — a counter-proposal, a revised rate, a different banking product. The wireframe was initially <strong>separating</strong> the journey screens to previous and <strong>after</strong> simulation, taking the <strong>control</strong> from the user to choose and interact as much as he wishes. That relationship was invisible in the first version. After iteraction, simulations can be done inumerously, then picked for counter proposal, then revised with new rates or products, and finally archived if not needed anymore.",
      "The final design introduced a persistent calculator panel on the right side of the screen, hierarchical CTAs per card state, progress bars showing time-to-expiry, and archive capability — finally letting users manage their simulation history without losing it.",
    ],
    d3WireCap: "Wireframe — flat simulation cards, pre-iteration structure",
    d3GifCap:
      "Final simulation screen — calculator panel, hierarchical CTAs, progress tracking",

    // Section 05
    learnedLabel: "What We Learned",
    learnedTitle: "The copy was<br><em>the research method.</em>",
    learnedBody: [
      "The instinct to copy the legacy wasn't avoidance — it was a research method we didn't have a better name for at the time. By showing everyone exactly what existed, cleaned up but structurally unchanged, we created a shared reference point that freed the room to disagree with it. The problems became visible to everyone at the same time, which made the iteration feel collaborative rather than top-down.",
      "Would we have tested each journey separately with users? Yes — and we would have caught things earlier. The timeline didn't allow it. What it did allow was treating every touchpoint, including presentations, as a design surface.",
    ],
    metricLabel: "perceived efficiency gain",
    metricSub: "on the full simulation journey vs. legacy",

    // Section 06
    principleLabel: "Principle",
    quote:
      "Copying isn't giving up. Sometimes, showing exactly what exists is the fastest way to see what needs to change.",

    kpisBtn: "Read the full Rodobens case study →",
    kpis: [
      { num: "42%", label: "perceived efficiency gain on the registration journey" },
      { num: "72%", label: "perceived efficiency gain on the simulation journey" },
      { num: "92%", label: "reduction in registration time with native integration vs. previous manual copy" },
      { num: "25%", label: "drop in proposals returned due to data entry errors" },
      { num: "311", label: "users responded to the perceived time NPS" },
    ],

    // Footer
    footerRodobens: "Back to Rodobens case",
    footerProjects: "All projects",
  },

  PT: {
    back: "Voltar ao portfólio",
    tag: "Processo · Iteração · Design de Sistemas · 2024",
    contextChip: "Parte do projeto Rodobens · Plataforma Única",
    title:
      "O <em>Processo de Iteração</em> por Trás<br><em>de uma Tela ERP Complexa.</em>",
    subtitle:
      "Como espelhar intencionalmente um sistema legado quebrado desbloqueou decisões de design que não conseguiríamos chegar de outra forma.",
    roles: [
      "UX Research",
      "Interaction Design",
      "Facilitação",
      "Pensamento Sistêmico",
    ],
    decoLabel: "iterações",
    constraintLabel: "A Restrição",
    constraintTitle: "Sete meses.<br><em>129 jornadas. 8 para entregar.</em>",
    constraintBody: [
      "A tela de simulação era o coração do sistema — a ação que os usuários realizavam diariamente, diretamente ligada à receita. Era também a tela mais reclamada no sistema legado: cards com códigos de cores sem lógica consistente, simulações que não podiam ser excluídas, e taxas que não podiam ser ajustadas caso a caso.",
      "Sabíamos que precisava mudar. O que ainda não sabíamos era exatamente como — porque o motor de simulação rodava em regras de negócio financeiras e de crédito que ainda estávamos aprendendo. Financiamento de veículos, taxas de juros, produtos bancários — território novo para o time de design.",
      "Então rodamos uma sessão exploratória com usuários-chave antes de wireframing, e desenhamos assim mesmo — copiando a estrutura legada quase exatamente, aplicando o novo design system por cima, e usando a reunião de apresentação como espaço de iteração.",
      "Olhando para trás, eu descreveria menos como um compromisso e mais como uma válvula de pressão: uma forma de avançar sem fingir que tínhamos respostas que ainda não tínhamos.",
    ],
    stat1: "meses",
    stat2: "jornadas mapeadas",
    stat3: "entregues end-to-end",
    mirrorLabel: "O Espelho",
    mirrorTitle: "Mesma estrutura.<br><em>Moldura diferente.</em>",
    mirrorBody:
      "No sistema legado, adicionar um veículo significava lidar com um modal bloqueante que dominava toda a tela. Interrompia o fluxo, removia todo o contexto da página e forçava o usuário a completar a ação antes de voltar a qualquer outra coisa. Nosso wireframe nessa etapa reproduzia esse modal quase exatamente — mesma estrutura, mesmo arranjo de campos, mesma lógica. O design system deixou mais limpo. Mas o problema de interação ainda estava lá, sentado quieto dentro de um frame mais bonito. Esse era o ponto. Precisávamos que todos na sala vissem a mesma coisa ao mesmo tempo.",
    legacy: "LEGADO",
    legacyCap:
      "Sistema legado — modal bloqueante, 5+ estados de cor indefinidos",
    wireframe: "WIREFRAME",
    wireframeCap:
      "Wireframe pré-iteração — mesma estrutura, design system aplicado por cima",
    mirrorInsight:
      "O ruído visual sumiu, o que deixou os problemas de interação mais altos.",
    roomLabel: "A Reunião",
    roomTitle: "A sessão que<br><em>mudou a tela.</em>",
    roomBody: [
      "Quando chegamos na tela de simulação, algo útil aconteceu — as pessoas começaram a reagir à estrutura, não só ao visual. A interface mais limpa tornou os problemas de interação mais visíveis, não menos. De repente surgiram perguntas sobre por que certas coisas funcionavam como funcionavam, e se precisavam mesmo.",
      "É o tipo de conversa que não dá para fabricar — só dá para criar condições para ela. Agendamos uma sessão de iteração separada só para esse fluxo. Sem mais espelhamento. Hora de redesenhar de verdade.",
    ],
    roomWho: "Quem estava na sala",
    people: [
      { role: "Negócio e Operações — Rodobens" },
      { role: "Usuários-chave — jornada de simulação" },
      { role: "Time de Desenvolvimento NV8" },
      { role: "Time de Design NV8" },
      { role: "Stakeholders de Negócio" },
    ],
    decisionsLabel: "Três Decisões",
    decisionsTitle: "O que mudou,<br><em>e por quê.</em>",
    d1Title: "De modal bloqueante a painel lateral",
    d1Body: [
      "Durante a sessão de iteração, o líder de design me desafiou a repensar o modal do zero — não só corrigir, mas questionar se um modal era o padrão certo. Trabalhamos juntos e chegamos a um painel lateral persistente: o usuário podia adicionar um veículo sem perder o contexto da página em que estava trabalhando.",
      "Essa decisão não ficou local. Acabamos padronizando o painel lateral em todo o sistema. Modais ficaram reservados para momentos críticos — exclusões, aprovações, passagens de jornada. Tudo que precisasse coexistir com a página atual virou painel.",
    ],
    d1GifCap:
      "Empty state → clique no CTA → painel lateral abre sem perder contexto da página",
    d2Title: "De caos de cores a status semântico",
    d2Body: [
      "O sistema legado usava mais de 5 cores para comunicar estados dos cards, sem racional documentado e sem consistência. O time de design voltou às entrevistas com usuários, identificou os estados que realmente guiavam decisões no fluxo, e reduziu o sistema a 4 badges semânticos.",
    ],
    badges: [
      { label: "Aprovado", type: "approved" },
      { label: "Pendente", type: "pending" },
      { label: "Recusada", type: "rejected" },
      { label: "Em Revisão", type: "review" },
    ],
    instances: "847 instâncias no sistema. Uma linguagem consistente.",
    d2BeforeCap: "Sistema legado — 5+ estados de cor sem lógica consistente",
    d2WireCap:
      "Wireframe — estrutura de cards carregada do legado, design system aplicado por cima",
    d2AfterCap:
      "Design final — 4 badges semânticos, uma linguagem consistente em 847 instâncias",
    d3Title: "De cards planos a um fluxo de simulação",
    d3Body: [
      "O wireframe mostrava cards planos, de peso visual igual, sem relação entre simulações. Na prática, um card de simulação frequentemente deriva de outro — uma contraproposta, uma taxa revisada, um produto bancário diferente. Essa relação estava invisível na primeira versão.",
      "O design final introduziu um painel de calculadora persistente no lado direito da tela, CTAs hierárquicos por estado do card, barras de progresso mostrando tempo de expiração e capacidade de arquivar — finalmente permitindo que usuários gerenciassem o histórico sem perder nada.",
    ],
    d3WireCap: "Wireframe — cards de simulação planos, estrutura pré-iteração",
    d3GifCap:
      "Tela final de simulação — painel de calculadora, CTAs hierárquicos, rastreamento de progresso",
    learnedLabel: "O Que Aprendemos",
    learnedTitle: "A cópia era<br><em>o método de pesquisa.</em>",
    learnedBody: [
      "O instinto de copiar o legado não era fuga — era um método de pesquisa para o qual ainda não tínhamos nome. Ao mostrar a todos exatamente o que existia, limpo mas estruturalmente inalterado, criamos um ponto de referência compartilhado que liberou a sala para discordar. Os problemas ficaram visíveis para todos ao mesmo tempo, o que fez a iteração parecer colaborativa, não top-down.",
      "Teríamos testado cada jornada separadamente com usuários? Sim — e teríamos detectado coisas mais cedo. O timeline não permitiu. O que permitiu foi tratar cada touchpoint, incluindo apresentações, como uma superfície de design.",
    ],
    metricLabel: "ganho de eficiência percebida",
    metricSub: "na jornada de simulação completa vs. legado",
    principleLabel: "Princípio",
    quote:
      "Copiar não é desistir. Às vezes, mostrar exatamente o que existe é o caminho mais rápido para ver o que precisa mudar.",
    kpisBtn: "Ler o case completo do Rodobens →",
    kpis: [
      { num: "42%", label: "ganho percebido de eficiência na jornada de cadastro" },
      { num: "72%", label: "ganho percebido de eficiência na jornada de simulação" },
      { num: "92%", label: "redução no tempo de cadastro com integração nativa vs. cópia manual anterior" },
      { num: "25%", label: "queda nas propostas devolvidas por erro de digitação" },
      { num: "311", label: "usuários responderam ao NPS de percepção de tempo" },
    ],
    footerRodobens: "Voltar ao case Rodobens",
    footerProjects: "Todos os projetos",
  },

  ES: {
    back: "Volver al portafolio",
    tag: "Proceso · Iteración · Diseño de Sistemas · 2024",
    contextChip: "Parte del proyecto Rodobens · Plataforma Única",
    title:
      "El <em>Proceso de Iteración</em> Detrás<br><em>de una Pantalla ERP Compleja.</em>",
    subtitle:
      "Cómo reflejar intencionalmente un sistema legacy roto desbloqueó decisiones de diseño que no habríamos alcanzado de otra forma.",
    roles: [
      "UX Research",
      "Interaction Design",
      "Facilitación",
      "Pensamiento Sistémico",
    ],
    decoLabel: "iteraciones",
    constraintLabel: "La Restricción",
    constraintTitle: "Siete meses.<br><em>129 journeys. 8 para entregar.</em>",
    constraintBody: [
      "La pantalla de simulación era el corazón del sistema — la acción que los usuarios realizaban diariamente, directamente ligada a los ingresos. También era la pantalla más criticada en el sistema legacy: cards con códigos de color sin lógica consistente, simulaciones que no podían eliminarse, y tasas que no podían ajustarse caso a caso.",
      "Sabíamos que necesitaba cambiar. Lo que aún no sabíamos era exactamente cómo — porque el motor de simulación corría sobre reglas de negocio financieras y crediticias que aún estábamos aprendiendo.",
      "Así que realizamos una sesión exploratoria con usuarios clave antes del wireframing, y diseñamos de todas formas — copiando la estructura legacy casi exactamente, aplicando el nuevo design system encima, y usando la reunión de presentación como espacio de iteración.",
      "Mirando atrás, lo describiría menos como un compromiso y más como una válvula de presión: una forma de avanzar sin fingir que teníamos respuestas que aún no teníamos.",
    ],
    stat1: "meses",
    stat2: "journeys mapeados",
    stat3: "entregados end-to-end",
    mirrorLabel: "El Espejo",
    mirrorTitle: "Misma estructura.<br><em>Marco diferente.</em>",
    mirrorBody:
      "En el sistema legacy, agregar un vehículo significaba lidiar con un modal bloqueante que dominaba toda la pantalla. Interrumpía el flujo, eliminaba todo el contexto de la página y obligaba al usuario a completar la acción antes de volver a cualquier otra cosa. Nuestro wireframe reproducía ese modal casi exactamente. El design system lo hizo más limpio. Pero el problema de interacción seguía ahí. Ese era el punto. Necesitábamos que todos en la sala vieran lo mismo al mismo tiempo.",
    legacy: "LEGACY",
    legacyCap:
      "Sistema legacy — modal bloqueante, 5+ estados de color sin definir",
    wireframe: "WIREFRAME",
    wireframeCap:
      "Wireframe pre-iteración — misma estructura, design system aplicado encima",
    mirrorInsight:
      "El ruido visual desapareció, lo que hizo que los problemas de interacción fueran más notorios.",
    roomLabel: "La Reunión",
    roomTitle: "La sesión que<br><em>cambió la pantalla.</em>",
    roomBody: [
      "Cuando llegamos a la pantalla de simulación, algo útil ocurrió — las personas comenzaron a reaccionar a la estructura, no solo al visual. La interfaz más limpia hizo los problemas de interacción más visibles, no menos.",
      "Es el tipo de conversación que no se puede fabricar — solo se pueden crear condiciones para ella. Agendamos una sesión de iteración separada solo para este flujo. Sin más espejismo. Tiempo de rediseñar de verdad.",
    ],
    roomWho: "Quién estaba en la sala",
    people: [
      { role: "Negocio y Operaciones — Rodobens" },
      { role: "Usuarios clave — journey de simulación" },
      { role: "Equipo de Desarrollo NV8" },
      { role: "Equipo de Diseño NV8" },
      { role: "Stakeholders de Negocio" },
    ],
    decisionsLabel: "Tres Decisiones",
    decisionsTitle: "Qué cambió,<br><em>y por qué.</em>",
    d1Title: "Del modal bloqueante al panel lateral",
    d1Body: [
      "Durante la sesión de iteración, el líder de diseño me desafió a repensar el modal desde cero — no solo corregirlo, sino cuestionar si un modal era el patrón correcto. Trabajamos juntos y llegamos a un panel lateral persistente: el usuario podía agregar un vehículo sin perder el contexto de la página.",
      "Esa decisión no quedó local. Terminamos estandarizando el panel lateral en todo el sistema. Los modales quedaron reservados para momentos críticos — eliminaciones, aprobaciones, transiciones de journey.",
    ],
    d1GifCap:
      "Estado vacío → clic en CTA → panel lateral abre sin perder contexto de página",
    d2Title: "Del caos de colores al estado semántico",
    d2Body: [
      "El sistema legacy usaba más de 5 colores para comunicar estados de cards, sin racionale documentado. El equipo de diseño volvió a las entrevistas, identificó los estados que realmente guiaban decisiones en el flujo, y redujo el sistema a 4 badges semánticos.",
    ],
    badges: [
      { label: "Aprobado", type: "approved" },
      { label: "Pendiente", type: "pending" },
      { label: "Rechazada", type: "rejected" },
      { label: "En Revisión", type: "review" },
    ],
    instances: "847 instancias en el sistema. Un lenguaje consistente.",
    d2BeforeCap: "Sistema legacy — 5+ estados de color sin lógica consistente",
    d2WireCap:
      "Wireframe — estructura de cards copiada del legacy, design system aplicado encima",
    d2AfterCap:
      "Diseño final — 4 badges semánticos, un lenguaje consistente en 847 instancias",
    d3Title: "De cards planos a un flujo de simulación",
    d3Body: [
      "El wireframe mostraba cards planos, de igual peso visual, sin relación entre simulaciones. En la práctica, un card de simulación frecuentemente deriva de otro — una contrapropuesta, una tasa revisada, un producto bancario diferente.",
      "El diseño final introdujo un panel de calculadora persistente, CTAs jerárquicos por estado del card, barras de progreso de expiración y capacidad de archivar.",
    ],
    d3WireCap:
      "Wireframe — cards planos de simulación, estructura pre-iteración",
    d3GifCap:
      "Pantalla final de simulación — panel de calculadora, CTAs jerárquicos, seguimiento de progreso",
    learnedLabel: "Lo Que Aprendimos",
    learnedTitle: "La copia era<br><em>el método de investigación.</em>",
    learnedBody: [
      "El instinto de copiar el legacy no era evasión — era un método de investigación para el que aún no teníamos nombre. Al mostrar a todos exactamente lo que existía, limpio pero estructuralmente sin cambios, creamos un punto de referencia compartido que liberó la sala para disentir.",
      "¿Habríamos probado cada journey por separado con usuarios? Sí. El cronograma no lo permitió. Lo que sí permitió fue tratar cada touchpoint, incluyendo presentaciones, como una superficie de diseño.",
    ],
    metricLabel: "ganancia de eficiencia percibida",
    metricSub: "en el journey de simulación completo vs. legacy",
    principleLabel: "Principio",
    quote:
      "Copiar no es rendirse. A veces, mostrar exactamente lo que existe es el camino más rápido para ver lo que necesita cambiar.",
    kpisBtn: "Leer el case completo de Rodobens →",
    kpis: [
      { num: "42%", label: "ganancia de eficiencia percibida en el journey de registro" },
      { num: "72%", label: "ganancia de eficiencia percibida en el journey de simulación" },
      { num: "92%", label: "reducción en el tiempo de registro con integración nativa vs. copia manual anterior" },
      { num: "25%", label: "caída en propuestas devueltas por error de digitación" },
      { num: "311", label: "usuarios respondieron al NPS de percepción de tiempo" },
    ],
    footerRodobens: "Volver al case Rodobens",
    footerProjects: "Todos los proyectos",
  },

  DE: {
    back: "Zurück zum Portfolio",
    tag: "Prozess · Iteration · Systemdesign · 2024",
    contextChip: "Teil des Rodobens · Única-Plattform-Projekts",
    title:
      "Der <em>Iterationsprozess</em> hinter<br><em>einem komplexen ERP-Bildschirm.</em>",
    subtitle:
      "Wie das bewusste Spiegeln eines defekten Legacy-Systems Designentscheidungen ermöglichte, die wir auf keinem anderen Weg erreicht hätten.",
    roles: [
      "UX Research",
      "Interaction Design",
      "Facilitation",
      "Systemdenken",
    ],
    decoLabel: "Iterationen",
    constraintLabel: "Die Einschränkung",
    constraintTitle: "Sieben Monate.<br><em>129 Journeys. 8 zu liefern.</em>",
    constraintBody: [
      "Der Simulationsbildschirm war das Herzstück des Systems — die Aktion, die Nutzer täglich durchführten und die direkt mit dem Umsatz verbunden war. Er war auch der meistbeanstandete Bildschirm im Legacy-System: farbkodierte Cards ohne konsistente Logik, Simulationen, die nicht gelöscht werden konnten, und Zinssätze, die sich nicht fallweise anpassen ließen.",
      "Wir wussten, dass sich das ändern musste. Was wir noch nicht wussten, war genau wie — denn die Simulation lief auf Finanz- und Kreditregeln, die wir noch lernten.",
      "Also führten wir eine Erkundungssession mit Key-Usern durch, bevor wir wireframeten, und designten trotzdem — fast exakt die Legacy-Struktur kopierend, das neue Design System darüberliegend, und die Präsentationssitzung selbst als Iterationsraum nutzend.",
      "Rückblickend würde ich es weniger als Kompromiss und mehr als Sicherheitsventil beschreiben: ein Weg, voranzukommen, ohne so zu tun, als hätten wir Antworten, die wir noch nicht hatten.",
    ],
    stat1: "Monate",
    stat2: "Journeys kartiert",
    stat3: "end-to-end geliefert",
    mirrorLabel: "Der Spiegel",
    mirrorTitle: "Gleiche Struktur.<br><em>Anderer Rahmen.</em>",
    mirrorBody:
      "Im Legacy-System bedeutete das Hinzufügen eines Fahrzeugs, mit einem blockierenden Modal umzugehen, das den gesamten Bildschirm übernahm. Es unterbrach den Fluss und erzwang die Aktion, bevor man zu irgendetwas anderem zurückkehren konnte. Unser Wireframe reproduzierte dieses Modal fast exakt. Das Design System machte es sauberer. Aber das Interaktionsproblem war noch da. Das war der Punkt. Wir brauchten alle im Raum, um zur gleichen Zeit dasselbe zu sehen.",
    legacy: "LEGACY",
    legacyCap:
      "Legacy-System — blockierendes Modal, 5+ undefinierte Farbzustände",
    wireframe: "WIREFRAME",
    wireframeCap:
      "Wireframe vor der Iteration — gleiche Struktur, Design System obenauf",
    mirrorInsight:
      "Das visuelle Rauschen verschwand, was die Interaktionsprobleme lauter machte.",
    roomLabel: "Der Raum",
    roomTitle: "Die Sitzung, die<br><em>den Bildschirm veränderte.</em>",
    roomBody: [
      "Als wir zum Simulationsbildschirm kamen, passierte etwas Nützliches — die Menschen begannen auf die Struktur zu reagieren, nicht nur auf das Visuelle. Die sauberere Oberfläche machte die Interaktionsprobleme sichtbarer, nicht weniger sichtbar.",
      "Das ist die Art von Gespräch, die man nicht erzwingen kann — man kann nur Bedingungen dafür schaffen. Wir vereinbarten eine separate Iterationssitzung nur für diesen Flow. Kein Spiegeln mehr. Zeit für echtes Redesign.",
    ],
    roomWho: "Wer im Raum war",
    people: [
      { role: "Business & Operations — Rodobens" },
      { role: "Key-User — Simulations-Journey" },
      { role: "Entwicklungsteam NV8" },
      { role: "Designteam NV8" },
      { role: "Business-Stakeholder" },
    ],
    decisionsLabel: "Drei Entscheidungen",
    decisionsTitle: "Was sich änderte,<br><em>und warum.</em>",
    d1Title: "Vom blockierenden Modal zum Seitenpanel",
    d1Body: [
      "Während der Iterationssitzung forderte mich der Lead Designer heraus, das Modal von Grund auf neu zu denken — es nicht nur zu reparieren, sondern zu hinterfragen, ob ein Modal überhaupt das richtige Muster war. Wir arbeiteten gemeinsam daran und landeten bei einem persistenten Seitenpanel.",
      "Diese Entscheidung blieb nicht lokal. Wir standardisierten das Seitenpanel im gesamten System. Modals wurden für kritische Momente reserviert — Löschungen, Genehmigungen, Journey-Übergänge.",
    ],
    d1GifCap:
      "Leerer Zustand → CTA-Klick → Seitenpanel öffnet ohne Seitenkontext zu verlieren",
    d2Title: "Vom Farbchaos zum semantischen Status",
    d2Body: [
      "Das Legacy-System verwendete über 5 Farben zur Kommunikation von Card-Zuständen ohne dokumentierte Begründung. Das Designteam ging zurück zu den User-Interviews, identifizierte die Zustände, die tatsächlich Entscheidungen im Workflow antrieben, und reduzierte das System auf 4 semantische Badges.",
    ],
    badges: [
      { label: "Genehmigt", type: "approved" },
      { label: "Ausstehend", type: "pending" },
      { label: "Abgelehnt", type: "rejected" },
      { label: "In Prüfung", type: "review" },
    ],
    instances: "847 Instanzen im System. Eine konsistente Sprache.",
    d2BeforeCap: "Legacy-System — 5+ Farbzustände ohne konsistente Logik",
    d2WireCap:
      "Wireframe — Card-Struktur aus dem Legacy übernommen, Design System obenauf",
    d2AfterCap:
      "Finales Design — 4 semantische Badges, eine konsistente Sprache über 847 Instanzen",
    d3Title: "Von flachen Cards zu einem Simulations-Flow",
    d3Body: [
      "Der Wireframe zeigte flache Cards mit gleichem visuellem Gewicht und ohne Beziehung zwischen Simulationen. In der Praxis leitet sich eine Simulations-Card oft von einer anderen ab — ein Gegenangebot, ein überarbeiteter Zinssatz, ein anderes Bankprodukt.",
      "Das finale Design führte ein persistentes Rechner-Panel auf der rechten Seite, hierarchische CTAs nach Card-Zustand, Fortschrittsbalken für Ablaufzeiten und Archivierungsmöglichkeit ein.",
    ],
    d3WireCap:
      "Wireframe — flache Simulations-Cards, Struktur vor der Iteration",
    d3GifCap:
      "Finaler Simulationsbildschirm — Rechner-Panel, hierarchische CTAs, Fortschrittsverfolgung",
    learnedLabel: "Was Wir Lernten",
    learnedTitle: "Die Kopie war<br><em>die Forschungsmethode.</em>",
    learnedBody: [
      "Der Instinkt, das Legacy zu kopieren, war kein Ausweichen — es war eine Forschungsmethode, für die wir damals noch keinen besseren Namen hatten. Indem wir allen genau das zeigten, was existierte, aufgeräumt aber strukturell unverändert, schufen wir einen gemeinsamen Referenzpunkt, der den Raum befreite, zu widersprechen.",
      "Hätten wir jede Journey separat mit Nutzern getestet? Ja. Der Zeitplan ließ es nicht zu. Was er erlaubte, war, jeden Touchpoint, einschließlich Präsentationen, als Designoberfläche zu behandeln.",
    ],
    metricLabel: "wahrgenommener Effizienzgewinn",
    metricSub: "auf der vollständigen Simulations-Journey vs. Legacy",
    principleLabel: "Prinzip",
    quote:
      "Kopieren bedeutet nicht aufzugeben. Manchmal ist das Zeigen von genau dem, was existiert, der schnellste Weg zu sehen, was sich ändern muss.",
    kpisBtn: "Vollständigen Rodobens Case lesen →",
    kpis: [
      { num: "42%", label: "wahrgenommener Effizienzgewinn auf der Registrierungs-Journey" },
      { num: "72%", label: "wahrgenommener Effizienzgewinn auf der Simulations-Journey" },
      { num: "92%", label: "Reduzierung der Registrierungszeit mit nativer Integration vs. manuellem Kopieren" },
      { num: "25%", label: "Rückgang bei zurückgesandten Angeboten durch Dateneingabefehler" },
      { num: "311", label: "Nutzer antworteten auf die wahrgenommene Zeit-NPS" },
    ],
    footerRodobens: "Zurück zum Rodobens Case",
    footerProjects: "Alle Projekte",
  },
};

const t = computed(() => copy[lang.value] || copy.EN);

// ── Lightbox ──────────────────────────────────────────────────
const lb = ref({ open: false, src: "", caption: "", alt: "" });

function openLightbox(src, caption, alt = "") {
  lb.value = { open: true, src, caption, alt };
  document.addEventListener("keydown", onLbKey);
}
function closeLightbox() {
  lb.value.open = false;
  document.removeEventListener("keydown", onLbKey);
}
function onLbKey(e) {
  if (e.key === "Escape") closeLightbox();
}

// ── Decision 2 carousel ───────────────────────────────────────
const d2Idx = ref(0);
const d2Slides = computed(() => [
  {
    src: legacyCardsImg,
    badge: "legacy",
    badgeLabel: t.value.legacy,
    caption: t.value.d2BeforeCap,
    alt: "Legacy simulation cards — inconsistent color states",
  },
  {
    src: wireframeCardsImg2,
    badge: "wire",
    badgeLabel: t.value.wireframe,
    caption: t.value.d2WireCap,
    alt: "Wireframe — card design pre-iteration",
  },
  {
    src: simulationGif,
    badge: "final",
    badgeLabel: "FINAL",
    caption: t.value.d2AfterCap,
    alt: "Final simulation screen — semantic status badges",
  },
]);
</script>

<style scoped>
@import url("https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500&display=swap");

/* ─── TOKENS ─── */
.it-root {
  --accent: #f0185a;
  --accent-glow: rgba(240, 24, 90, 0.12);
  --bg: #070711;
  --bg-alt: #0d0c1a;
  --fg: #f0eff8;
  --fg-muted: #6b6a82;
  --border: rgba(255, 255, 255, 0.07);
  --ease-expo: cubic-bezier(0.16, 1, 0.3, 1);
  --font-display: "Clash Display", sans-serif;
  --font-body: "DM Sans", sans-serif;

  background: var(--bg);
  color: var(--fg);
  font-family: var(--font-body);
  min-height: 100vh;
  position: relative;
  overflow-x: hidden;
}
.it-root.theme-light {
  --bg: #f5f3ff;
  --bg-alt: #edeaff;
  --fg: #0d0c1a;
  --border: rgba(0, 0, 0, 0.08);
}

/* ─── GRAIN + GLOW ─── */
.it-grain {
  position: fixed;
  inset: 0;
  z-index: 0;
  pointer-events: none;
  opacity: 0.035;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");
  background-size: 180px;
}
.it-glow {
  position: fixed;
  top: -18%;
  right: -12%;
  width: 75vw;
  height: 75vw;
  max-width: 900px;
  max-height: 900px;
  background: radial-gradient(
    ellipse at 65% 25%,
    rgba(240, 24, 90, 0.1) 0%,
    transparent 62%
  );
  pointer-events: none;
  z-index: 0;
}

/* ─── BACK ─── */
.it-back {
  position: relative;
  z-index: 10;
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  margin: 7rem 0 0 1.5rem;
  background: none;
  border: none;
  cursor: pointer;
  font-family: var(--font-body);
  font-size: 0.75rem;
  font-weight: 500;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--fg-muted);
  transition: color 0.2s;
}
.it-back:hover {
  color: var(--accent);
}
@media (min-width: 1024px) {
  .it-back {
    margin-left: 7rem;
  }
}

/* ─── HERO ─── */
.it-hero {
  position: relative;
  z-index: 1;
  padding: 4rem 1.5rem 6rem;
  display: flex;
  flex-direction: column;
  gap: 3rem;
}
@media (min-width: 1024px) {
  .it-hero {
    padding: 4rem 7rem 8rem;
    flex-direction: row;
    align-items: flex-start;
    justify-content: space-between;
  }
}

.it-hero-inner {
  max-width: 680px;
}

.it-eyebrow {
  display: flex;
  align-items: center;
  gap: 0.6rem;
  font-size: 0.6rem;
  font-weight: 500;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--accent);
  margin-bottom: 1rem;
}
.it-pulse {
  display: inline-block;
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: var(--accent);
  animation: pulse-dot 2.4s ease-in-out infinite;
}
@keyframes pulse-dot {
  0%,
  100% {
    box-shadow: 0 0 0 0 rgba(240, 24, 90, 0.6);
  }
  50% {
    box-shadow: 0 0 0 6px rgba(240, 24, 90, 0);
  }
}

.it-hero-context-chip {
  display: inline-flex;
  align-items: center;
  padding: 0.35rem 0.75rem;
  border: 1px solid var(--border);
  font-size: 0.65rem;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--fg-muted);
  cursor: pointer;
  transition:
    border-color 0.2s,
    color 0.2s;
  margin-bottom: 1.5rem;
}
.it-hero-context-chip:hover {
  border-color: var(--accent);
  color: var(--accent);
}

.it-title {
  font-family: var(--font-display);
  font-size: clamp(2.4rem, 6vw, 4.5rem);
  font-weight: 600;
  line-height: 1.05;
  letter-spacing: -0.02em;
  margin: 0 0 1.25rem;
}
.it-subtitle {
  font-size: clamp(0.95rem, 1.5vw, 1.1rem);
  line-height: 1.7;
  color: var(--fg-muted);
  max-width: 560px;
  margin: 0 0 2rem;
}

.it-roles {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}
.it-role {
  font-size: 0.6rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  padding: 0.35rem 0.75rem;
  border: 1px solid var(--border);
  color: var(--fg-muted);
}

/* Decorative iteration tracker */
.it-hero-deco {
  display: none;
}
@media (min-width: 1024px) {
  .it-hero-deco {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    gap: 1rem;
    padding-top: 6rem;
  }
}
.it-deco-label {
  font-size: 0.55rem;
  letter-spacing: 0.2em;
  text-transform: uppercase;
  color: var(--fg-muted);
}
.it-deco-track {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  align-items: flex-end;
}
.it-deco-step {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  opacity: 0.25;
  transition: opacity 0.3s;
}
.it-deco-step--active {
  opacity: 1;
}
.it-deco-n {
  font-family: var(--font-display);
  font-size: 0.7rem;
  font-weight: 600;
  letter-spacing: 0.1em;
  color: var(--fg-muted);
}
.it-deco-step--active .it-deco-n {
  color: var(--accent);
}

/* ─── SECTIONS ─── */
.it-section {
  position: relative;
  z-index: 1;
  padding: 6rem 1.5rem;
  border-top: 1px solid var(--border);
}
.it-section--dark {
  background: var(--bg-alt);
}
.it-section--principle {
  background: var(--bg);
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}
@media (min-width: 640px) {
  .it-section {
    padding: 7rem 3rem;
  }
}
@media (min-width: 1024px) {
  .it-section {
    padding: 8rem 7rem;
  }
}
@media (min-width: 1400px) {
  .it-section {
    padding: 9rem 10rem;
  }
}

/* ─── RULE ─── */
.it-rule {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 2.5rem;
}
.it-rule-label {
  font-size: 0.58rem;
  font-weight: 500;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--accent);
  white-space: nowrap;
  flex-shrink: 0;
}
.it-rule-line {
  flex: 1;
  height: 1px;
  background: linear-gradient(
    90deg,
    rgba(240, 24, 90, 0.4) 0%,
    transparent 70%
  );
}

/* ─── TYPOGRAPHY ─── */
.it-sh {
  font-family: var(--font-display);
  font-size: clamp(1.8rem, 4vw, 3rem);
  font-weight: 600;
  line-height: 1.1;
  letter-spacing: -0.02em;
  margin: 0 0 1.5rem;
}

.it-body {
  font-size: clamp(0.9rem, 1.2vw, 1rem);
  line-height: 1.75;
  color: var(--fg);
  max-width: 620px;
  margin: 0;
}
.it-body--wide {
  max-width: 800px;
  margin-bottom: 3rem;
}
.it-body-stack {
  display: flex;
  flex-direction: column;
  gap: 1.25rem;
}

/* ─── SECTION 01: TWO COL ─── */
.it-two-col {
  display: flex;
  flex-direction: column;
  gap: 3rem;
}
@media (min-width: 1024px) {
  .it-two-col {
    flex-direction: row;
    align-items: flex-start;
    gap: 6rem;
  }
  .it-col-main {
    flex: 1;
  }
  .it-col-aside {
    flex-shrink: 0;
    display: flex;
    flex-direction: column;
    gap: 1rem;
  }
}

.it-stat-card {
  display: flex;
  flex-direction: column;
  gap: 0.25rem;
  padding: 1.25rem 1.5rem;
  border: 1px solid var(--border);
  min-width: 160px;
}
.it-stat-n {
  font-family: var(--font-display);
  font-size: clamp(2.5rem, 5vw, 3.5rem);
  font-weight: 700;
  line-height: 1;
  color: var(--accent);
}
.it-stat-l {
  font-size: 0.65rem;
  font-weight: 500;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--fg-muted);
}

/* ─── SECTION 02: COMPARE GRID ─── */
.it-compare-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.5rem;
  margin-bottom: 2.5rem;
}
@media (min-width: 768px) {
  .it-compare-grid {
    grid-template-columns: 1fr 1fr;
  }
}

.it-compare-fig {
  position: relative;
  margin: 0;
}
.it-compare-badge {
  position: absolute;
  top: 1rem;
  left: 1rem;
  z-index: 2;
  font-size: 0.55rem;
  font-weight: 600;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  padding: 0.3rem 0.6rem;
}
.it-compare-badge--legacy {
  background: rgba(240, 24, 90, 0.15);
  color: var(--accent);
  border: 1px solid rgba(240, 24, 90, 0.3);
}
.it-compare-badge--wire {
  background: rgba(255, 255, 255, 0.06);
  color: var(--fg-muted);
  border: 1px solid var(--border);
}

.it-compare-img {
  width: 100%;
  display: block;
  border: 1px solid var(--border);
  transition: transform 0.4s var(--ease-expo);
}
.it-compare-img:hover {
  transform: scale(1.02);
}
.it-compare-cap {
  font-size: 0.7rem;
  color: var(--fg-muted);
  margin-top: 0.75rem;
  line-height: 1.5;
}

.it-insight-bar {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1.25rem 1.5rem;
  border-left: 2px solid var(--accent);
  background: var(--accent-glow);
}
.it-insight-icon {
  font-size: 1.25rem;
  color: var(--accent);
  flex-shrink: 0;
}
.it-insight-text {
  font-size: 0.9rem;
  font-style: italic;
  color: var(--fg);
  line-height: 1.6;
}

/* ─── SECTION 03: ROOM ─── */
.it-room-layout {
  display: flex;
  flex-direction: column;
  gap: 3rem;
}
@media (min-width: 1024px) {
  .it-room-layout {
    flex-direction: row;
    gap: 6rem;
    align-items: flex-start;
  }
  .it-room-text {
    flex: 1;
  }
  .it-room-people {
    flex-shrink: 0;
    min-width: 260px;
  }
}

.it-room-label {
  font-size: 0.6rem;
  font-weight: 500;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: var(--accent);
  margin-bottom: 1.25rem;
}
.it-people-grid {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}
.it-person {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 0.75rem 1rem;
  border: 1px solid var(--border);
}
.it-person-dot {
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: var(--accent);
  flex-shrink: 0;
}
.it-person-role {
  font-size: 0.78rem;
  color: var(--fg-muted);
  line-height: 1.4;
}

/* ─── SECTION 04: DECISIONS ─── */
.it-decision {
  padding: 3rem 0;
}
.it-decision-header {
  display: flex;
  align-items: baseline;
  gap: 1.5rem;
  margin-bottom: 2rem;
}
.it-decision-num {
  font-family: var(--font-display);
  font-size: clamp(3rem, 8vw, 6rem);
  font-weight: 700;
  line-height: 1;
  color: transparent;
  -webkit-text-stroke: 1px rgba(240, 24, 90, 0.25);
  user-select: none;
}
.it-decision-title {
  font-family: var(--font-display);
  font-size: clamp(1.1rem, 2.5vw, 1.6rem);
  font-weight: 600;
  letter-spacing: -0.01em;
  color: var(--fg);
  margin: 0;
}

.it-decision-body {
  display: flex;
  flex-direction: column;
  gap: 2rem;
}
@media (min-width: 1024px) {
  .it-decision-body {
    flex-direction: row;
    align-items: flex-start;
    gap: 5rem;
  }
  .it-decision-text {
    flex: 1;
  }
  .it-decision-visual {
    flex-shrink: 0;
    width: 420px;
  }
}

.it-gif-frame {
  border: 1px solid var(--border);
  overflow: hidden;
}
.it-gif-bar {
  display: flex;
  align-items: center;
  gap: 0.4rem;
  padding: 0.6rem 0.75rem;
  background: rgba(255, 255, 255, 0.04);
  border-bottom: 1px solid var(--border);
}
.it-gd {
  width: 10px;
  height: 10px;
  border-radius: 50%;
}
.it-gd--r {
  background: #ff5f57;
}
.it-gd--y {
  background: #ffbd2e;
}
.it-gd--g {
  background: #28ca41;
}
.it-gif-img {
  width: 100%;
  display: block;
}
.it-gif-cap {
  font-size: 0.7rem;
  color: var(--fg-muted);
  margin-top: 0.75rem;
  line-height: 1.5;
}

/* Badges demo */
.it-badges-demo {
  display: flex;
  flex-wrap: wrap;
  gap: 0.6rem;
  margin-bottom: 1rem;
}
.it-badge {
  font-size: 0.7rem;
  font-weight: 500;
  letter-spacing: 0.06em;
  padding: 0.35rem 0.9rem;
  border-radius: 999px;
}
.it-badge--approved {
  background: #22c55e;
  color: #fff;
}
.it-badge--pending {
  background: #f59e0b;
  color: #fff;
}
.it-badge--rejected {
  background: #ef4444;
  color: #fff;
}
.it-badge--review {
  background: #3b82f6;
  color: #fff;
}

.it-instances {
  font-size: 0.8rem;
  color: var(--fg-muted);
  line-height: 1.6;
  font-style: italic;
}

.it-decision-divider {
  height: 1px;
  background: linear-gradient(90deg, var(--accent) 0%, transparent 60%);
  opacity: 0.2;
}

/* ─── SECTION 05: LEARNED ─── */
.it-learned-layout {
  display: flex;
  flex-direction: column;
  gap: 3rem;
}
@media (min-width: 1024px) {
  .it-learned-layout {
    flex-direction: row;
    align-items: flex-start;
    gap: 6rem;
  }
  .it-learned-text {
    flex: 1;
  }
  .it-metric-card {
    flex-shrink: 0;
  }
}

.it-metric-card {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  padding: 2rem;
  border: 1px solid rgba(240, 24, 90, 0.3);
  background: var(--accent-glow);
  min-width: 220px;
}
.it-metric-n {
  font-family: var(--font-display);
  font-size: clamp(3rem, 6vw, 4.5rem);
  font-weight: 700;
  line-height: 1;
  color: var(--accent);
}
.it-metric-l {
  font-size: 0.75rem;
  font-weight: 500;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--fg);
}
.it-metric-sub {
  font-size: 0.7rem;
  color: var(--fg-muted);
  line-height: 1.5;
}

/* ─── SECTION 06: QUOTE ─── */
.it-quote {
  position: relative;
  max-width: 720px;
  margin: 0;
  padding: 0;
}
.it-quote-mark {
  display: block;
  font-family: var(--font-display);
  font-size: clamp(6rem, 15vw, 12rem);
  font-weight: 700;
  line-height: 0.8;
  color: var(--accent);
  opacity: 0.15;
  margin-bottom: -2rem;
  user-select: none;
}
.it-quote-text {
  font-family: var(--font-display);
  font-size: clamp(1.3rem, 3vw, 2rem);
  font-weight: 500;
  line-height: 1.4;
  letter-spacing: -0.01em;
  color: var(--fg);
}

/* ─── FOOTER ─── */
.it-footer {
  position: relative;
  z-index: 1;
  border-top: 1px solid var(--border);
  padding: 3rem 1.5rem;
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}
@media (min-width: 1024px) {
  .it-footer {
    padding: 3rem 7rem;
  }
}

.it-footer-inner {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
}
.it-footer-btn {
  background: none;
  border: 1px solid var(--border);
  cursor: pointer;
  font-family: var(--font-body);
  font-size: 0.65rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--fg-muted);
  padding: 0.75rem 1.25rem;
  transition:
    border-color 0.2s,
    color 0.2s;
}
.it-footer-btn:hover {
  border-color: var(--fg-muted);
  color: var(--fg);
}
.it-footer-btn--accent {
  border-color: rgba(240, 24, 90, 0.4);
  color: var(--accent);
}
.it-footer-btn--accent:hover {
  border-color: var(--accent);
}

.it-footer-copy {
  font-size: 0.65rem;
  color: var(--fg-muted);
  letter-spacing: 0.08em;
  margin: 0;
}

/* ─── DECISION 2: CAROUSEL ─── */
.it-d2-intro {
  max-width: 640px;
  display: flex;
  flex-direction: column;
  gap: 1.25rem;
  margin-bottom: 2.5rem;
}

/* Full-bleed: cancel section padding on both sides */
.it-carousel-wrap {
  position: relative;
  margin-left: -1.5rem;
  margin-right: -1.5rem;
}
@media (min-width: 640px) {
  .it-carousel-wrap {
    margin-left: -3rem;
    margin-right: -3rem;
  }
}
@media (min-width: 1024px) {
  .it-carousel-wrap {
    margin-left: -7rem;
    margin-right: -7rem;
  }
}
@media (min-width: 1400px) {
  .it-carousel-wrap {
    margin-left: -10rem;
    margin-right: -10rem;
  }
}

.it-carousel-viewport {
  overflow: hidden;
}

.it-carousel-track {
  display: flex;
  transition: transform 0.55s cubic-bezier(0.16, 1, 0.3, 1);
}

.it-carousel-slide {
  flex: 0 0 100%;
  position: relative;
  margin: 0;
}

.it-carousel-img {
  width: 100%;
  display: block;
  max-height: 72vh;
  object-fit: contain;
  background: var(--bg);
}

/* Arrows */
.it-carousel-arrow {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  z-index: 10;
  width: 2.75rem;
  height: 2.75rem;
  border-radius: 50%;
  background: rgba(7, 7, 17, 0.75);
  border: 1px solid rgba(255, 255, 255, 0.14);
  color: var(--fg);
  font-size: 1rem;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  backdrop-filter: blur(8px);
  -webkit-backdrop-filter: blur(8px);
  transition:
    background 0.2s,
    border-color 0.2s,
    color 0.2s;
}
.it-carousel-arrow:hover {
  background: rgba(240, 24, 90, 0.2);
  border-color: rgba(240, 24, 90, 0.5);
  color: var(--accent);
}
.it-carousel-arrow:disabled {
  opacity: 0.2;
  cursor: default;
  pointer-events: none;
}
.it-carousel-arrow--prev {
  left: 1.25rem;
}
.it-carousel-arrow--next {
  right: 1.25rem;
}

/* Caption + dots row */
.it-carousel-footer {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1rem;
  margin-top: 1.25rem;
  flex-wrap: wrap;
}
.it-carousel-cap {
  font-size: 0.75rem;
  color: var(--fg-muted);
  line-height: 1.6;
  margin: 0;
  max-width: 560px;
}
.it-carousel-dots {
  display: flex;
  gap: 0.5rem;
  flex-shrink: 0;
}
.it-carousel-dot {
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: var(--border);
  border: none;
  cursor: pointer;
  padding: 0;
  transition:
    background 0.2s,
    transform 0.2s;
}
.it-carousel-dot--active {
  background: var(--accent);
  transform: scale(1.4);
}

.it-compare-badge--final {
  background: rgba(34, 197, 94, 0.15);
  color: #22c55e;
  border: 1px solid rgba(34, 197, 94, 0.35);
}

.it-d3-text {
  max-width: 640px;
  margin-bottom: 2.5rem;
}
.it-d3-grid {
  grid-template-columns: 1fr 1fr;
}

/* ─── SECTION 05: SECONDARY KPIS ─── */
.it-kpis-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 0.65rem;
  margin-top: 2rem;
}
@media (min-width: 768px) {
  .it-kpis-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}
@media (min-width: 1024px) {
  .it-kpis-grid {
    grid-template-columns: repeat(5, 1fr);
  }
}
.it-kpi {
  border: 1px solid rgba(240, 24, 90, 0.18);
  border-radius: 8px;
  padding: 1rem 1.25rem;
  display: flex;
  flex-direction: column;
  gap: 0.35rem;
}
.it-kpi-n {
  display: block;
  font-family: var(--font-display);
  font-weight: 700;
  font-size: clamp(1.25rem, 3vw, 1.75rem);
  color: var(--accent);
  line-height: 1;
}
.it-kpi-l {
  font-size: 0.72rem;
  color: var(--fg-muted);
  line-height: 1.45;
}
.it-kpis-btn {
  margin-top: 2rem;
  background: none;
  border: 1px solid rgba(240, 24, 90, 0.4);
  cursor: pointer;
  font-family: var(--font-body);
  font-size: 0.65rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--accent);
  padding: 0.85rem 1.5rem;
  transition: border-color 0.2s, background 0.2s;
  display: inline-block;
}
.it-kpis-btn:hover {
  border-color: var(--accent);
  background: var(--accent-glow);
}

/* ─── ZOOMABLE AFFORDANCE ─── */
.it-zoomable {
  cursor: zoom-in;
}
.it-zoomable:hover {
  opacity: 0.92;
}
</style>

<style>
/* ─── LIGHTBOX (global — rendered via Teleport) ─── */
.lb-backdrop {
  position: fixed;
  inset: 0;
  z-index: 9999;
  background: rgba(4, 4, 14, 0.93);
  backdrop-filter: blur(14px);
  -webkit-backdrop-filter: blur(14px);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 2rem;
  animation: lb-fade 0.2s ease both;
}
@keyframes lb-fade {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.lb-close {
  position: fixed;
  top: 1.5rem;
  right: 1.5rem;
  width: 2.5rem;
  height: 2.5rem;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.08);
  border: 1px solid rgba(255, 255, 255, 0.14);
  color: #f0eff8;
  font-size: 1rem;
  line-height: 1;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition:
    background 0.2s,
    border-color 0.2s,
    color 0.2s;
  z-index: 10000;
}
.lb-close:hover {
  background: rgba(240, 24, 90, 0.18);
  border-color: rgba(240, 24, 90, 0.5);
  color: #f0185a;
}

.lb-figure {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1.25rem;
  max-width: min(92vw, 1280px);
  margin: 0;
  animation: lb-rise 0.28s cubic-bezier(0.16, 1, 0.3, 1) both;
}
@keyframes lb-rise {
  from {
    transform: scale(0.94);
    opacity: 0;
  }
  to {
    transform: scale(1);
    opacity: 1;
  }
}

.lb-img {
  display: block;
  max-width: 100%;
  max-height: 82vh;
  object-fit: contain;
  border: 1px solid rgba(255, 255, 255, 0.07);
}

.lb-caption {
  font-family: "DM Sans", sans-serif;
  font-size: 0.78rem;
  color: rgba(240, 239, 248, 0.5);
  line-height: 1.65;
  text-align: center;
  max-width: 640px;
  letter-spacing: 0.01em;
}

/* v-html em highlights — scoped styles don't reach v-html content */
.it-title em,
.it-sh em {
  color: var(--accent);
  font-style: normal;
}
</style>
