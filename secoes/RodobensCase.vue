<template>
  <div :class="['rc-root', `theme-${theme}`]">
    <div class="rc-grain" aria-hidden="true"></div>

    <NavBar v-model:lang="lang" v-model:theme="theme" />

    <!-- 01 HERO -->
    <section class="rc-hero">
      <div class="rc-hero-left">
        <div class="rc-eyebrow">
          <span class="rc-tag">{{ t.tag }}</span
          ><span class="rc-sep">·</span><span class="rc-year">2026</span>
        </div>
        <h1 class="rc-title" v-html="t.title"></h1>
        <p class="rc-subtitle" v-html="t.subtitle"></p>
        <p class="rc-accent">{{ t.accentLine }}</p>
        <div class="rc-roles">
          <span v-for="r in t.roles" :key="r" class="rc-role">{{ r }}</span>
        </div>

        <nav class="rc-toc" aria-label="Table of contents">
          <span class="rc-toc-label">{{ t.tocLabel }}</span>
          <ol class="rc-toc-list">
            <li v-for="item in tocItems" :key="item.id" class="rc-toc-item">
              <a :href="`#${item.id}`" class="rc-toc-link">
                <span class="rc-toc-num">{{ item.num }}</span>
                <span class="rc-toc-name">{{ item.label }}</span>
              </a>
            </li>
          </ol>
        </nav>
      </div>
      <div class="rc-hero-right">
        <div class="rc-stats-grid">
          <div class="rc-stat">
            <b class="rc-sn" style="color: #f0185a">129</b
            ><span class="rc-sl">{{ t.stats.profiles }}</span>
          </div>
          <div class="rc-stat">
            <b class="rc-sn rc-teal">603</b
            ><span class="rc-sl">{{ t.stats.users }}</span>
          </div>
          <div class="rc-stat">
            <b class="rc-sn" style="color: #ff7c43">6</b
            ><span class="rc-sl">{{ t.stats.months }}</span>
          </div>
          <div class="rc-stat">
            <b class="rc-sn" style="color: #f0185a">7</b
            ><span class="rc-sl">{{ t.stats.legacy }}</span>
          </div>
        </div>
        <div class="rc-screen">
          <div class="rc-browser">
            <span class="rc-dot rc-dot-r"></span
            ><span class="rc-dot rc-dot-y"></span
            ><span class="rc-dot rc-dot-g"></span
            ><span class="rc-url">unica.rodobens.com.br/analise</span>
          </div>
          <img
            :src="creditDashImg"
            alt="Interface Unica — análise de crédito"
            loading="lazy"
            class="rc-screen-img rc-zoomable"
            @click="
              openLightbox(
                creditDashImg,
                'Interface Unica — análise de crédito',
              )
            "
          />
        </div>
      </div>
    </section>

    <!-- QUEIXAS -->
    <section class="rc-section">
      <div class="rc-rule">
        <span class="rc-rule-label">{{ t.complaintsLabel }}</span
        ><span class="rc-rule-line"></span>
      </div>
      <div class="rc-complaints-grid">
        <div
          v-for="(c, i) in t.complaints"
          :key="i"
          class="rc-complaint"
          :class="{ 'rc-complaint--vis': visC }"
          :style="{ '--ci': i }"
          :ref="(el) => setRef(el, i)"
        >
          <span class="rc-cicon" aria-hidden="true">
            <svg
              v-if="i === 0"
              width="28"
              height="28"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z" />
            </svg>
            <svg
              v-else-if="i === 1"
              width="28"
              height="28"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <circle cx="12" cy="12" r="3" />
              <path
                d="M19.07 4.93a10 10 0 0 1 0 14.14M4.93 4.93a10 10 0 0 0 0 14.14"
              />
              <path d="M12 2v2M12 20v2M2 12h2M20 12h2" />
            </svg>
            <svg
              v-else-if="i === 2"
              width="28"
              height="28"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <circle cx="12" cy="12" r="10" />
              <line x1="12" y1="8" x2="12" y2="12" />
              <line x1="12" y1="16" x2="12.01" y2="16" />
            </svg>
            <svg
              v-else-if="i === 3"
              width="28"
              height="28"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <rect x="2" y="3" width="20" height="14" rx="2" />
              <line x1="8" y1="21" x2="16" y2="21" />
              <line x1="12" y1="17" x2="12" y2="21" />
              <line x1="4" y1="7" x2="20" y2="7" />
            </svg>
            <svg
              v-else-if="i === 4"
              width="28"
              height="28"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <path
                d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"
              />
              <polyline points="14 2 14 8 20 8" />
              <line x1="12" y1="18" x2="12" y2="12" />
              <line x1="9" y1="15" x2="15" y2="15" />
            </svg>
            <svg
              v-else-if="i === 5"
              width="28"
              height="28"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <line x1="18" y1="20" x2="18" y2="10" />
              <line x1="12" y1="20" x2="12" y2="4" />
              <line x1="6" y1="20" x2="6" y2="14" />
              <line x1="2" y1="20" x2="22" y2="20" />
            </svg>
          </span>
          <p class="rc-ctxt">{{ c }}</p>
        </div>
      </div>
    </section>

    <!-- OVERVIEW -->
    <section id="rc-overview" class="rc-section">
      <div class="rc-rule">
        <span class="rc-rule-label">01 — {{ t.overviewLabel }}</span
        ><span class="rc-rule-line"></span>
      </div>
      <div class="rc-overview-row">
        <p class="rc-overview-body" v-html="t.overviewBody"></p>
        <div class="rc-deliverables">
          <div v-for="d in t.deliverables" :key="d" class="rc-del">
            <span class="rc-del-dot"></span>{{ d }}
          </div>
        </div>
      </div>
      <div class="rc-triads">
        <div v-for="tr in t.triads" :key="tr.title" class="rc-triad">
          <h3 class="rc-triad-t">{{ tr.title }}</h3>
          <p class="rc-triad-b">{{ tr.body }}</p>
        </div>
      </div>
    </section>

    <!-- 02 DISCOVERY & MAPPING -->
    <section id="rc-discovery" class="rc-section">
      <div class="rc-rule">
        <span class="rc-rule-label">02 — {{ t.discoveryLabel }}</span
        ><span class="rc-rule-line"></span>
      </div>
      <p class="rc-section-intro" v-html="t.discoveryBody"></p>

      <!-- Images first -->
      <div class="rc-discovery-imgs">
        <figure class="rc-disc-fig">
          <img
            :src="userFlowImg"
            alt="User flow mapping"
            class="rc-disc-img rc-zoomable"
            loading="lazy"
            @click="
              openLightbox(
                userFlowImg,
                t.discoveryImg1Caption,
                t.discoveryImg1Caption,
              )
            "
          />
          <figcaption class="rc-disc-caption">
            {{ t.discoveryImg1Caption }}
          </figcaption>
        </figure>
        <figure class="rc-disc-fig">
          <img
            :src="designCritiqueImg"
            alt="Design critique session"
            class="rc-disc-img rc-zoomable"
            loading="lazy"
            @click="
              openLightbox(
                designCritiqueImg,
                t.discoveryImg2Caption,
                t.discoveryImg2Caption,
              )
            "
          />
          <figcaption class="rc-disc-caption">
            {{ t.discoveryImg2Caption }}
          </figcaption>
        </figure>
      </div>

      <!-- Gabriella quote -->
      <figure class="rc-user-quote">
        <blockquote class="rc-uq-text" v-html="t.discoveryQuote"></blockquote>
        <figcaption class="rc-uq-note">{{ t.discoveryQuoteNote }}</figcaption>
      </figure>
    </section>

    <!-- 03 SOLUÇÃO DE DESIGN -->
    <section id="rc-design" class="rc-section">
      <div class="rc-rule">
        <span class="rc-rule-label">03 — {{ t.designLabel }}</span
        ><span class="rc-rule-line"></span>
      </div>
      <p class="rc-section-intro" v-html="t.designIntro"></p>

      <div class="rc-screens-list">
        <div
          v-for="(s, i) in designScreens"
          :key="s.img"
          class="rc-design-screen"
        >
          <div class="rc-ds-header">
            <h3 class="rc-ds-title">{{ s.title }}</h3>
            <p class="rc-ds-desc" v-html="s.desc"></p>
            <p v-if="s.note" class="rc-ds-note">{{ s.note }}</p>
          </div>
          <div class="rc-ds-img-col">
            <div class="rc-screen rc-screen--switchable">
              <div class="rc-browser">
                <span class="rc-dot rc-dot-r"></span
                ><span class="rc-dot rc-dot-y"></span
                ><span class="rc-dot rc-dot-g"></span>
                <span class="rc-url">{{
                  oldView[i] ? "Sistema legado · vTiger" : s.url
                }}</span>
              </div>
              <div class="rc-img-wrap">
                <Transition name="rc-flip" mode="out-in">
                  <img
                    :key="oldView[i] ? 'old' : 'new'"
                    :src="oldView[i] ? s.oldImg : s.img"
                    :alt="s.title"
                    loading="lazy"
                    class="rc-screen-img rc-zoomable"
                    @click="
                      openLightbox(
                        oldView[i] ? s.oldImg : s.img,
                        s.title,
                        s.title,
                      )
                    "
                  />
                </Transition>
                <button
                  v-if="s.oldImg"
                  class="rc-before-btn"
                  :class="{ 'rc-before-btn--active': oldView[i] }"
                  @click="toggleOld(i)"
                  type="button"
                >
                  <span>{{ oldView[i] ? t.btnAfter : t.btnBefore }}</span>
                  <span class="rc-before-icon" aria-hidden="true">{{
                    oldView[i] ? "→" : "←"
                  }}</span>
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

      <div class="rc-rule rc-rule--principles">
        <span class="rc-rule-label">{{ t.principlesLabel }}</span
        ><span class="rc-rule-line"></span>
      </div>

      <div class="rc-principles">
        <div
          v-for="(p, pi) in t.principles"
          :key="p.title"
          class="rc-principle"
          :style="{ '--acc': p.color }"
        >
          <div class="rc-pr-icon" :style="{ color: p.color }">
            <svg
              v-if="pi === 0"
              width="28"
              height="28"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3" />
              <circle cx="12" cy="12" r="10" />
              <line x1="12" y1="17" x2="12.01" y2="17" />
            </svg>
            <svg
              v-else-if="pi === 1"
              width="28"
              height="28"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <circle cx="11" cy="11" r="8" />
              <line x1="21" y1="21" x2="16.65" y2="16.65" />
            </svg>
            <svg
              v-else-if="pi === 2"
              width="28"
              height="28"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z" />
              <circle cx="12" cy="12" r="3" />
            </svg>
            <svg
              v-else-if="pi === 3"
              width="28"
              height="28"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <line x1="8" y1="6" x2="21" y2="6" />
              <line x1="8" y1="12" x2="21" y2="12" />
              <line x1="8" y1="18" x2="21" y2="18" />
              <line x1="3" y1="6" x2="3.01" y2="6" />
              <line x1="3" y1="12" x2="3.01" y2="12" />
              <line x1="3" y1="18" x2="3.01" y2="18" />
            </svg>
            <svg
              v-else-if="pi === 4"
              width="28"
              height="28"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2" />
            </svg>
            <svg
              v-else-if="pi === 5"
              width="28"
              height="28"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <line x1="12" y1="1" x2="12" y2="23" />
              <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6" />
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
            <h4 class="rc-dec-col-title rc-teal">
              {{ t.decisionBenefitsTitle }}
            </h4>
            <ul class="rc-dec-list">
              <li v-for="b in t.decisionBenefits" :key="b.label">
                <b>{{ b.label }}</b> {{ b.body }}
              </li>
            </ul>
          </div>
          <div class="rc-dec-col">
            <h4 class="rc-dec-col-title" style="color: #f0185a">
              {{ t.decisionCustomTitle }}
            </h4>
            <ul class="rc-dec-list">
              <li
                v-for="c in t.decisionCustom"
                :key="c.color"
                class="rc-dec-custom-item"
              >
                <span
                  class="rc-dec-swatch"
                  :style="{ background: c.color }"
                ></span
                ><span
                  ><b>{{ c.label }}</b> {{ c.body }}</span
                >
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
            <span class="rc-badge-pill" style="background: #05b44c">{{
              t.badge1
            }}</span>
            <span class="rc-badge-pill" style="background: #f0b100">{{
              t.badge2
            }}</span>
            <span class="rc-badge-pill" style="background: #fb2c36">{{
              t.badge3
            }}</span>
            <span class="rc-badge-pill" style="background: #2b7fff">{{
              t.badge4
            }}</span>
          </div>
          <p class="rc-comp-note">847 instâncias no sistema</p>
        </div>
        <div class="rc-comp-card">
          <h4 class="rc-comp-title">Data Tables</h4>
          <ul class="rc-comp-list">
            <li v-for="f in t.tableFeatures" :key="f">{{ f }}</li>
          </ul>
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
              <div>
                <b class="rc-sw-name">{{ sw.name }}</b
                ><span class="rc-sw-hex">{{ sw.hex }}</span>
              </div>
            </div>
          </div>
        </div>
        <div class="rc-comp-card">
          <h4 class="rc-comp-title">{{ t.typographyTitle }}</h4>
          <div class="rc-type-preview">
            <div>
              <span class="rc-type-bold">DM Sans Bold</span
              ><span class="rc-type-role">Headings</span>
            </div>
            <div>
              <span class="rc-type-reg">DM Sans Regular</span
              ><span class="rc-type-role">Body</span>
            </div>
            <div>
              <span class="rc-type-med">DM Sans Medium</span
              ><span class="rc-type-role">Data</span>
            </div>
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
    <section id="rc-deliverables" class="rc-section rc-section--dark">
      <div class="rc-rule">
        <span class="rc-rule-label">04 — {{ t.delivLabel }}</span
        ><span class="rc-rule-line"></span>
      </div>
      <h3 class="rc-sub-heading">{{ t.delivHeading }}</h3>
      <div class="rc-deliverables-list">
        <div v-for="d in t.delivList" :key="d" class="rc-deliv-item">
          <span class="rc-deliv-dot"></span><span>{{ d }}</span>
        </div>
      </div>
      <blockquote class="rc-deliv-quote">{{ t.delivQuote }}</blockquote>
      <h3 class="rc-sub-heading">{{ t.impactHeading }}</h3>
      <p class="rc-impact-method" v-html="t.impactMethodology"></p>
      <div class="rc-impact-grid">
        <div v-for="m in t.metrics" :key="m.num" class="rc-metric">
          <b class="rc-metric-n">{{ m.num }}</b
          ><span class="rc-metric-l">{{ m.label }}</span>
        </div>
      </div>
    </section>

    <!-- 05 REFLEXÕES -->
    <section id="rc-reflexoes" class="rc-section">
      <div class="rc-rule">
        <span class="rc-rule-label">05 — {{ t.reflexLabel }}</span
        ><span class="rc-rule-line"></span>
      </div>
      <h3 class="rc-sub-heading">{{ t.teamHeading }}</h3>
      <div class="rc-team">
        <div v-for="m in t.team" :key="m.role" class="rc-team-card">
          <b class="rc-team-role">{{ m.role }}</b
          ><span class="rc-team-name">{{ m.name }}</span>
        </div>
      </div>
      <div class="rc-reflexoes">
        <div v-for="r in t.reflexoes" :key="r.question" class="rc-reflexao">
          <div class="rc-reflexao-icon">
            <svg
              width="20"
              height="20"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <circle cx="12" cy="12" r="10" />
              <path d="M12 16v-4M12 8h.01" />
            </svg>
          </div>
          <div>
            <h4 class="rc-ref-q">{{ r.question }}</h4>
            <p class="rc-ref-a">{{ r.answer }}</p>
          </div>
        </div>
      </div>
    </section>

    <footer class="rc-footer">
      <div class="rc-footer-inner">
        <span class="rc-footer-tag">{{ t.footerTag }}</span>
        <div class="rc-footer-links">
          <a href="/projetos" class="rc-footer-link">{{ t.back }}</a>
          <a href="mailto:tayna.schultz@gmail.com" class="rc-footer-link"
            >Email</a
          >
          <a
            href="https://www.linkedin.com/in/taynaschultz/"
            target="_blank"
            rel="noopener noreferrer"
            class="rc-footer-link"
            >LinkedIn</a
          >
        </div>
      </div>
      <p class="rc-footer-copy">
        Case Study: Rodobens Unica Platform · Discovery, UX Strategy & UI Design
        · © 2026 Tayná Schultz
      </p>
    </footer>

    <Teleport to="body">
      <Transition name="rc-lb">
        <div
          v-if="lightboxSrc"
          class="rc-lightbox"
          @click.self="closeLightbox"
          role="dialog"
          aria-modal="true"
        >
          <button
            class="rc-lb-close"
            @click="closeLightbox"
            aria-label="Fechar"
          >
            <svg
              width="20"
              height="20"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2.5"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <line x1="18" y1="6" x2="6" y2="18" />
              <line x1="6" y1="6" x2="18" y2="18" />
            </svg>
          </button>
          <figure class="rc-lb-figure" @click.stop>
            <img :src="lightboxSrc" :alt="lightboxAlt" class="rc-lb-img" />
            <figcaption v-if="lightboxCaption" class="rc-lb-caption">
              {{ lightboxCaption }}
            </figcaption>
          </figure>
        </div>
      </Transition>
    </Teleport>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from "vue";
import NavBar from "./NavBar.vue";
import { useLang } from "../src/composables/useLang";

import loginImg from "../imagens cases/rodobens/login.png";
import kanbanImg from "../imagens cases/rodobens/kanban.png";
import simulacaoImg from "../imagens cases/rodobens/simulação.png";
import creditDashImg from "../imagens cases/rodobens/Dashboard crédito.png";
import notifImg from "../imagens cases/rodobens/central de notificações.png";
import userFlowImg from "../imagens cases/rodobens/outros pontos de dores.png";
import designCritiqueImg from "../imagens cases/rodobens/User critique.png";
import loginAntigoImg from "../imagens cases/rodobens/ANTIGAS/login antigo.png";
import simulacaoAntigaImg from "../imagens cases/rodobens/ANTIGAS/simulação antiga.jpeg";
import negociacaoAntigaImg from "../imagens cases/rodobens/ANTIGAS/negociação antiga.png";
import menuAntigoImg from "../imagens cases/rodobens/ANTIGAS/MENU antigo.png";

const props = defineProps({
  lang: { type: String, default: "PT" },
  theme: { type: String, default: "light" },
});

const { lang } = useLang();
const theme = ref(props.theme);
const visC = ref(false);
const oldView = ref({});
const toggleOld = (i) => {
  oldView.value = { ...oldView.value, [i]: !oldView.value[i] };
};

const lightboxSrc = ref(null);
const lightboxAlt = ref("");
const lightboxCaption = ref("");
function openLightbox(src, alt, caption = "") {
  lightboxSrc.value = src;
  lightboxAlt.value = alt || "";
  lightboxCaption.value = caption || "";
}
function closeLightbox() {
  lightboxSrc.value = null;
  lightboxCaption.value = "";
}
function onKeydownLightbox(e) {
  if (e.key === "Escape") closeLightbox();
}
onMounted(() => window.addEventListener("keydown", onKeydownLightbox));
onUnmounted(() => window.removeEventListener("keydown", onKeydownLightbox));
const cRefs = ref([]);
const setRef = (el, i) => {
  if (el) cRefs.value[i] = el;
};
let observer = null;
onMounted(() => {
  observer = new IntersectionObserver(
    ([e]) => {
      if (e.isIntersecting) visC.value = true;
    },
    { threshold: 0.1 },
  );
  cRefs.value[0] && observer.observe(cRefs.value[0]);
});
onUnmounted(() => observer?.disconnect());

const screensCopy = {
  PT: [
    {
      title: "Login & Autenticação",
      desc: 'Iniciamos pela tela de login. <em class="rc-hint">Clique no botão no canto superior direito da imagem para ver como era antes.</em> Aplicamos <b>heurísticas</b> de <b>prevenção de erros</b>, <b>controle e liberdade</b>, <b>visibilidade e status</b> do sistema, e <b>flexibilidade</b> e eficiência de uso apenas adicionando funcionalidades <b>base</b>, como visualização da <b>senha</b>, cenário de <b>erro</b>, <b>cores</b> e <b>hierarquia</b>. Além de reforçarmos o <b>brand</b> da marca com uma tela inicial <b>humanizada</b>. Aqui foi solicitada a remoção da funcionalidade de esquecimento de senha por regras de sistema interno.',
      note: null,
    },
    {
      title: "Novo Simulador de Crédito",
      desc: "A antiga tela de simulação possuía <b>termos confusos</b> e fluxo <b>não linear</b>, impossibilidade do usuário <b>editar</b> e falta de <b>clareza</b> na hora de relacionar a adição de seguros ou peças com o veículo a ser financiado. Havia a necessidade de flegar elementos <b>desnecessariamente</b> para seguir o fluxo, excesso de cards e <b>impossibilidade de exclusão</b> ou arquivamento.<br><br>Na nova tela trouxemos o resumo dos principais dados do cliente fixos no topo superior direito, <b>nomenclaturas coesas</b> com as ações do usuário, e visual de calculadora amigável. Também <b>sanamos dores</b> adicionando <b>arquivamento, histórico completo, avisos de sistema e sinalizações claras</b>.",
      note: null,
    },
    {
      title: "Kanban Comercial",
      desc: "A operação diária de diversos perfis é feita majoritariamente por planilhas, porém, alguns usuários utilizavam <b>plataformas externas</b> para poderem visualizar a fila de operações em formato de <b>kanban</b>. Com essa necessidade, <b>entendemos</b> que o <b>sistema precisaria</b> das duas visualizações aplicadas em momentos diferentes, uma sendo em andamento e a outra geral. Então, implementamos o kanban, a possibilidade de ordenamento, filtros aplicados em um campo que abre lateralmente no canto superior direito, a lista de negociações em formato de planilha.",
      note: null,
    },
    {
      title: "Dashboard de Análise de Crédito",
      desc: "Havia a <b>necessidade</b> de visualização de <b>desempenho de equipe</b> e <b>comparativos</b> mensais por parte das alçadas superiores, dependência de plataformas externas e falta de visualização e <b>senso de urgência</b> de tarefas. A tela inicial de cada perfil de acesso não era útil, trouxemos, então, um dashboard com todas as funcionalidades necessárias e <b>acesso rápido</b> a outras funcionalidades do sistema e fluxos de trabalho diários.",
      note: null,
    },
    {
      title: "Central de Notificações",
      desc: "Sistema unificado de alertas e notificações contextuais.",
      note: "O cliente não possuía funcionalidade de notificações anteriormente. Todas as comunicações eram feitas externamente em outra aplicação.",
    },
  ],
  EN: [
    {
      title: "Login & Authentication",
      desc: 'We started with the login screen. <em class="rc-hint">Click the button in the top-right corner of the image to see how it looked before.</em> We applied <b>heuristics</b> of <b>error prevention</b>, <b>user control and freedom</b>, <b>system status visibility</b>, and <b>flexibility</b> and efficiency of use — simply by adding <b>base</b> functionalities such as <b>password</b> visibility, <b>error</b> states, <b>colors</b> and <b>hierarchy</b>. We also reinforced the <b>brand</b> with a <b>humanized</b> login screen. The password recovery feature was removed per internal system rules.',
      note: null,
    },
    {
      title: "New Credit Simulator",
      desc: "The old simulation screen had <b>confusing terms</b> and a <b>non-linear</b> flow, no ability to <b>edit</b>, and a lack of <b>clarity</b> when relating insurance or parts to the financed vehicle. Users had to flag items <b>unnecessarily</b> to proceed, with excess cards and <b>no deletion</b> or archiving option.<br><br>In the new screen we brought the main client data summary fixed at the top right, <b>consistent naming</b> aligned with user actions, and a friendly calculator layout. We also <b>resolved pain points</b> by adding <b>archiving, full history, system warnings and clear signals</b>.",
      note: null,
    },
    {
      title: "Commercial Kanban",
      desc: "Daily operations across multiple profiles are mostly handled via spreadsheets, but some users relied on <b>external platforms</b> to view the operations queue in <b>kanban</b> format. Given this need, we <b>understood</b> that the <b>system would need</b> both views applied at different moments — one for ongoing and one as a general overview. We implemented the kanban, sorting capability, filters in a side panel opening from the top right, and the negotiations list in spreadsheet format.",
      note: null,
    },
    {
      title: "Credit Analysis Dashboard",
      desc: "There was a <b>need</b> to visualize <b>team performance</b> and monthly <b>comparisons</b> by upper management, along with dependency on external platforms and a lack of task visibility and <b>sense of urgency</b>. The home screen for each access profile was not useful, so we brought a dashboard with all necessary features and <b>quick access</b> to other system functions and daily workflows.",
      note: null,
    },
    {
      title: "Notifications Center",
      desc: "Unified system of alerts and contextual notifications.",
      note: "The client had no notification functionality previously. All communications were handled externally in another application.",
    },
  ],
  ES: [
    {
      title: "Login & Autenticación",
      desc: 'Comenzamos por la pantalla de login. <em class="rc-hint">Haz clic en el botón en la esquina superior derecha de la imagen para ver cómo era antes.</em> Aplicamos <b>heurísticas</b> de <b>prevención de errores</b>, <b>control y libertad del usuario</b>, <b>visibilidad del estado del sistema</b> y <b>flexibilidad</b> y eficiencia de uso — simplemente añadiendo funcionalidades <b>base</b> como visualización de <b>contraseña</b>, estado de <b>error</b>, <b>colores</b> y <b>jerarquía</b>. También reforzamos el <b>brand</b> con una pantalla inicial <b>humanizada</b>. La funcionalidad de recuperación de contraseña fue eliminada por reglas del sistema interno.',
      note: null,
    },
    {
      title: "Nuevo Simulador de Crédito",
      desc: "La antigua pantalla de simulación tenía <b>términos confusos</b> y un flujo <b>no lineal</b>, sin posibilidad de <b>editar</b> y con falta de <b>claridad</b> al relacionar seguros o accesorios con el vehículo a financiar. Era necesario marcar elementos <b>innecesariamente</b> para avanzar, con exceso de cards y <b>sin posibilidad de eliminar</b> o archivar.<br><br>En la nueva pantalla trajimos el resumen de los datos principales del cliente fijo en la parte superior derecha, <b>nomenclaturas coherentes</b> con las acciones del usuario, y un visual de calculadora amigable. También <b>resolvimos problemas</b> añadiendo <b>archivado, historial completo, avisos del sistema y señalizaciones claras</b>.",
      note: null,
    },
    {
      title: "Kanban Comercial",
      desc: "La operación diaria de varios perfiles se realiza principalmente con hojas de cálculo, pero algunos usuarios utilizaban <b>plataformas externas</b> para visualizar la cola de operaciones en formato <b>kanban</b>. Con esa necesidad, <b>entendimos</b> que el <b>sistema necesitaría</b> las dos visualizaciones en momentos diferentes — una en curso y otra general. Implementamos el kanban, la posibilidad de ordenamiento, filtros en un panel lateral que se abre desde la esquina superior derecha, y la lista de negociaciones en formato de hoja de cálculo.",
      note: null,
    },
    {
      title: "Dashboard de Análisis de Crédito",
      desc: "Había una <b>necesidad</b> de visualizar el <b>rendimiento del equipo</b> y <b>comparativos</b> mensuales por parte de las jerarquías superiores, dependencia de plataformas externas y falta de visibilidad y <b>sentido de urgencia</b> de tareas. La pantalla inicial de cada perfil de acceso no era útil, por lo que trajimos un dashboard con todas las funcionalidades necesarias y <b>acceso rápido</b> a otras funciones del sistema y flujos de trabajo diarios.",
      note: null,
    },
    {
      title: "Central de Notificaciones",
      desc: "Sistema unificado de alertas y notificaciones contextuales.",
      note: "El cliente no contaba con funcionalidad de notificaciones anteriormente. Todas las comunicaciones se realizaban externamente en otra aplicación.",
    },
  ],
  DE: [
    {
      title: "Login & Authentifizierung",
      desc: 'Wir begannen mit dem Login-Screen. <em class="rc-hint">Klicke auf den Button oben rechts im Bild, um zu sehen, wie es vorher aussah.</em> Wir wendeten <b>Heuristiken</b> zur <b>Fehlervermeidung</b>, <b>Nutzerkontrolle und Freiheit</b>, <b>Sichtbarkeit des Systemstatus</b> und <b>Flexibilität</b> sowie Nutzungseffizienz an — lediglich durch das Hinzufügen von <b>Basisfunktionen</b> wie <b>Passwort</b>-Sichtbarkeit, <b>Fehlerzustände</b>, <b>Farben</b> und <b>Hierarchie</b>. Außerdem stärkten wir die <b>Markenidentität</b> mit einem <b>humanisierten</b> Login-Screen. Die Passwort-Wiederherstellungsfunktion wurde auf Anweisung interner Systemregeln entfernt.',
      note: null,
    },
    {
      title: "Neuer Kreditsimulator",
      desc: "Der alte Simulationsscreen hatte <b>verwirrende Begriffe</b> und einen <b>nicht-linearen</b> Ablauf, keine Möglichkeit zur <b>Bearbeitung</b> und mangelnde <b>Klarheit</b> beim Verknüpfen von Versicherungen oder Teilen mit dem zu finanzierenden Fahrzeug. Nutzer mussten Elemente <b>unnötigerweise</b> markieren, um fortzufahren, mit übermäßig vielen Karten und <b>ohne Möglichkeit zum Löschen</b> oder Archivieren.<br><br>Im neuen Screen brachten wir eine feste Zusammenfassung der wichtigsten Kundendaten oben rechts, <b>konsistente Bezeichnungen</b> passend zu den Nutzeraktionen und ein freundliches Rechner-Layout. Außerdem <b>lösten wir Probleme</b> durch <b>Archivierung, vollständiger Verlauf, Systemhinweise und klare Signalisierungen</b>.",
      note: null,
    },
    {
      title: "Kommerzielles Kanban",
      desc: "Der tägliche Betrieb verschiedener Profile erfolgt hauptsächlich über Tabellenkalkulationen, einige Nutzer verwendeten jedoch <b>externe Plattformen</b>, um die Vorgangswarteschlange im <b>Kanban</b>-Format anzuzeigen. Angesichts dieses Bedarfs <b>erkannten</b> wir, dass das <b>System beide Ansichten</b> zu unterschiedlichen Zeitpunkten benötigen würde — eine für laufende Vorgänge und eine als Gesamtübersicht. Wir implementierten das Kanban, Sortiermöglichkeiten, Filter in einem Seitenpanel, das von oben rechts öffnet, und die Verhandlungsliste im Tabellenformat.",
      note: null,
    },
    {
      title: "Kreditanalyse-Dashboard",
      desc: "Es bestand ein <b>Bedarf</b> an der Visualisierung der <b>Teamleistung</b> und monatlicher <b>Vergleiche</b> seitens der oberen Führungsebene, Abhängigkeit von externen Plattformen und fehlende Aufgabensichtbarkeit sowie <b>Dringlichkeitsgefühl</b>. Der Startbildschirm für jedes Zugriffsprofil war nicht nützlich, daher brachten wir ein Dashboard mit allen notwendigen Funktionen und <b>schnellem Zugriff</b> auf weitere Systemfunktionen und tägliche Workflows.",
      note: null,
    },
    {
      title: "Benachrichtigungszentrale",
      desc: "Einheitliches System für Benachrichtigungen und kontextuelle Hinweise.",
      note: "Der Kunde hatte zuvor keine Benachrichtigungsfunktion. Alle Kommunikation erfolgte extern über eine andere Anwendung.",
    },
  ],
};

const designScreens = computed(() => {
  const imgs = [
    {
      url: "unica.rodobens.com.br/login",
      img: loginImg,
      oldImg: loginAntigoImg,
    },
    {
      url: "unica.rodobens.com.br/simulador",
      img: simulacaoImg,
      oldImg: simulacaoAntigaImg,
    },
    {
      url: "unica.rodobens.com.br/kanban",
      img: kanbanImg,
      oldImg: negociacaoAntigaImg,
    },
    { url: "unica.rodobens.com.br/analise", img: creditDashImg, oldImg: null },
    {
      url: "unica.rodobens.com.br/notificacoes",
      img: notifImg,
      oldImg: menuAntigoImg,
    },
  ];
  const texts = screensCopy[lang.value] || screensCopy["PT"];
  return texts.map((s, i) => ({ ...s, ...imgs[i] }));
});
const tocItems = computed(() => [
  { num: "01", label: t.value.overviewLabel, id: "rc-overview" },
  { num: "02", label: t.value.discoveryLabel, id: "rc-discovery" },
  { num: "03", label: t.value.designLabel, id: "rc-design" },
  { num: "04", label: t.value.delivLabel, id: "rc-deliverables" },
  { num: "05", label: t.value.reflexLabel, id: "rc-reflexoes" },
]);

const palette = [
  { name: "Primary Green", hex: "#0A5331" },
  { name: "Secondary Green", hex: "#05B44C" },
  { name: "Orange CTA", hex: "#FF7C43" },
];

const copy = {
  PT: {
    back: "Voltar ao portfólio",
    tocLabel: "Conteúdo",
    tag: "UX · Business Design · Systems",
    btnBefore: "Como era antes",
    btnAfter: "Ver versão nova",
    title: "Descomplicando<br><em>o Legado.</em>",
    subtitle:
      "Redesenhei a plataforma operacional central da Rodobens do zero — um sistema legado carregando <b>7 anos de débito acumulado</b>, <b>100+ bugs documentados</b> e <b>603 usuários ativos</b> absorvendo o custo diário de travamentos, ausência de automação e fluxos fragmentados. O resultado: <b>100+ telas desenhadas</b>, regras de negócio e acesso corretamente aplicadas por perfil, e uma <b>plataforma integrada</b> substituindo um mosaico de dependências externas.",
    accentLine:
      "Mapeamento de 129 perfis de acesso e tradução de regras de negócio complexas em jornadas de usuário escaláveis",
    context:
      "Equipe transformou um sistema legado de 7 anos — fragmentado e travando — em uma plataforma coesa.",
    roles: [
      "UX Design",
      "Business Design",
      "Research",
      "Facilitação",
      "Handoff",
    ],
    stats: {
      profiles: "perfis mapeados",
      users: "usuários ativos",
      months: "meses de projeto",
      legacy: "anos de legado",
    },
    complaintsLabel: "Principais queixas dos usuários",
    complaints: [
      "Lentidão extrema e crashes constantes do sistema",
      "Falta de automação em diversos processos críticos",
      "Mensagens de erro confusas e feedback limitado ou inexistente",
      "Tela inicial irrelevante e lenta — não era utilizada no dia a dia",
      "Dificuldade e ineficiência no upload de documentos",
      "Ausência de relatórios em tempo real — dependência de planilhas e apps externos",
    ],
    discoveryLabel: "Discovery & Mapeamento",
    discoveryBody:
      'Cada entrevista era seguida de uma revisão aprofundada da gravação. Mapeei a jornada de cada usuário individualmente, identificando lacunas de usabilidade, dores recorrentes e comportamentos não documentados do sistema que não teriam emergido por um formulário ou pesquisa.<br><br>Para acelerar o processo com mais de 3 horas de entrevistas, utilizei transcrição assistida por IA — garantindo que nenhum bug ou caso de borda se perdesse no volume de dados. O resultado foi um user flow abrangente consolidando os achados em uma visão clara do estado atual.<br><br>A partir daí, o time de design conduziu uma design critique estruturada sobre o user flow. Cada membro trouxe sua expertise — sinalizando inconsistências de UI, pontos de atrito de UX e lacunas na jornada futura. Essa camada colaborativa apurou o diagnóstico antes que qualquer tela fosse desenhada.<br><br>Cada achado tinha um destino. Os pain points mapeados nas entrevistas não eram sintomas para documentar — eram insumos que moldaram diretamente as decisões de design.<br><br><b>Feedback & Notificações</b> — Géssica acumulava 37 notificações não lidas, a maioria irrelevante, várias referenciando pessoas que já tinham saído da empresa. O sistema não tinha mecanismo para gerenciar, filtrar ou limpar. Isso direcionou a decisão de redesenhar a central de notificações com gerenciamento ativo: filtros de relevância, limpeza automática por status do usuário e navegação direta ao registro relacionado ao clicar.<br><br><b>Automação</b> — Solicitações de baixa de crivo e precificação eram coordenadas via grupos de WhatsApp, com vendedores pedindo para equipes de suporte verificarem negociações fora da plataforma. Isso direcionou a decisão de trazer todo o fluxo para dentro da plataforma, eliminando o loop externo e centralizando solicitações, aprovações e rastreamento de status em um único lugar.<br><br><b>Dependência Externa</b> — Para evitar "poluir" o sistema com múltiplos cenários de precificação, a equipe rodava cálculos no Excel e só inseria o resultado final na formalização. A plataforma era contornada no momento mais crítico do fluxo. Isso direcionou a decisão de construir um simulador de crédito nativo com cálculo em tempo real — cada cenário vive dentro do sistema, visível e rastreável.<br><br><b>Arquitetura de Informação</b> — A design critique revelou quatro problemas estruturais na interface legada: barras de busca separadas das tabelas, ícones sem título com espaçamento insuficiente, títulos de tabela desalinhados e empty states sem orientação. Cada um era um ponto de atrito acumulando-se em centenas de interações diárias. Isso direcionou quatro decisões diretas: filtros inline contextualizados por coluna, labels obrigatórias em todos os ícones de ação, grid tipográfico consistente com densidade ajustada, e empty states orientados com microcopy e CTAs contextuais por seção.',
    discoveryImg1Caption:
      "User flow construído a partir dos dados das entrevistas",
    discoveryImg2Caption: "Sessão de design critique com o time de design",
    discoveryQuote:
      '"Se por um acaso a gente errou alguma informação aqui, sem querer, ou do chassi, ou alguma informação aqui e a formalização identifica isso lá na área deles, a gente tem que cancelar a formalização e começar a preencher tudo do zero. Não tem como a gente corrigir só uma informação." — Gabriella, analista de crédito',
    discoveryQuoteNote:
      "O sistema não tinha fallback state, autosave nem prevenção de erros. Um campo errado em qualquer ponto de um formulário de múltiplos campos significava reiniciar o processo inteiro. Isso direcionou quatro decisões: campos editáveis após envio, autosave em cada etapa, validação inline com feedback contextual e estados de confirmação antes de ações destrutivas.",
    overviewLabel: "Sobre o Projeto",
    overviewBody:
      "O projeto consistiu na <b>modernização do sistema</b> interno do Grupo Rodobens, líder brasileiro com 75 anos de história no setor financeiro e varejo automotivo. O ecossistema abrange desde financiamentos convencionais (CDC) até modelos complexos como o Plano Pontual e Finame. Juntamente com o time de produtos da NV8, minha atuação foi focada na <b>modernização das telas</b> a partir do <b>redesenho do fluxo de usuário</b> com base nas <b>regras de negócio</b>, <b>entrevistas com usuários</b> e <b>intermediação das expectativas dos stakeholders</b>, equilibrando o que era <b>essencial</b> para o negócio com o que era <b>viável dentro do prazo/b>.",
    deliverables: [
      "Discovery & Research",
      "Mapeamento AS IS × TO BE",
      "Arquitetura de Informação",
      "Protopersonas",
      "User Flow Design",
      "Wireframes & UI Design",
    ],
    triads: [
      {
        title: "O Conflito",
        body: "Falta de documentação das regras de negócio causaram lentidão na fase de discovery e retrabalhos na operação de telas e mapeamento de fluxos.",
      },
      {
        title: "A Decisão",
        body: "Discovery Ágil utilizando a técnica de Shadowing para mapear microprocessos e descobrir o que os usuários faziam de verdade — não só o que relatavam nas entrevistas — através de sessões online com usuários-chave. Criação de Userflows detalhados que serviram como documentação técnica tanto para Design quanto para Engenharia.",
      },
      {
        title: "Trade-off",
        body: "Foi necessário sacrificar o research exploratório amplo em favor de sprints de discovery direcionados às dores mais críticas do dia a dia operacional, resolvendo primeiro o que travava 603 pessoas todos os dias.",
      },
    ],
    designLabel: "Solução de Design",
    designIntro:
      "Durante o discovery e mapeamento dos perfis de acesso, optamos pela utilização da library <b>Nuxt UI v.3</b> adaptada para o cliente visando a redução do tempo em produção e iteração de componentes. O uso de uma lib no projeto também facilita a escalabilidade de projetos internos. O sistema cresceu em cima de si mesmo por 7 anos — sem padrão, sem hierarquia, e com fluxos que exigiam 6 cliques para tarefas que deveriam ter 2..",
    principlesLabel: "Melhorias percebidas",
    dsBannerTitle:
      "De HTML legacy a Design System moderno: evolução guiada por dados de usuário",
    dsBannerSub:
      "Utilizamos Nuxt UI v3 como fundação, customizando componentes estrategicamente para atender as necessidades específicas do setor financeiro e os 603 usuários da plataforma.",
    principles: [
      {
        title: "Redução de Carga Cognitiva",
        body: "De overload informacional para hierarquia clara e respirável",
        color: "#F0185A",
      },
      {
        title: "Escaneabilidade Aumentada",
        body: "Analistas identificam status críticos em segundos — vs. varredura manual linha a linha no legado",
        color: "#0CFDB5",
      },
      {
        title: "Redução de Fadiga Visual",
        body: "Densidade ajustada por perfil — menos ruído visual, mais foco no que importa para cada função",
        color: "#FF7C43",
      },
      {
        title: "Formulários Progressivos",
        body: "Formulários progressivos em 4–5 etapas — contribuíram para a queda de 25% em erros de digitação",
        color: "#F0185A",
      },
      {
        title: "Tomada de Decisão Acelerada",
        body: "Analistas identificam red flags em segundos via badges e cores semânticas",
        color: "#0CFDB5",
      },
      {
        title: "Confiança Financeira",
        body: "Cálculos visíveis em tempo real com breakdown de valores aumentam transparência",
        color: "#FF7C43",
      },
    ],
    decisionTitle: "Decisão Estratégica: Biblioteca vs. Custom",
    decisionSub: "Por que escolhemos Nuxt UI v3 como fundação:",
    decisionBenefitsTitle: "Benefícios da Biblioteca",
    decisionBenefits: [
      {
        label: "Velocidade:",
        body: "Componentes base prontos reduziram 40% do tempo de implementação",
      },
      {
        label: "Customização controlada:",
        body: "Token system permitiu adaptação à identidade Rodobens mantendo consistência",
      },
      {
        label: "Acessibilidade nativa:",
        body: "WCAG 2.1 AA out-of-the-box (crítico para sistema financeiro)",
      },
      {
        label: "Responsividade intrínseca:",
        body: "Garantia de funcionamento cross-device",
      },
    ],
    decisionCustomTitle: "O que Customizamos",
    decisionCustom: [
      {
        color: "#0A5331",
        label: "Paleta:",
        body: "Adaptação dos greens Rodobens (#0A5331, #05B44C) + orange CTA (#FF7C43)",
      },
      {
        color: "#05B44C",
        label: "Componentes financeiros:",
        body: "Simulador de crédito, cards de análise, status badges",
      },
      {
        color: "#FF7C43",
        label: "Densidade de informação:",
        body: "Ajustes de spacing para contexto B2B",
      },
      {
        color: "#111827",
        label: "Validações contextuais:",
        body: "Regras de negócio específicas do setor financeiro",
      },
    ],
    decisionQuote:
      "A escolha de Nuxt UI v3 não foi sobre economizar tempo — foi sobre investir o tempo certo no que realmente importava: entender as 129 permissões de acesso, traduzir regras de negócio complexas em interfaces intuitivas, e garantir que cada componente refletisse as necessidades reais dos 603 usuários.",
    compsTitle: "Componentes-Chave do Sistema",
    badge1: "Aprovado",
    badge2: "Pendente",
    badge3: "Vencido",
    badge4: "Em Análise",
    tableFeatures: [
      "Sorting multi-coluna",
      "Filtros intuitivos",
      "Paginação otimizada",
      "Ações contextuais por linha",
    ],
    tableNote: "Densidade ajustada para dados financeiros",
    formNote: "Máscaras para CPF/CNPJ e valores monetários",
    paletteTitle: "Paleta de Cores",
    typographyTitle: "Tipografia",
    componentsTitle: "Componentes",
    delivLabel: "Entregáveis & Resultados",
    delivHeading: "O que foi entregue",
    delivList: [
      "Discovery completo com mapeamento de 129 perfis",
      "User flows documentados (AS IS × TO BE)",
      "Wireframes de todas as telas principais",
      "Telas finais navegáveis de 8 perfis de acesso (além do contrato inicial de wireframes)",
      "Regras de negócio documentadas",
      "Sistema escalável com possibilidade de adição de novas features",
    ],
    delivQuote:
      "Entregamos telas navegáveis versão final, além do contrato que previa wireframes, bem como toda a documentação das regras de negócio, fluxos validados e um sistema que as pessoas conseguem usar de verdade — sem workarounds, sem WhatsApp como ferramenta de trabalho.",
    impactHeading: "Impacto do Projeto",
    impactHeading: "Impacto do Projeto",
    impactMethodology:
      "Medir o sucesso de uma plataforma como essa exigiu uma abordagem <b>própria</b>. O tempo total de jornada não era um indicador confiável — variáveis externas como resposta do cliente, assinaturas e aprovações de terceiros distorciam qualquer medição. Medimos então cada tarefa <b>separadamente</b> dentro da mesma jornada e aplicamos um NPS ao final de cada jornada completa, pedindo ao usuário a <b>percepção</b> de tempo estimado em relação ao legado. Classificamos as respostas em: muito ruim (−10%), ruim (−5%), igual (0%), mais rápido (+5%) e muito mais rápido (+10%). 311 de 603 usuários responderam.",
    metrics: [
      {
        num: "42%",
        label:
          "ganho percebido de eficiência na jornada de cadastro — melhor resultado do NPS",
      },
      {
        num: "31%",
        label: "ganho percebido de eficiência na jornada de simulação",
      },
      {
        num: "92%",
        label:
          "redução no tempo de cadastro com integração nativa vs. cópia manual anterior",
      },
      {
        num: "25%",
        label: "queda nas propostas devolvidas por erro de digitação",
      },
      {
        num: "311",
        label: "usuários responderam ao NPS de percepção de tempo",
      },
    ],
    reflexLabel: "Reflexões & Aprendizados",
    teamHeading: "Equipe",
    team: [
      { role: "UX Designer Pleno", name: "Tayná" },
      { role: "Designer Júnior", name: "Colaborador" },
      { role: "Líder de Design", name: "Mentor" },
      { role: "Business Analyst", name: "Equipe de Negócios" },
      { role: "Desenvolvedor", name: "Equipe de Desenvolvimento" },
    ],
    reflexoes: [
      {
        question: "Qual foi o conflito real que você resolveu?",
        answer:
          "Um stakeholder defendeu uma tela inicial genérica e igual para todos os perfis de usuário para acelerar a entrega. Defendi o contrário — um dashboard personalizado por perfil de acesso. O argumento tinha três camadas: primeiro, o uso de Nuxt UI v3 significava que a versão personalizada não exigiria tempo extra de prototipação; segundo, os atalhos de acesso rápido personalizados eliminariam diretamente a dor mais unânime de todas as entrevistas — uma tela inicial que os próprios usuários descreviam como inútil; terceiro, uma tela em branco ou estática replicaria exatamente o fracasso do sistema legado que estávamos substituindo, e a tela inicial é a primeira coisa que 603 usuários veem todos os dias. O stakeholder aceitou o argumento. O dashboard personalizado foi entregue.",
      },
      {
        question: "O que abriu mão para resolvê-lo?",
        answer:
          "Sacrifiquei pesquisa exploratória de longo prazo e relatórios extensos, priorizando shadowing intensivo, entrevistas direcionadas e documentação viva através de user flows — ferramentas que serviam simultaneamente ao time de design e engenharia. Uma pesquisa mais ampla teria gerado dados melhores. Um discovery focado gerou os dados certos no momento certo.",
      },
      {
        question: "Maturidade demonstrada",
        answer:
          "Defender uma decisão de design sob pressão de prazo — com argumento técnico (biblioteca reduz tempo de implementação), argumento de usuário (100% dos entrevistados apontaram a tela inicial) e argumento de negócio (repetir o padrão legado minaria a confiança no novo sistema) — e conseguir os três. Alinhamento entre expectativas da diretoria e realidade dos 603 usuários. Atuação como elo entre necessidades do cliente e viabilidade do produto em integrações complexas (B3, Autbank).",
      },
    ],
    footerTag: "Rodobens Unica Platform · 2026",
  },
  EN: {
    back: "Back to portfolio",
    tocLabel: "Contents",
    tag: "UX · Business Design · Systems",
    btnBefore: "How it was before",
    btnAfter: "See new version",
    title: "Untangling<br><em>the Legacy.</em>",
    subtitle:
      "I redesigned Rodobens' core operational platform from the ground up — a legacy system carrying <b>7 years of accumulated debt</b>, <b>100+ documented bugs</b>, and <b>603 active users</b> absorbing the daily cost of crashes, missing automation, and fragmented workflows. The result: <b>100+ screens designed</b>, business and access rules properly enforced by profile, and a <b>single integrated platform</b> replacing a patchwork of external dependencies.",
    accentLine:
      "Mapping 129 access profiles and translating complex business rules into scalable user journeys",
    context:
      "The team transformed a 7-year-old fragmented legacy system into a cohesive platform.",
    roles: [
      "UX Design",
      "Business Design",
      "Research",
      "Facilitation",
      "Handoff",
    ],
    stats: {
      profiles: "profiles mapped",
      users: "active users",
      months: "months of project",
      legacy: "years of legacy",
    },
    complaintsLabel: "Main user complaints",
    complaints: [
      "Extreme slowness and constant system crashes",
      "Lack of automation in several critical processes",
      "Confusing error messages and limited or no feedback",
      "Irrelevant and slow home screen — not used in day-to-day work",
      "Difficulty and inefficiency in document uploads",
      "No real-time reports — dependency on spreadsheets and external apps",
    ],
    discoveryLabel: "Discovery & Mapping",
    discoveryBody:
      "Every interview was followed by a deep review of the recording. I mapped each user's journey individually, identifying usability gaps, recurring pain points, and undocumented system behaviors that wouldn't have surfaced through a form or a survey.<br><br>To accelerate the process across 3+ hours of interviews, I used AI-assisted transcription — ensuring no bug or edge case was lost in the volume of data. The result was a comprehensive user flow consolidating the findings into a clear picture of the current state.<br><br>From there, the design team ran a structured design critique over the user flow. Each team member brought their own expertise to the table — flagging UI inconsistencies, UX friction points, and gaps in the to-be journey. This collaborative layer sharpened the diagnosis before a single screen was designed.<br><br>Every finding had a destination. The pain points mapped in interviews weren't symptoms to document — they were inputs that directly shaped design decisions.<br><br><b>Feedback & Notifications</b> — Géssica had 37 unread notifications, most of them irrelevant, several referencing people who had already left the company. The system had no mechanism to manage, filter, or clear them. This drove the decision to redesign the notification center with active management: relevance filters, automatic cleanup by user status, and direct navigation to the related record on click.<br><br><b>Automation</b> — Credit reduction requests and pricing were being coordinated via WhatsApp groups, with vendors asking support teams to verify negotiations outside the platform. This drove the decision to bring the entire flow inside the platform, eliminating the external loop and centralizing requests, approvals, and status tracking in one place.<br><br><b>External Dependency</b> — To avoid \"polluting\" the system with multiple pricing scenarios, the team was running calculations in Excel and only entering the final result at formalization. The platform was being bypassed at the most critical moment of the workflow. This drove the decision to build a native credit simulator with real-time calculation — every scenario lives inside the system, visible and traceable.<br><br><b>Information Architecture</b> — The design critique revealed four structural problems in the legacy interface: search bars separated from their tables, unlabeled icons with insufficient spacing, misaligned table headers, and empty states with no guidance. Each was a friction point compounding over hundreds of daily interactions. These drove four direct decisions: inline filters contextualized by column, mandatory labels on all action icons, a consistent typographic grid with adjusted density, and oriented empty states with contextual CTAs per section.",
    discoveryImg1Caption: "User pain points mapped from interview data",
    discoveryImg2Caption: "Design critique session with the design team",
    discoveryQuote:
      '"If we accidentally entered the wrong information — the chassis number, anything — and formalization catches it on their end, we have to cancel the entire formalization and start filling everything from scratch. There\'s no way to correct just one field." — Gabriella, credit analyst',
    discoveryQuoteNote:
      "The system had no fallback state, no autosave, and no error prevention. A single wrong field at any point in a multi-step form meant restarting the entire process. This drove four decisions: editable fields post-submission, autosave at every step, inline validation with contextual feedback, and confirmation states before destructive actions.",
    overviewLabel: "About the Project",
    overviewBody:
      "The project consisted of <b>modernizing the internal system</b> of Rodobens Group, a Brazilian leader with 75 years of history in the financial and automotive retail sector. The ecosystem spans from conventional financing (CDC) to complex models such as Plano Pontual and Finame. Together with the NV8 product team, my role was focused on <b>modernizing the screens</b> through the <b>redesign of user flows</b> based on <b>business rules</b>, <b>user interviews</b>, and <b>stakeholder expectation management</b>, balancing what was <b>essential</b> for the business with what was <b>viable within the project timeline</b>.",
    deliverables: [
      "Discovery & Research",
      "AS IS × TO BE Mapping",
      "Information Architecture",
      "Proto-Personas",
      "User Flow Design",
      "Wireframes & UI Design",
    ],
    triads: [
      {
        title: "The Conflict",
        body: "Lack of business rule documentation slowed down the discovery phase and caused rework in screen operations and flow mapping.",
      },
      {
        title: "The Decision",
        body: "Agile Discovery using the Shadowing technique to map microprocesses to uncover what users actually did — not just what they reported in interviews — through online sessions with key users. Creation of detailed Userflows that served as technical documentation for both Design and Engineering.",
      },
      {
        title: "Trade-off",
        body: "Broad exploratory research had to be sacrificed in favor of targeted discovery sprints focused on the most critical day-to-day operational pain points, solving first what was blocking 603 people every single day.",
      },
    ],
    designLabel: "Design Solution",
    designIntro:
      "During the discovery and access profile mapping, we chose to use the <b>Nuxt UI v.3</b> library adapted for the client to reduce production time and component iteration. Using a library also facilitates scalability for internal projects. The system had grown on top of itself for 7 years — no standards, no hierarchy, and flows that required 6 clicks for tasks that should have taken 2..",
    principlesLabel: "Perceived Improvements",
    dsBannerTitle:
      "From legacy HTML to modern Design System: evolution guided by user data",
    dsBannerSub:
      "We used Nuxt UI v3 as foundation, strategically customizing components to meet the specific needs of the financial sector and the 603 platform users.",
    principles: [
      {
        title: "Cognitive Load Reduction",
        body: "From information overload to clear, breathable hierarchy",
        color: "#F0185A",
      },
      {
        title: "Increased Scannability",
        body: "Analysts identify critical statuses in seconds — vs. manual line-by-line scanning in the legacy system",
        color: "#0CFDB5",
      },
      {
        title: "Visual Fatigue Reduction",
        body: "Density adjusted per profile — less visual noise, more focus on what matters for each role",
        color: "#FF7C43",
      },
      {
        title: "Progressive Forms",
        body: "Progressive forms in 4–5 steps — contributed to the 25% drop in data entry errors",
        color: "#F0185A",
      },
      {
        title: "Accelerated Decision-Making",
        body: "Analysts identify red flags in seconds via badges and semantic colors",
        color: "#0CFDB5",
      },
      {
        title: "Financial Confidence",
        body: "Real-time visible calculations with value breakdowns increase transparency",
        color: "#FF7C43",
      },
    ],
    decisionTitle: "Strategic Decision: Library vs. Custom",
    decisionSub: "Why we chose Nuxt UI v3 as foundation:",
    decisionBenefitsTitle: "Library Benefits",
    decisionBenefits: [
      {
        label: "Speed:",
        body: "Ready base components reduced 40% of implementation time",
      },
      {
        label: "Controlled customization:",
        body: "Token system allowed adaptation to Rodobens identity while maintaining consistency",
      },
      {
        label: "Native accessibility:",
        body: "WCAG 2.1 AA out-of-the-box (critical for financial systems)",
      },
      {
        label: "Intrinsic responsiveness:",
        body: "Guaranteed cross-device functionality",
      },
    ],
    decisionCustomTitle: "What We Customized",
    decisionCustom: [
      {
        color: "#0A5331",
        label: "Color palette:",
        body: "Adaptation of Rodobens greens (#0A5331, #05B44C) + orange CTA (#FF7C43)",
      },
      {
        color: "#05B44C",
        label: "Financial components:",
        body: "Credit simulator, analysis cards, status badges",
      },
      {
        color: "#FF7C43",
        label: "Information density:",
        body: "Spacing adjustments for B2B context",
      },
      {
        color: "#111827",
        label: "Contextual validations:",
        body: "Business rules specific to the financial sector",
      },
    ],
    decisionQuote:
      "The choice of Nuxt UI v3 wasn't about saving time — it was about investing the right time in what truly mattered: understanding the 129 access permissions and translating complex business rules into intuitive interfaces.",
    compsTitle: "Key System Components",
    badge1: "Approved",
    badge2: "Pending",
    badge3: "Overdue",
    badge4: "In Review",
    tableFeatures: [
      "Multi-column sorting",
      "Intuitive filters",
      "Optimized pagination",
      "Contextual row actions",
    ],
    tableNote: "Density adjusted for financial data",
    formNote: "Masks for tax IDs and monetary values",
    paletteTitle: "Color Palette",
    typographyTitle: "Typography",
    componentsTitle: "Components",
    delivLabel: "Deliverables & Results",
    delivHeading: "What was delivered",
    delivList: [
      "Full discovery with mapping of 129 profiles",
      "Documented user flows (AS IS × TO BE)",
      "Wireframes for all main screens",
      "Final navigable screens (beyond the initial wireframe contract)",
      "Documented business rules",
      "Scalable system with the ability to add new features",
    ],
    delivQuote:
      "We delivered final navigable screens, beyond the wireframe contract, as well as full business rule documentation, validated flows, and a system people can actually use — no workarounds, no WhatsApp as a work tool.",
    impactHeading: "Project Impact",
    impactMethodology:
      "Measuring success in a platform like this required a <b>custom</b> approach. Full journey time was unreliable as a metric — too many external variables like client response time, document signing, and third-party approvals. So we measured each task <b>individually</b> within the same journey, then applied an NPS at the end of each completed journey asking users to estimate <b>perceived</b> time compared to the legacy system. We classified responses as: much worse (−10%), worse (−5%), same (0%), faster (+5%), or much faster (+10%). 311 of 603 users responded.",
    metrics: [
      {
        num: "42%",
        label: "perceived efficiency gain on the registration journey",
      },
      {
        num: "72%",
        label: "perceived efficiency gain on the simulation journey",
      },
      {
        num: "92%",
        label:
          "reduction in registration time with native integration vs. previous manual copy",
      },
      {
        num: "25%",
        label: "drop in proposals returned due to data entry errors",
      },
      { num: "311", label: "users responded to the perceived time NPS" },
    ],
    reflexLabel: "Reflections & Learnings",
    teamHeading: "Team",
    team: [
      { role: "UX Designer (Mid)", name: "Tayná" },
      { role: "Junior Designer", name: "Collaborator" },
      { role: "Design Lead", name: "Mentor" },
      { role: "Business Analyst", name: "Business Team" },
      { role: "Developer", name: "Development Team" },
    ],
    reflexoes: [
      {
        question: "What was the real conflict you solved?",
        answer:
          "A stakeholder pushed for a single, generic home screen across all user profiles to speed up delivery. I pushed back — and defended a personalized dashboard per access profile. My argument had three layers: first, using Nuxt UI v3 meant the personalized version required no extra prototyping time; second, quick-access shortcuts tailored to each profile would directly eliminate the most universally reported pain point from interviews — a home screen that users described as completely useless; third, a blank or static home screen would have replicated the exact failure of the legacy system we were replacing, and the home screen is the first thing 603 users see every single day. The stakeholder accepted the argument. The personalized dashboard shipped.",
      },
      {
        question: "What did you give up to solve it?",
        answer:
          "I sacrificed long-term exploratory research and extensive reports, prioritizing intensive shadowing, targeted interviews, and living documentation through user flows — tools that served both the design and engineering teams simultaneously. Broad research would have produced better data. Focused discovery produced the right data at the right time.",
      },
      {
        question: "Demonstrated maturity",
        answer:
          "Defending a design decision under delivery pressure — with a technical argument (library reduces implementation time), a user argument (100% of interviewees flagged the home screen), and a business argument (repeating the legacy pattern would undermine trust in the new system) — and landing all three. Aligning board expectations with the reality of 603 users. Acting as the link between client needs and product feasibility across complex integrations (B3, Autbank).",
      },
    ],
    footerTag: "Rodobens Unica Platform · 2026",
  },
  ES: {
    back: "Volver al portafolio",
    tocLabel: "Contenido",
    tag: "UX · Business Design · Systems",
    btnBefore: "Cómo era antes",
    btnAfter: "Ver versión nueva",
    title: "Desenredando<br><em>el Legado.</em>",
    subtitle:
      "Rediseñé la plataforma operacional central de Rodobens desde cero — un sistema legado con <b>7 años de deuda acumulada</b>, <b>más de 100 bugs documentados</b> y <b>603 usuarios activos</b> absorbiendo el costo diario de bloqueos, falta de automatización y flujos fragmentados. El resultado: <b>más de 100 pantallas diseñadas</b>, reglas de negocio y acceso correctamente aplicadas por perfil, y una <b>plataforma integrada</b> que reemplaza un conjunto de dependencias externas.",
    accentLine:
      "Mapeo de 129 perfiles de acceso y traducción de reglas de negocio complejas en journeys de usuario escalables",
    context:
      "El equipo transformó un sistema legado de 7 años — fragmentado y con bloqueos — en una plataforma cohesiva.",
    roles: [
      "UX Design",
      "Business Design",
      "Research",
      "Facilitación",
      "Handoff",
    ],
    stats: {
      profiles: "perfiles mapeados",
      users: "usuarios activos",
      months: "meses de proyecto",
      legacy: "años de legado",
    },
    complaintsLabel: "Principales quejas de los usuarios",
    complaints: [
      "Lentitud extrema y caídas constantes del sistema",
      "Falta de automatización en varios procesos críticos",
      "Mensajes de error confusos y feedback limitado o inexistente",
      "Pantalla de inicio irrelevante y lenta — no se usaba en el día a día",
      "Dificultad e ineficiencia en la carga de documentos",
      "Sin informes en tiempo real — dependencia de hojas de cálculo y apps externas",
    ],
    discoveryLabel: "Discovery & Mapeo",
    discoveryBody:
      'Cada entrevista fue seguida de una revisión profunda de la grabación. Mapeé el recorrido de cada usuario individualmente, identificando brechas de usabilidad, puntos de dolor recurrentes y comportamientos del sistema no documentados que no habrían surgido a través de un formulario o encuesta.<br><br>Para acelerar el proceso en más de 3 horas de entrevistas, utilicé transcripción asistida por IA — garantizando que ningún bug o caso límite se perdiera en el volumen de datos. El resultado fue un user flow integral que consolidó los hallazgos en una imagen clara del estado actual.<br><br>A partir de ahí, el equipo de diseño realizó una design critique estructurada sobre el user flow. Cada miembro aportó su propia experiencia — señalando inconsistencias de UI, puntos de fricción de UX y brechas en el recorrido futuro. Esta capa colaborativa agudizó el diagnóstico antes de que se diseñara una sola pantalla.<br><br>Cada hallazgo tenía un destino. Los pain points mapeados en las entrevistas no eran síntomas para documentar — eran insumos que moldearon directamente las decisiones de diseño.<br><br><b>Feedback & Notificaciones</b> — Géssica acumulaba 37 notificaciones no leídas, la mayoría irrelevantes, varias referenciando personas que ya habían salido de la empresa. El sistema no tenía mecanismo para gestionar, filtrar o limpiarlas. Esto impulsó la decisión de rediseñar la central de notificaciones con gestión activa: filtros de relevancia, limpieza automática por estado del usuario y navegación directa al registro relacionado al hacer clic.<br><br><b>Automatización</b> — Las solicitudes de baja de crivo y la precificación se coordinaban vía grupos de WhatsApp, con vendedores pidiendo a equipos de soporte que verificaran negociaciones fuera de la plataforma. Esto impulsó la decisión de traer todo el flujo dentro de la plataforma, eliminando el loop externo y centralizando solicitudes, aprobaciones y seguimiento de estado en un solo lugar.<br><br><b>Dependencia Externa</b> — Para evitar "contaminar" el sistema con múltiples escenarios de precificación, el equipo realizaba cálculos en Excel y solo ingresaba el resultado final en la formalización. Esto impulsó la decisión de construir un simulador de crédito nativo con cálculo en tiempo real.<br><br><b>Arquitectura de Información</b> — La design critique reveló cuatro problemas estructurales: barras de búsqueda separadas de las tablas, íconos sin etiqueta con espaciado insuficiente, títulos de tabla desalineados y empty states sin orientación. Esto impulsó cuatro decisiones directas: filtros inline contextualizados, etiquetas obligatorias en todos los íconos, grilla tipográfica consistente y empty states orientados con microcopy contextual.',
    discoveryImg1Caption:
      "User flow construido a partir de los datos de las entrevistas",
    discoveryImg2Caption: "Sesión de design critique con el equipo de diseño",
    discoveryQuote:
      '"Si por casualidad ingresamos información incorrecta aquí — el número de chasis, cualquier dato — y la formalización lo detecta en su área, tenemos que cancelar toda la formalización y comenzar a llenar todo desde cero. No hay forma de corregir solo un campo." — Gabriella, analista de crédito',
    discoveryQuoteNote:
      "El sistema no tenía fallback state, autosave ni prevención de errores. Un campo incorrecto en cualquier punto del formulario significaba reiniciar todo el proceso. Esto impulsó cuatro decisiones: campos editables post-envío, autosave en cada etapa, validación inline con feedback contextual y estados de confirmación antes de acciones destructivas.",
    overviewLabel: "Sobre el Proyecto",
    overviewBody:
      "El proyecto consistió en la <b>modernización del sistema</b> interno del Grupo Rodobens, líder brasileño con 75 años de historia en el sector financiero y retail automotriz. El ecosistema abarca desde financiamientos convencionales (CDC) hasta modelos complejos como el Plano Pontual y Finame. Junto al equipo de producto de NV8, mi rol se centró en la <b>modernización de las pantallas</b> a partir del <b>rediseño del flujo de usuario</b> con base en las <b>reglas de negocio</b>, <b>entrevistas con usuarios</b> y <b>gestión de expectativas de stakeholders</b>, Se trataba de encontrar el equilibrio entre lo <b>esencial</b> para el negocio y lo que era <b>factible</b> dentro del tiempo total del proyecto</b>.",
    deliverables: [
      "Discovery & Research",
      "Mapeo AS IS × TO BE",
      "Arquitectura de Información",
      "Proto-Personas",
      "User Flow Design",
      "Wireframes & UI Design",
    ],
    triads: [
      {
        title: "El Conflicto",
        body: "La falta de documentación de las reglas de negocio generó lentitud en la fase de discovery y retrabajo en la operación de pantallas y mapeo de flujos.",
      },
      {
        title: "La Decisión",
        body: "Discovery Ágil utilizando la técnica de Shadowing para mapear microprocesos y Descubrir qué hicieron realmente los usuarios —y no solo lo que declararon en las entrevistas— mediante sesiones en línea con usuarios clave. Creación de Userflows detallados que funcionaron como documentación técnica tanto para Diseño como para Ingeniería.",
      },
      {
        title: "Trade-off",
        body: "Fue necesario sacrificar la investigación exploratoria amplia en favor de sprints de discovery dirigidos a los problemas más críticos del día a día operacional, priorizando las soluciones críticas dentro del tiempo total de proyecto.",
      },
    ],
    designLabel: "Solución de Diseño",
    designIntro:
      "Durante el discovery y mapeo de perfiles de acceso, optamos por utilizar la librería <b>Nuxt UI v.3</b> adaptada para el cliente, con el objetivo de reducir el tiempo de producción e iteración de componentes. El uso de una lib en el proyecto también facilita la escalabilidad de proyectos internos. El sistema actual del cliente fue construido a base de remiendos, por lo que el layout no seguía estandarizaciones ni jerarquías, y requería muchos pasos para realizar tareas simples.",
    principlesLabel: "Mejoras percibidas",
    dsBannerTitle:
      "De HTML legacy a Design System moderno: evolución guiada por datos de usuario",
    dsBannerSub:
      "Usamos Nuxt UI v3 como base, personalizando componentes estratégicamente para satisfacer las necesidades específicas del sector financiero y los 603 usuarios de la plataforma.",
    principles: [
      {
        title: "Reducción de Carga Cognitiva",
        body: "De sobrecarga informacional a jerarquía clara y respirable",
        color: "#F0185A",
      },
      {
        title: "Escaneabilidad Aumentada",
        body: "Los usuarios identifican prioridades en 3 segundos vs. 30+ segundos antes",
        color: "#0CFDB5",
      },
      {
        title: "Reducción de Fatiga Visual",
        body: "Tablas con ~20 filas vs. ~50 comprimidas, mejorando la precisión de lectura",
        color: "#FF7C43",
      },
      {
        title: "Formularios Progresivos",
        body: "División de ~50 campos en 4–5 pasos lógicos, reduciendo la tasa de abandono",
        color: "#F0185A",
      },
      {
        title: "Toma de Decisiones Acelerada",
        body: "Los analistas identifican red flags en segundos vía badges y colores semánticos",
        color: "#0CFDB5",
      },
      {
        title: "Confianza Financiera",
        body: "Cálculos visibles en tiempo real con desglose de valores aumentan la transparencia",
        color: "#FF7C43",
      },
    ],
    decisionTitle: "Decisión Estratégica: Librería vs. Custom",
    decisionSub: "¿Por qué elegimos Nuxt UI v3 como base?",
    decisionBenefitsTitle: "Beneficios de la Librería",
    decisionBenefits: [
      {
        label: "Velocidad:",
        body: "Componentes base listos redujeron un 40% el tiempo de implementación",
      },
      {
        label: "Personalización controlada:",
        body: "El sistema de tokens permitió adaptar la identidad Rodobens manteniendo consistencia",
      },
      {
        label: "Accesibilidad nativa:",
        body: "WCAG 2.1 AA out-of-the-box (crítico para sistemas financieros)",
      },
      {
        label: "Responsividad intrínseca:",
        body: "Funcionamiento garantizado en todos los dispositivos",
      },
    ],
    decisionCustomTitle: "Qué Personalizamos",
    decisionCustom: [
      {
        color: "#0A5331",
        label: "Paleta:",
        body: "Adaptación de los greens Rodobens (#0A5331, #05B44C) + orange CTA (#FF7C43)",
      },
      {
        color: "#05B44C",
        label: "Componentes financieros:",
        body: "Simulador de crédito, cards de análisis, status badges",
      },
      {
        color: "#FF7C43",
        label: "Densidad de información:",
        body: "Ajustes de spacing para contexto B2B",
      },
      {
        color: "#111827",
        label: "Validaciones contextuales:",
        body: "Reglas de negocio específicas del sector financiero",
      },
    ],
    decisionQuote:
      "La elección de Nuxt UI v3 no fue sobre ahorrar tiempo — fue sobre invertir el tiempo correcto en lo que realmente importaba: entender los 129 permisos de acceso, traducir reglas de negocio complejas en interfaces intuitivas, y garantizar que cada componente reflejara las necesidades reales de los 603 usuarios.",
    compsTitle: "Componentes Clave del Sistema",
    badge1: "Aprobado",
    badge2: "Pendiente",
    badge3: "Vencido",
    badge4: "En Revisión",
    tableFeatures: [
      "Ordenamiento multi-columna",
      "Filtros intuitivos",
      "Paginación optimizada",
      "Acciones contextuales por fila",
    ],
    tableNote: "Densidad ajustada para datos financieros",
    formNote: "Máscaras para IDs fiscales y valores monetarios",
    paletteTitle: "Paleta de Colores",
    typographyTitle: "Tipografía",
    componentsTitle: "Componentes",
    delivLabel: "Entregables & Resultados",
    delivHeading: "Qué fue entregado",
    delivList: [
      "Discovery completo con mapeo de 129 perfiles",
      "User flows documentados (AS IS × TO BE)",
      "Wireframes de todas las pantallas principales",
      "Pantallas finales navegables (más allá del contrato inicial de wireframes)",
      "Reglas de negocio documentadas",
      "Sistema escalable con posibilidad de agregar nuevas funcionalidades",
    ],
    delivQuote:
      "Entregamos pantallas navegables en versión final, más allá del contrato de wireframes, junto con toda la documentación de reglas de negocio, flujos validados y un sistema escalable, integrado y con usabilidad mejorada.",
    impactHeading: "Impacto del Proyecto",
    metrics: [
      { num: "129", label: "perfiles de acceso mapeados" },
      { num: "603", label: "usuarios contemplados" },
      { num: "6", label: "meses de migración" },
      { num: "7", label: "años de sistema legado modernizado" },
      { num: "100%", label: "de las reglas de negocio documentadas" },
    ],
    reflexLabel: "Reflexiones & Aprendizajes",
    teamHeading: "Equipo",
    team: [
      { role: "UX Designer Semi-Senior", name: "Tayná" },
      { role: "Designer Junior", name: "Colaborador" },
      { role: "Líder de Diseño", name: "Mentor" },
      { role: "Business Analyst", name: "Equipo de Negocio" },
      { role: "Desarrollador", name: "Equipo de Desarrollo" },
    ],
    reflexoes: [
      {
        question: "¿Cuál fue el conflicto real que resolviste?",
        answer:
          "Un stakeholder defendió una pantalla de inicio genérica e igual para todos los perfiles de usuario para acelerar la entrega. Defendí lo contrario — un dashboard personalizado por perfil de acceso. El argumento tenía tres capas: primero, el uso de Nuxt UI v3 significaba que la versión personalizada no requería tiempo extra de prototipado; segundo, los accesos directos personalizados eliminarían directamente el problema más unánime de todas las entrevistas — una pantalla inicial que los propios usuarios describían como inútil; tercero, una pantalla en blanco replicaría exactamente el fracaso del sistema legado que estábamos reemplazando. El stakeholder aceptó el argumento. El dashboard personalizado fue entregado.",
      },
      {
        question: "¿A qué renunciaste para resolverlo?",
        answer:
          "Sacrifiqué la investigación exploratoria de largo plazo y los informes extensos, priorizando shadowing intensivo, entrevistas dirigidas y documentación viva a través de user flows. Una investigación más amplia habría generado mejores datos. Un discovery enfocado generó los datos correctos en el momento correcto.",
      },
      {
        question: "Madurez demostrada",
        answer:
          "Defender una decisión de diseño bajo presión de entrega — con argumento técnico (la librería reduce el tiempo de implementación), argumento de usuario (el 100% de los entrevistados señaló la pantalla de inicio) y argumento de negocio (repetir el patrón legacy minaría la confianza en el nuevo sistema) — y lograr los tres. Alineación entre expectativas de la dirección y la realidad de los 603 usuarios. Actuación como nexo entre las necesidades del cliente y la viabilidad del producto.",
      },
    ],
    footerTag: "Rodobens Unica Platform · 2026",
  },
  DE: {
    back: "Zurück zum Portfolio",
    tocLabel: "Inhalt",
    tag: "UX · Business Design · Systems",
    btnBefore: "So war es vorher",
    btnAfter: "Neue Version ansehen",
    title: "Das Erbe<br><em>entwirren.</em>",
    subtitle:
      "Ich habe die zentrale Betriebsplattform von Rodobens von Grund auf neu gestaltet — ein Legacy-System mit <b>7 Jahren angesammelter technischer Schulden</b>, <b>über 100 dokumentierten Bugs</b> und <b>603 aktiven Nutzern</b>, die täglich die Kosten von Abstürzen, fehlender Automatisierung und fragmentierten Workflows trugen. Das Ergebnis: <b>100+ gestaltete Screens</b>, Geschäfts- und Zugriffsregeln korrekt nach Profil umgesetzt, und eine <b>integrierte Plattform</b>, die ein Flickwerk externer Abhängigkeiten ersetzt.",
    accentLine:
      "Kartierung von 129 Zugriffsprofilen und Übersetzung komplexer Geschäftsregeln in skalierbare User Journeys",
    context:
      "Das Team verwandelte ein 7 Jahre altes, fragmentiertes Legacy-System in eine kohärente Plattform.",
    roles: [
      "UX Design",
      "Business Design",
      "Research",
      "Facilitation",
      "Handoff",
    ],
    stats: {
      profiles: "kartierte Profile",
      users: "aktive Nutzer",
      months: "Projektmonate",
      legacy: "Jahre Legacy",
    },
    complaintsLabel: "Hauptbeschwerden der Nutzer",
    complaints: [
      "Extreme Langsamkeit und ständige Systemabstürze",
      "Fehlende Automatisierung in mehreren kritischen Prozessen",
      "Verwirrende Fehlermeldungen und begrenztes oder kein Feedback",
      "Irrelevanter und langsamer Startbildschirm — im Alltag nicht genutzt",
      "Schwierigkeiten und Ineffizienz beim Hochladen von Dokumenten",
      "Keine Echtzeit-Berichte — Abhängigkeit von Tabellenkalkulationen und externen Apps",
    ],
    discoveryLabel: "Discovery & Kartierung",
    discoveryBody:
      'Jedes Interview wurde von einer eingehenden Überprüfung der Aufnahme begleitet. Ich kartierte die Journey jedes Nutzers individuell und identifizierte Usability-Lücken, wiederkehrende Schmerzpunkte und undokumentierte Systemverhalten, die durch ein Formular oder eine Umfrage nicht ans Licht gekommen wären.<br><br>Um den Prozess über mehr als 3 Stunden an Interviews zu beschleunigen, nutzte ich KI-gestützte Transkription — um sicherzustellen, dass kein Bug oder Edge Case im Datenvolumen verloren ging. Das Ergebnis war ein umfassender User Flow, der die Erkenntnisse zu einem klaren Bild des aktuellen Zustands konsolidierte.<br><br>Daraufhin führte das Design-Team eine strukturierte Design Critique über den User Flow durch. Jedes Teammitglied brachte seine eigene Expertise ein — markierte UI-Inkonsistenzen, UX-Reibungspunkte und Lücken in der To-Be-Journey. Diese kollaborative Schicht schärfte die Diagnose, bevor ein einziger Screen gestaltet wurde.<br><br>Jeder Befund hatte ein Ziel. Die in den Interviews kartierten Pain Points waren keine Symptome zur Dokumentation — sie waren Inputs, die Design-Entscheidungen direkt geprägt haben.<br><br><b>Feedback & Benachrichtigungen</b> — Géssica hatte 37 ungelesene Benachrichtigungen, die meisten irrelevant, einige mit Bezug auf Personen, die das Unternehmen bereits verlassen hatten. Das System hatte keinen Mechanismus zum Verwalten, Filtern oder Löschen. Dies führte zur Entscheidung, die Benachrichtigungszentrale mit aktivem Management neu zu gestalten.<br><br><b>Automatisierung</b> — Kreditanfragen und Preisgestaltung wurden über WhatsApp-Gruppen koordiniert. Dies führte zur Entscheidung, den gesamten Prozess in die Plattform zu integrieren.<br><br><b>Externe Abhängigkeit</b> — Um das System nicht mit mehreren Preisszenarien zu "belasten", führte das Team Berechnungen in Excel durch. Dies führte zur Entscheidung, einen nativen Kreditsimulator mit Echtzeit-Berechnung zu entwickeln.<br><br><b>Informationsarchitektur</b> — Die Design Critique offenbarte vier strukturelle Probleme: getrennte Suchleisten, unbetitelte Icons, falsch ausgerichtete Tabellenüberschriften und leere Zustände ohne Orientierung. Dies führte zu vier direkten Entscheidungen: kontextualisierte Inline-Filter, Pflichtbeschriftungen für alle Aktions-Icons, konsistentes typografisches Raster und orientierte Empty States.',
    discoveryImg1Caption: "User Flow-Kartierung aus Interviewdaten",
    discoveryImg2Caption: "Design Critique-Sitzung mit dem Design-Team",
    discoveryQuote:
      '"Wenn wir versehentlich eine falsche Information eingegeben haben — die Fahrgestellnummer, irgendetwas — und die Formalisierung das auf ihrer Seite erkennt, müssen wir die gesamte Formalisierung stornieren und alles von vorne ausfüllen. Es gibt keine Möglichkeit, nur ein Feld zu korrigieren." — Gabriella, Kreditanalystin',
    discoveryQuoteNote:
      "Das System hatte keinen Fallback-Zustand, kein Autosave und keine Fehlervermeidung. Ein einziges falsches Feld bedeutete, den gesamten Prozess neu zu starten. Dies führte zu vier Entscheidungen: editierbare Felder nach dem Absenden, Autosave bei jedem Schritt, Inline-Validierung mit kontextuellem Feedback und Bestätigungszustände vor destruktiven Aktionen.",
    overviewLabel: "Über das Projekt",
    overviewBody:
      "Das Projekt bestand in der <b>Modernisierung des internen Systems</b> der Rodobens Group, einem brasilianischen Marktführer mit 75-jähriger Geschichte im Finanz- und Automobileinzelhandel. Das Ökosystem umfasst konventionelle Finanzierungen (CDC) bis hin zu komplexen Modellen wie Plano Pontual und Finame. Gemeinsam mit dem NV8-Produktteam konzentrierte sich meine Arbeit auf die <b>Modernisierung der Oberflächen</b> durch das <b>Redesign der User Flows</b> basierend auf <b>Geschäftsregeln</b>, <b>Nutzerinterviews</b> und <b>Stakeholder-Erwartungsmanagement</b>.",
    deliverables: [
      "Discovery & Research",
      "AS IS × TO BE Kartierung",
      "Informationsarchitektur",
      "Proto-Personas",
      "User Flow Design",
      "Wireframes & UI Design",
    ],
    triads: [
      {
        title: "Der Konflikt",
        body: "Fehlende Dokumentation der Geschäftsregeln verlangsamte die Discovery-Phase und verursachte Nacharbeiten bei der Bildschirmgestaltung und der Flow-Kartierung.",
      },
      {
        title: "Die Entscheidung",
        body: "Agile Discovery mit der Shadowing-Technik zur Kartierung von Mikroprozessen — durch Online-Interviews mit Schlüsselnutzern. Erstellung detaillierter Userflows, die als technische Dokumentation für Design und Engineering dienten.",
      },
      {
        title: "Trade-off",
        body: "Breit angelegte explorative Forschung musste zugunsten gezielter Discovery-Sprints geopfert werden, die sich auf die kritischsten operativen Alltagsprobleme konzentrierten.",
      },
    ],
    designLabel: "Design-Lösung",
    designIntro:
      "Während der Discovery und der Kartierung der Zugriffsprofile entschieden wir uns für den Einsatz der <b>Nuxt UI v.3</b>-Bibliothek, angepasst für den Kunden, um die Produktionszeit und Komponenteniteration zu reduzieren. Das bestehende System des Kunden war auf Flickwerk aufgebaut — das Layout folgte keinen Standards oder Hierarchien.",
    principlesLabel: "Wahrgenommene Verbesserungen",
    dsBannerTitle:
      "Von Legacy-HTML zum modernen Design System: Entwicklung durch Nutzerdaten",
    dsBannerSub:
      "Wir nutzten Nuxt UI v3 als Grundlage und passten Komponenten strategisch an die spezifischen Anforderungen des Finanzsektors und der 603 Plattformnutzer an.",
    principles: [
      {
        title: "Reduzierung der kognitiven Last",
        body: "Von Informationsüberlastung zu klarer, atmender Hierarchie",
        color: "#F0185A",
      },
      {
        title: "Erhöhte Scannbarkeit",
        body: "Nutzer identifizieren Prioritäten in 3 Sekunden vs. zuvor 30+ Sekunden",
        color: "#0CFDB5",
      },
      {
        title: "Reduzierung der visuellen Ermüdung",
        body: "Tabellen mit ~20 Zeilen vs. ~50 komprimierte, verbesserte Lesegenauigkeit",
        color: "#FF7C43",
      },
      {
        title: "Progressive Formulare",
        body: "Aufteilung von ~50 Feldern in 4–5 logische Schritte, Senkung der Abbruchrate",
        color: "#F0185A",
      },
      {
        title: "Beschleunigte Entscheidungsfindung",
        body: "Analysten erkennen Red Flags in Sekunden via Badges und semantische Farben",
        color: "#0CFDB5",
      },
      {
        title: "Finanzielles Vertrauen",
        body: "Echtzeit-Berechnungen mit Aufschlüsselung der Werte erhöhen die Transparenz",
        color: "#FF7C43",
      },
    ],
    decisionTitle: "Strategische Entscheidung: Bibliothek vs. Custom",
    decisionSub: "Warum wir Nuxt UI v3 als Grundlage gewählt haben:",
    decisionBenefitsTitle: "Vorteile der Bibliothek",
    decisionBenefits: [
      {
        label: "Geschwindigkeit:",
        body: "Fertige Basiskomponenten reduzierten die Implementierungszeit um 40%",
      },
      {
        label: "Kontrollierte Anpassung:",
        body: "Das Token-System ermöglichte die Adaption an die Rodobens-Identität bei gleichbleibender Konsistenz",
      },
      {
        label: "Native Barrierefreiheit:",
        body: "WCAG 2.1 AA out-of-the-box (kritisch für Finanzsysteme)",
      },
      {
        label: "Intrinsive Responsivität:",
        body: "Garantiertes geräteübergreifendes Funktionieren",
      },
    ],
    decisionCustomTitle: "Was wir angepasst haben",
    decisionCustom: [
      {
        color: "#0A5331",
        label: "Farbpalette:",
        body: "Adaption der Rodobens-Grüntöne (#0A5331, #05B44C) + Orange CTA (#FF7C43)",
      },
      {
        color: "#05B44C",
        label: "Finanzkomponenten:",
        body: "Kreditsimulator, Analysekarten, Status-Badges",
      },
      {
        color: "#FF7C43",
        label: "Informationsdichte:",
        body: "Spacing-Anpassungen für B2B-Kontext",
      },
      {
        color: "#111827",
        label: "Kontextuelle Validierungen:",
        body: "Branchenspezifische Geschäftsregeln des Finanzsektors",
      },
    ],
    decisionQuote:
      "Die Wahl von Nuxt UI v3 war keine Frage der Zeitersparnis — es ging darum, die richtige Zeit in das zu investieren, was wirklich zählte: die 129 Zugriffsberechtigungen zu verstehen und komplexe Geschäftsregeln in intuitive Interfaces zu übersetzen.",
    compsTitle: "Schlüsselkomponenten des Systems",
    badge1: "Genehmigt",
    badge2: "Ausstehend",
    badge3: "Überfällig",
    badge4: "In Prüfung",
    tableFeatures: [
      "Mehrspaltiges Sortieren",
      "Intuitive Filter",
      "Optimierte Paginierung",
      "Kontextuelle Zeilenaktionen",
    ],
    tableNote: "Dichte für Finanzdaten angepasst",
    formNote: "Masken für Steuer-IDs und Geldbeträge",
    paletteTitle: "Farbpalette",
    typographyTitle: "Typografie",
    componentsTitle: "Komponenten",
    delivLabel: "Lieferergebnisse & Resultate",
    delivHeading: "Was geliefert wurde",
    delivList: [
      "Vollständige Discovery mit Kartierung von 129 Profilen",
      "Dokumentierte User Flows (AS IS × TO BE)",
      "Wireframes aller Hauptbildschirme",
      "Finale navigierbare Screens (über den ursprünglichen Wireframe-Vertrag hinaus)",
      "Dokumentierte Geschäftsregeln",
      "Skalierbares System mit der Möglichkeit, neue Features hinzuzufügen",
    ],
    delivQuote:
      "Wir lieferten finale navigierbare Screens — über den Wireframe-Vertrag hinaus — sowie die vollständige Dokumentation der Geschäftsregeln, validierte Flows und ein skalierbares, integriertes System mit verbesserter Usability.",
    impactHeading: "Projektauswirkungen",
    metrics: [
      { num: "129", label: "kartierte Zugriffsprofile" },
      { num: "603", label: "betroffene Nutzer" },
      { num: "6", label: "Migrationsmonate" },
      { num: "7", label: "Jahre modernisiertes Legacy-System" },
      { num: "100%", label: "der dokumentierten Geschäftsregeln" },
    ],
    reflexLabel: "Reflexionen & Erkenntnisse",
    teamHeading: "Team",
    team: [
      { role: "UX Designer (Mid)", name: "Tayná" },
      { role: "Junior Designer", name: "Mitarbeiter" },
      { role: "Design Lead", name: "Mentor" },
      { role: "Business Analyst", name: "Business-Team" },
      { role: "Entwickler", name: "Entwicklungsteam" },
    ],
    reflexoes: [
      {
        question: "Was war der eigentliche Konflikt, den du gelöst hast?",
        answer:
          "Ein Stakeholder forderte einen einheitlichen, generischen Startbildschirm für alle Nutzerprofile, um die Lieferung zu beschleunigen. Ich widersprach — und verteidigte ein personalisiertes Dashboard pro Zugriffsprofil. Das Argument hatte drei Ebenen: Erstens bedeutete die Verwendung von Nuxt UI v3, dass die personalisierte Version keine zusätzliche Prototyping-Zeit erforderte; zweitens würden personalisierte Schnellzugriffe den am häufigsten genannten Schmerzpunkt aus den Interviews direkt beseitigen — einen Startbildschirm, den Nutzer als völlig nutzlos beschrieben; drittens würde ein leerer Bildschirm exakt das Versagen des Legacy-Systems wiederholen. Der Stakeholder akzeptierte das Argument. Das personalisierte Dashboard wurde geliefert.",
      },
      {
        question: "Worauf hast du verzichtet, um es zu lösen?",
        answer:
          "Ich verzichtete auf langfristige explorative Forschung und umfangreiche Berichte, priorisierte stattdessen intensives Shadowing, gezielte Interviews und lebende Dokumentation durch User Flows. Breitere Forschung hätte bessere Daten geliefert. Fokussierte Discovery lieferte die richtigen Daten zum richtigen Zeitpunkt.",
      },
      {
        question: "Gezeigte Reife",
        answer:
          "Eine Design-Entscheidung unter Lieferdruck zu verteidigen — mit technischem Argument (Bibliothek reduziert Implementierungszeit), Nutzerargument (100% der Befragten nannten den Startbildschirm) und Geschäftsargument (das Legacy-Muster zu wiederholen würde das Vertrauen in das neue System untergraben) — und alle drei zu landen. Abstimmung zwischen Erwartungen der Geschäftsführung und der Realität der 603 Nutzer. Funktion als Bindeglied zwischen Kundenbedürfnissen und Produktmachbarkeit.",
      },
    ],
    footerTag: "Rodobens Unica Platform · 2026",
  },
};
const t = computed(() => copy[lang.value] || copy["PT"]);
</script>

<style>
@import url("https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500;0,9..40,700;0,9..40,800&display=swap");
.rc-root {
  font-family: "DM Sans", sans-serif;
  min-height: 100svh;
  position: relative;
  overflow-x: hidden;
  transition:
    background 0.5s,
    color 0.5s;
}
.theme-dark {
  background: #070711;
  color: #f0eff8;
}
.theme-light {
  background: #f5f3ff;
  color: #0d0c1a;
}
.rc-grain {
  position: fixed;
  inset: 0;
  z-index: 0;
  pointer-events: none;
  opacity: 0.035;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");
  background-size: 180px;
}
.rc-back {
  position: fixed;
  top: 1.5rem;
  left: 1.5rem;
  z-index: 100;
  display: inline-flex;
  align-items: center;
  gap: 0.4rem;
  font-size: 0.6rem;
  font-weight: 500;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  text-decoration: none;
  color: var(--fg-muted, #6b6a82);
  border: 1px solid var(--border, rgba(255, 255, 255, 0.07));
  padding: 0.4rem 0.75rem;
  background: var(--bg, #070711);
  transition:
    color 0.2s,
    border-color 0.2s;
}
.rc-back:hover {
  color: #f0185a;
  border-color: rgba(240, 24, 90, 0.35);
}
.rc-hero {
  position: relative;
  z-index: 1;
  padding: 7rem 1.5rem 4rem;
  display: flex;
  flex-direction: column;
  gap: 2.5rem;
}
.rc-hero-left {
  display: flex;
  flex-direction: column;
  gap: 1.1rem;
}
.rc-eyebrow {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.58rem;
  font-weight: 500;
  letter-spacing: 0.16em;
  text-transform: uppercase;
  color: #f0185a;
}
.rc-sep,
.rc-year {
  color: var(--fg-muted, #6b6a82);
}
.rc-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: clamp(2.5rem, 9vw, 6rem);
  line-height: 1;
  letter-spacing: -0.03em;
}
.rc-title em {
  font-style: italic;
  color: #f0185a;
}
.rc-subtitle {
  font-size: clamp(1.125rem, 2.5vw, 1.35rem);
  font-weight: 300;
  line-height: 1.7;
  color: var(--fg-muted, #6b6a82);
}
.rc-subtitle b {
  font-weight: 800;
  color: var(--fg, #f0eff8);
  font-style: normal;
}
.rc-accent {
  font-size: clamp(1.125rem, 2vw, 1.25rem);
  font-weight: 500;
  line-height: 1.65;
  color: #f0185a;
  opacity: 0.85;
}
.rc-ctx {
  border-left: 2px solid rgba(240, 24, 90, 0.35);
  padding-left: 1rem;
  font-size: clamp(1.125rem, 2vw, 1.25rem);
  font-weight: 300;
  line-height: 1.9;
  color: var(--fg-muted, #6b6a82);
}
.rc-roles {
  display: flex;
  flex-wrap: wrap;
  gap: 0.3rem;
}
.rc-role {
  font-size: 0.58rem;
  font-weight: 500;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--fg-muted, #6b6a82);
  border: 1px solid rgba(255, 255, 255, 0.08);
  padding: 0.25rem 0.55rem;
  transition:
    color 0.2s,
    border-color 0.2s;
}
.rc-role:hover {
  color: #f0185a;
  border-color: rgba(240, 24, 90, 0.35);
}
/* ── Table of contents ── */
.rc-toc {
  margin-top: 2rem;
  padding-top: 1.5rem;
  border-top: 1px solid rgba(255, 255, 255, 0.07);
}
.theme-light .rc-toc {
  border-top-color: rgba(0, 0, 0, 0.08);
}
.rc-toc-label {
  display: block;
  font-size: 0.52rem;
  font-weight: 500;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--fg-muted, #6b6a82);
  margin-bottom: 0.85rem;
}
.rc-toc-list {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
  flex-direction: column;
  gap: 0;
}
.rc-toc-item {
  border-bottom: 1px solid rgba(255, 255, 255, 0.05);
}
.theme-light .rc-toc-item {
  border-bottom-color: rgba(0, 0, 0, 0.06);
}
.rc-toc-link {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 0.6rem 0;
  text-decoration: none;
  color: var(--fg-muted, #6b6a82);
  transition: color 0.2s;
}
.rc-toc-link:hover {
  color: var(--fg, #f0eff8);
}
.theme-light .rc-toc-link:hover {
  color: #0d0c1a;
}
.rc-toc-link:hover .rc-toc-num {
  color: #f0185a;
}
.rc-toc-num {
  font-family: "Clash Display", sans-serif;
  font-size: 0.6rem;
  font-weight: 600;
  letter-spacing: 0.1em;
  color: rgba(240, 24, 90, 0.45);
  flex-shrink: 0;
  width: 1.6rem;
  transition: color 0.2s;
}
.rc-toc-name {
  font-size: 0.72rem;
  font-weight: 400;
  letter-spacing: 0.04em;
  text-transform: uppercase;
}

.rc-hero-right {
  display: flex;
  flex-direction: column;
  gap: 0.85rem;
}
.rc-stats-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 0.45rem;
}
.rc-stat {
  display: flex;
  flex-direction: column;
  gap: 0.1rem;
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid rgba(255, 255, 255, 0.07);
  padding: 0.55rem 0.65rem;
}
.rc-sn {
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: 1.3rem;
  line-height: 1;
}
.rc-sl {
  font-size: 7px;
  font-weight: 500;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--fg-muted, #6b6a82);
  white-space: nowrap;
}
.rc-screen {
  background: var(--bg, #070711);
  border: 1px solid rgba(255, 255, 255, 0.08);
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4);
  transition:
    transform 0.4s,
    box-shadow 0.4s;
}
.rc-screen:hover {
  transform: translateY(-3px);
  box-shadow:
    0 28px 70px rgba(240, 24, 90, 0.07),
    0 20px 50px rgba(0, 0, 0, 0.4);
}
.rc-browser {
  display: flex;
  align-items: center;
  gap: 0.35rem;
  background: rgba(255, 255, 255, 0.04);
  padding: 0.5rem 0.75rem;
  border-bottom: 1px solid rgba(255, 255, 255, 0.06);
}
.rc-dot {
  width: 7px;
  height: 7px;
  border-radius: 50%;
  flex-shrink: 0;
}
.rc-dot-r {
  background: #ff6467;
}
.rc-dot-y {
  background: #fdc700;
}
.rc-dot-g {
  background: #05df72;
}
.rc-url {
  font-size: 0.58rem;
  color: var(--fg-muted, #6b6a82);
  background: rgba(255, 255, 255, 0.05);
  border-radius: 3px;
  padding: 0.12rem 0.45rem;
  margin-left: 0.35rem;
  flex: 1;
}
.rc-screen-img {
  width: 100%;
  display: block;
  object-fit: cover;
}
.rc-section {
  position: relative;
  z-index: 1;
  padding: 4rem 1.5rem;
  border-top: 1px solid rgba(255, 255, 255, 0.05);
}
.rc-section--dark {
  background: rgba(240, 24, 90, 0.03);
}
.rc-rule {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 2rem;
}
.rc-rule-label {
  font-size: 0.58rem;
  font-weight: 500;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: #f0185a;
  white-space: nowrap;
  flex-shrink: 0;
}
.rc-rule-line {
  flex: 1;
  height: 1px;
  background: linear-gradient(
    90deg,
    rgba(240, 24, 90, 0.4) 0%,
    transparent 70%
  );
}
.rc-section-intro {
  font-size: clamp(1.125rem, 2vw, 1.25rem);
  font-weight: 300;
  line-height: 1.85;
  color: var(--fg, #f0eff8);
  max-width: 65ch;
  margin-bottom: 2.5rem;
}
.rc-section-intro b {
  font-weight: 800;
  color: var(--fg, #f0eff8);
}
.rc-discovery-imgs {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.25rem;
  margin-top: 0;
  margin-bottom: 0;
}
.rc-disc-fig {
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 0.65rem;
}
.rc-disc-img {
  width: 100%;
  aspect-ratio: 16/9;
  object-fit: cover;
  object-position: top left;
  border-radius: 12px;
  border: 1px solid rgba(255, 255, 255, 0.07);
  display: block;
}
.rc-disc-caption {
  font-size: 0.75rem;
  font-weight: 400;
  letter-spacing: 0.06em;
  color: var(--fg-muted, #6b6a82);
  text-align: center;
}

/* ── User quote block ── */
.rc-user-quote {
  margin: 2.5rem 0 0;
  border-left: 3px solid #f0185a;
  padding: 1.35rem 1.5rem;
  background: rgba(240, 24, 90, 0.04);
  border-radius: 0 8px 8px 0;
}
.rc-uq-text {
  font-size: clamp(1.05rem, 2vw, 1.2rem);
  font-style: italic;
  font-weight: 300;
  line-height: 1.9;
  color: var(--fg, #f0eff8);
  margin-bottom: 0.85rem;
}
.rc-uq-note {
  font-size: clamp(0.85rem, 1.5vw, 0.95rem);
  font-weight: 400;
  color: var(--fg-muted, #6b6a82);
  line-height: 1.75;
  font-style: normal;
}

.rc-hint {
  font-style: italic;
  color: #f0185a;
  font-weight: 400;
}
.rc-sub-heading {
  font-family: "Clash Display", sans-serif;
  font-weight: 600;
  font-size: clamp(1.1rem, 3vw, 1.5rem);
  letter-spacing: -0.015em;
  color: var(--fg, #f0eff8);
  margin-bottom: 1.25rem;
}
.rc-complaints-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 0.6rem;
}
.rc-complaint {
  display: flex;
  align-items: flex-start;
  gap: 0.8rem;
  border: 1px solid rgba(255, 255, 255, 0.06);
  padding: 0.9rem 1rem;
  opacity: 0;
  transform: translateY(14px);
  transition:
    opacity 0.5s ease calc(var(--ci, 0) * 0.08s),
    transform 0.5s cubic-bezier(0.16, 1, 0.3, 1) calc(var(--ci, 0) * 0.08s),
    border-color 0.2s;
}
.rc-complaint--vis {
  opacity: 1;
  transform: translateY(0);
}
.rc-complaint:hover {
  border-color: rgba(240, 24, 90, 0.25);
}
.rc-cicon {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  color: #f0185a;
  opacity: 0.75;
  margin-top: 0.2rem;
}
.rc-ctxt {
  font-size: clamp(1.125rem, 2vw, 1.25rem);
  font-weight: 300;
  line-height: 1.7;
  color: var(--fg-muted, #6b6a82);
}
.rc-overview-row {
  display: flex;
  flex-direction: column;
  gap: 1.25rem;
  margin-bottom: 2rem;
}
.rc-overview-body {
  font-size: clamp(1.125rem, 2vw, 1.3rem);
  font-weight: 300;
  line-height: 1.9;
  color: var(--fg-muted, #6b6a82);
  max-width: 65ch;
}
.rc-overview-body b {
  font-weight: 800;
  color: var(--fg, #f0eff8);
  font-style: normal;
}
.rc-deliverables {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 0.5rem;
}
.rc-del {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  font-size: 0.75rem;
  font-weight: 500;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--fg, #f0eff8);
  background: rgba(240, 24, 90, 0.06);
  border: 1px solid rgba(240, 24, 90, 0.18);
  padding: 0.85rem 1rem;
  transition:
    background 0.2s,
    border-color 0.2s;
}
.rc-del:hover {
  background: rgba(240, 24, 90, 0.12);
  border-color: rgba(240, 24, 90, 0.35);
}
.rc-del-dot {
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: #f0185a;
  flex-shrink: 0;
}
.rc-triads {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.25rem;
  background: none;
}
.rc-triad {
  padding: 1.75rem 1.5rem 2rem;
  background: #f0185a;
  position: relative;
  transition:
    transform 0.2s ease,
    box-shadow 0.2s ease;
  box-shadow: 3px 4px 0 rgba(0, 0, 0, 0.18);
  border-radius: 2px;
}
.rc-triad::after {
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  width: 0;
  height: 0;
  border-style: solid;
  border-width: 0 18px 18px 0;
  border-color: transparent rgba(0, 0, 0, 0.18) transparent transparent;
}
.rc-triad:hover {
  transform: translateY(-3px) rotate(0.4deg);
  box-shadow: 5px 7px 0 rgba(0, 0, 0, 0.22);
}
.rc-triad-t {
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: clamp(0.7rem, 1.5vw, 0.85rem);
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: rgba(255, 255, 255, 0.7);
  margin-bottom: 0.75rem;
}
.rc-triad-b {
  font-size: clamp(0.9rem, 1.8vw, 1rem);
  font-weight: 400;
  line-height: 1.75;
  color: #fff;
}
.rc-screens-list {
  display: flex;
  flex-direction: column;
  gap: 5rem;
  margin-bottom: 3rem;
}
.rc-design-screen {
  display: flex;
  flex-direction: column;
  gap: 1.75rem;
}
.rc-ds-header {
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 0.75rem;
}
.rc-ds-img-col {
  flex: 1;
}
.rc-ds-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 600;
  font-size: clamp(1.1rem, 3vw, 1.45rem);
  letter-spacing: -0.015em;
  color: var(--fg, #f0eff8);
  margin-bottom: 0.3rem;
}
.rc-ds-desc {
  font-size: clamp(1.125rem, 2vw, 1.25rem);
  font-weight: 300;
  color: var(--fg-muted, #6b6a82);
  line-height: 1.6;
  max-width: 60ch;
}
.rc-ds-desc b {
  font-weight: 800;
  color: var(--fg, #f0eff8);
}
.rc-ds-note {
  font-size: 1.125rem;
  font-style: italic;
  color: var(--fg-muted, #6b6a82);
  margin-top: 0.65rem;
  border-left: 2px solid rgba(240, 24, 90, 0.3);
  padding-left: 0.75rem;
}
.rc-ds-banner {
  background: #f0185a;
  border-radius: 8px;
  padding: 1.75rem 1.5rem;
  margin-bottom: 2.5rem;
}
.rc-ds-banner-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: clamp(1.05rem, 3vw, 1.5rem);
  color: #fff;
  line-height: 1.2;
  margin-bottom: 0.6rem;
}
.rc-ds-banner-sub {
  font-size: clamp(1.125rem, 2vw, 1.25rem);
  color: rgba(255, 255, 255, 0.85);
  font-weight: 300;
  line-height: 1.75;
}
.rc-rule--principles {
  margin-top: 2.5rem;
}
.rc-principles {
  display: grid;
  grid-template-columns: 1fr;
  gap: 0.75rem;
  margin-bottom: 2.5rem;
}
.rc-principle {
  display: flex;
  align-items: flex-start;
  gap: 1.25rem;
  border: 1px solid rgba(255, 255, 255, 0.06);
  border-left: 3px solid var(--acc, #f0185a);
  padding: 1.25rem 1.25rem;
  transition:
    border-color 0.2s,
    background 0.2s;
}
.rc-principle:hover {
  border-color: var(--acc, #f0185a);
  background: rgba(255, 255, 255, 0.02);
}
.rc-pr-icon {
  flex-shrink: 0;
  opacity: 0.85;
  margin-top: 0.1rem;
}
.rc-pr-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 600;
  font-size: clamp(1rem, 2vw, 1.15rem);
  color: var(--fg, #f0eff8);
  margin-bottom: 0.4rem;
}
.rc-pr-body {
  font-size: clamp(1rem, 1.8vw, 1.1rem);
  font-weight: 300;
  color: var(--fg-muted, #6b6a82);
  line-height: 1.7;
}
.rc-decision {
  background: rgba(255, 255, 255, 0.02);
  border: 1px solid rgba(255, 255, 255, 0.06);
  border-left: 3px solid #0cfdb5;
  padding: 1.25rem 1.35rem;
  margin-bottom: 2.5rem;
}
.rc-dec-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: clamp(0.95rem, 2.5vw, 1.25rem);
  color: var(--fg, #f0eff8);
  margin-bottom: 0.3rem;
}
.rc-dec-sub {
  font-size: 1.125rem;
  color: var(--fg-muted, #6b6a82);
  margin-bottom: 1.1rem;
}
.rc-dec-cols {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.25rem;
  margin-bottom: 1.1rem;
}
.rc-dec-col-title {
  font-size: 0.62rem;
  font-weight: 600;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  margin-bottom: 0.65rem;
}
.rc-dec-list {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 0.45rem;
}
.rc-dec-list li {
  font-size: clamp(1.125rem, 1.8vw, 1.25rem);
  font-weight: 300;
  color: var(--fg-muted, #6b6a82);
  line-height: 1.7;
}
.rc-dec-list li b {
  font-weight: 500;
  color: var(--fg, #f0eff8);
}
.rc-dec-custom-item {
  display: flex;
  align-items: flex-start;
  gap: 0.45rem;
}
.rc-dec-swatch {
  width: 11px;
  height: 11px;
  border-radius: 2px;
  flex-shrink: 0;
  margin-top: 0.18rem;
}
.rc-dec-quote {
  font-style: italic;
  font-size: clamp(1.125rem, 2vw, 1.25rem);
  color: var(--fg-muted, #6b6a82);
  border-left: 2px solid rgba(240, 24, 90, 0.3);
  padding-left: 0.8rem;
  line-height: 1.8;
}
.rc-comps-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 600;
  font-size: clamp(1.05rem, 3vw, 1.4rem);
  letter-spacing: -0.015em;
  color: var(--fg, #f0eff8);
  margin-bottom: 1.1rem;
}
.rc-comps-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 0.65rem;
}
.rc-comp-card {
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid rgba(255, 255, 255, 0.07);
  padding: 1rem;
  transition: border-color 0.2s;
}
.rc-comp-card:hover {
  border-color: rgba(240, 24, 90, 0.2);
}
.rc-comp-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 600;
  font-size: 0.9rem;
  color: var(--fg, #f0eff8);
  margin-bottom: 0.75rem;
}
.rc-comp-note {
  font-size: 1.125rem;
  color: var(--fg-muted, #6b6a82);
  margin-top: 0.65rem;
}
.rc-comp-note--i {
  font-style: italic;
}
.rc-comp-list {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 0.35rem;
}
.rc-comp-list li {
  font-size: 1.125rem;
  color: var(--fg-muted, #6b6a82);
  padding-left: 0.75rem;
  position: relative;
}
.rc-comp-list li::before {
  content: "·";
  position: absolute;
  left: 0;
  color: #f0185a;
}
.rc-badges-preview {
  display: flex;
  flex-wrap: wrap;
  gap: 0.35rem;
  margin-bottom: 0.4rem;
}
.rc-badge-pill {
  font-size: 0.58rem;
  font-weight: 500;
  color: #fff;
  padding: 0.2rem 0.6rem;
  border-radius: 999px;
  white-space: nowrap;
}
.rc-input-preview {
  display: flex;
  flex-direction: column;
  gap: 0.35rem;
}
.rc-input-eg {
  font-size: 0.7rem;
  padding: 0.38rem 0.6rem;
  border-radius: 4px;
  color: var(--fg-muted, #6b6a82);
}
.rc-input-eg--default {
  border: 1px solid rgba(255, 255, 255, 0.15);
}
.rc-input-eg--focus {
  border: 2px solid #0a5331;
}
.rc-input-eg--error {
  border: 2px solid #fb2c36;
}
.rc-palette {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}
.rc-swatch-row {
  display: flex;
  align-items: center;
  gap: 0.65rem;
}
.rc-swatch {
  width: 30px;
  height: 30px;
  border-radius: 5px;
  flex-shrink: 0;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
}
.rc-sw-name {
  display: block;
  font-size: 0.72rem;
  font-weight: 500;
  color: var(--fg, #f0eff8);
}
.rc-sw-hex {
  font-size: 0.62rem;
  color: var(--fg-muted, #6b6a82);
}
.rc-type-preview {
  display: flex;
  flex-direction: column;
  gap: 0.45rem;
}
.rc-type-preview > div {
  display: flex;
  align-items: baseline;
  gap: 0.45rem;
}
.rc-type-bold {
  font-weight: 700;
  font-size: 1.05rem;
  color: var(--fg, #f0eff8);
}
.rc-type-reg {
  font-weight: 400;
  font-size: 0.9rem;
  color: var(--fg, #f0eff8);
}
.rc-type-med {
  font-weight: 500;
  font-size: 0.82rem;
  color: var(--fg, #f0eff8);
}
.rc-type-role {
  font-size: 0.62rem;
  color: var(--fg-muted, #6b6a82);
}
.rc-btn-preview {
  display: flex;
  flex-direction: column;
  gap: 0.45rem;
}
.rc-btn-eg {
  font-size: 0.7rem;
  font-weight: 500;
  text-align: center;
  padding: 0.55rem;
  border-radius: 8px;
}
.rc-btn-eg--primary {
  background: #ff7c43;
  color: #fff;
}
.rc-btn-eg--secondary {
  background: transparent;
  border: 2px solid #0a5331;
  color: #0a5331;
}
.rc-deliverables-list {
  display: flex;
  flex-direction: column;
  gap: 0.45rem;
  margin-bottom: 1.75rem;
}
.rc-deliv-item {
  display: flex;
  align-items: center;
  gap: 0.65rem;
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid rgba(255, 255, 255, 0.06);
  padding: 0.8rem 0.9rem;
  font-size: clamp(1.125rem, 2vw, 1.25rem);
  color: var(--fg, #f0eff8);
  font-weight: 300;
}
.rc-deliv-dot {
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: #f0185a;
  flex-shrink: 0;
}
.rc-deliv-quote {
  font-style: italic;
  font-size: clamp(1.125rem, 2vw, 1.3rem);
  color: var(--fg, #f0eff8);
  border-left: 3px solid #f0185a;
  padding: 0.9rem 1.1rem;
  background: rgba(240, 24, 90, 0.05);
  margin-bottom: 2rem;
  line-height: 1.8;
}
.rc-impact-method {
  font-size: clamp(1rem, 1.8vw, 1.1rem);
  font-weight: 300;
  line-height: 1.85;
  color: var(--fg-muted, #6b6a82);
  max-width: 65ch;
  margin-bottom: 1.75rem;
  border-left: 2px solid rgba(240, 24, 90, 0.3);
  padding-left: 1rem;
}
.rc-impact-method b {
  font-weight: 800;
  color: var(--fg, #f0eff8);
}
.rc-impact-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 0.65rem;
}
.rc-metric {
  background: #f0185a;
  border-radius: 8px;
  padding: 1.1rem 1.25rem;
}
.rc-metric-n {
  display: block;
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: clamp(1.75rem, 5vw, 2.5rem);
  color: #fff;
  line-height: 1;
  margin-bottom: 0.3rem;
}
.rc-metric-l {
  font-size: clamp(1.125rem, 2vw, 1.25rem);
  color: rgba(255, 255, 255, 0.85);
  font-weight: 300;
}
.rc-team {
  display: flex;
  flex-wrap: wrap;
  gap: 0.45rem;
  margin-bottom: 2rem;
}
.rc-team-card {
  background: rgba(255, 255, 255, 0.03);
  border: 1px solid rgba(255, 255, 255, 0.07);
  padding: 0.65rem 0.9rem;
}
.rc-team-role {
  display: block;
  font-size: 1.125rem;
  font-weight: 500;
  color: var(--fg, #f0eff8);
  margin-bottom: 0.15rem;
}
.rc-team-name {
  font-size: 1rem;
  color: var(--fg-muted, #6b6a82);
}
.rc-reflexoes {
  display: flex;
  flex-direction: column;
  gap: 0.85rem;
}
.rc-reflexao {
  display: flex;
  align-items: flex-start;
  gap: 0.9rem;
  border: 1px solid rgba(255, 255, 255, 0.07);
  padding: 1.1rem;
  transition: border-color 0.2s;
}
.rc-reflexao:hover {
  border-color: rgba(240, 24, 90, 0.25);
}
.rc-reflexao-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  color: #f0185a;
}
.rc-ref-q {
  font-family: "Clash Display", sans-serif;
  font-weight: 600;
  font-size: clamp(1.125rem, 2vw, 1.35rem);
  color: #f0185a;
  margin-bottom: 0.5rem;
}
.rc-ref-a {
  font-size: clamp(1.125rem, 2vw, 1.25rem);
  font-weight: 300;
  line-height: 1.85;
  color: var(--fg-muted, #6b6a82);
}
.rc-footer {
  position: relative;
  z-index: 1;
  background: rgba(0, 0, 0, 0.4);
  border-top: 1px solid rgba(255, 255, 255, 0.07);
  padding: 1.75rem 1.5rem;
}
.rc-footer-inner {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 0.85rem;
  flex-wrap: wrap;
  gap: 0.65rem;
}
.rc-footer-tag {
  font-size: 0.58rem;
  font-weight: 500;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--fg-muted, #6b6a82);
}
.rc-footer-links {
  display: flex;
  gap: 0.9rem;
}
.rc-footer-link {
  font-size: 0.58rem;
  color: var(--fg-muted, #6b6a82);
  text-decoration: none;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  transition: color 0.2s;
}
.rc-footer-link:hover {
  color: #f0185a;
}
.rc-footer-copy {
  font-size: 0.55rem;
  color: var(--fg-muted, #6b6a82);
  opacity: 0.45;
  text-align: center;
}
@media (min-width: 640px) {
  .rc-hero {
    padding: 8rem 3rem 4rem;
  }
  .rc-section {
    padding: 5rem 3rem;
  }
  .rc-back {
    left: 3rem;
  }
  .rc-complaints-grid {
    grid-template-columns: repeat(2, 1fr);
  }
  .rc-triads {
    grid-template-columns: repeat(3, 1fr);
  }
  .rc-principles {
    grid-template-columns: repeat(2, 1fr);
  }
  .rc-comps-grid {
    grid-template-columns: repeat(2, 1fr);
  }
  .rc-impact-grid {
    grid-template-columns: repeat(2, 1fr);
  }
  .rc-dec-cols {
    grid-template-columns: repeat(2, 1fr);
  }
  .rc-footer {
    padding: 2rem 3rem;
  }
  .rc-discovery-imgs {
    grid-template-columns: 1fr 1fr;
    gap: 1.5rem;
  }
}
@media (min-width: 1024px) {
  .rc-hero {
    padding: 9rem 7rem 5rem;
    flex-direction: row;
    align-items: flex-start;
    gap: 4rem;
  }
  .rc-hero-left {
    flex: 1;
  }
  .rc-hero-right {
    flex: 0 0 460px;
  }
  .rc-section {
    padding: 6rem 7rem;
  }
  .rc-back {
    left: 7rem;
  }
  .rc-overview-row {
    flex-direction: row;
    align-items: flex-start;
    gap: 2.5rem;
  }
  .rc-overview-body {
    flex: 1.3;
  }
  .rc-deliverables {
    flex: 1;
    flex-direction: column;
  }
  .rc-del {
    width: 100%;
  }
  .rc-complaints-grid {
    grid-template-columns: repeat(3, 1fr);
  }
  .rc-principles {
    grid-template-columns: repeat(3, 1fr);
  }
  .rc-comps-grid {
    grid-template-columns: repeat(3, 1fr);
  }
  .rc-impact-grid {
    grid-template-columns: repeat(5, 1fr);
  }
  .rc-footer {
    padding: 2.5rem 7rem;
  }
}
@media (min-width: 1400px) {
  .rc-hero {
    padding: 10rem 10rem 5rem;
  }
  .rc-section {
    padding: 7rem 10rem;
  }
  .rc-back {
    left: 10rem;
  }
  .rc-footer {
    padding: 3rem 10rem;
  }
}

/* ── Teal token ── */
.rc-root {
  --teal: #0cfdb5;
  --fg-muted: #a8a6c0;
}
.theme-light.rc-root {
  --teal: #007a52;
  --fg-muted: #5c5a72;
}
.rc-teal {
  color: var(--teal);
}

/* ── Before/After toggle ── */
.rc-img-wrap {
  position: relative;
  overflow: hidden;
}
.rc-before-btn {
  position: absolute;
  top: 0.85rem;
  right: 0.85rem;
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  font-family: "DM Sans", sans-serif;
  font-size: 0.6rem;
  font-weight: 600;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  background: #f0185a;
  color: #fff;
  border: 1px solid #f0185a;
  padding: 0.45rem 0.9rem;
  border-radius: 0;
  cursor: pointer;
  transition:
    background 0.2s,
    border-color 0.2s,
    color 0.2s;
  z-index: 10;
}
.rc-before-btn:hover {
  background: #d4154f;
  border-color: #d4154f;
}
.rc-before-btn--active {
  background: transparent;
  color: #f0185a;
  border-color: rgba(240, 24, 90, 0.5);
}
.rc-before-btn--active:hover {
  background: rgba(240, 24, 90, 0.08);
  border-color: #f0185a;
}
.rc-before-icon {
  font-size: 0.8rem;
  line-height: 1;
}

/* ── Flip transition ── */
.rc-flip-enter-active,
.rc-flip-leave-active {
  transition:
    opacity 0.25s ease,
    transform 0.25s ease;
}
.rc-flip-enter-from {
  opacity: 0;
  transform: scale(0.98);
}
.rc-flip-leave-to {
  opacity: 0;
  transform: scale(1.01);
}

@media (min-width: 1024px) {
  .rc-design-screen {
    flex-direction: row;
    align-items: flex-start;
    gap: 3.5rem;
  }
  .rc-ds-header {
    flex: 0 0 38%;
    max-width: 38%;
  }
  .rc-ds-img-col {
    flex: 1;
    min-width: 0;
  }
  .rc-design-screen:nth-child(even) {
    flex-direction: row-reverse;
  }
}
.rc-impact-method {
  font-size: clamp(1rem, 1.8vw, 1.1rem);
  font-weight: 300;
  line-height: 1.85;
  color: var(--fg-muted, #6b6a82);
  max-width: 65ch;
  margin-bottom: 1.75rem;
  border-left: 2px solid rgba(240, 24, 90, 0.3);
  padding-left: 1rem;
}

/* ── Lightbox ── */
.rc-zoomable {
  cursor: zoom-in;
}
.rc-lightbox {
  position: fixed;
  inset: 0;
  z-index: 9999;
  background: rgba(7, 7, 17, 0.93);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 2rem;
  cursor: zoom-out;
}
.rc-lb-figure {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.85rem;
  cursor: default;
  max-width: 100%;
}
.rc-lb-img {
  max-width: 100%;
  max-height: 85vh;
  object-fit: contain;
  border-radius: 6px;
  box-shadow: 0 30px 90px rgba(0, 0, 0, 0.6);
  display: block;
}
.rc-lb-caption {
  font-size: 0.72rem;
  font-weight: 500;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: rgba(240, 239, 248, 0.55);
  text-align: center;
  max-width: 55ch;
  line-height: 1.6;
}
.rc-lb-close {
  position: fixed;
  top: 1.25rem;
  right: 1.25rem;
  width: 2.5rem;
  height: 2.5rem;
  border-radius: 50%;
  border: 1px solid rgba(255, 255, 255, 0.2);
  background: rgba(255, 255, 255, 0.08);
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition:
    background 0.2s,
    border-color 0.2s;
  z-index: 10000;
}
.rc-lb-close:hover {
  background: rgba(240, 24, 90, 0.25);
  border-color: #f0185a;
}
.rc-lb-enter-active,
.rc-lb-leave-active {
  transition: opacity 0.2s ease;
}
.rc-lb-enter-from,
.rc-lb-leave-to {
  opacity: 0;
}
</style>
