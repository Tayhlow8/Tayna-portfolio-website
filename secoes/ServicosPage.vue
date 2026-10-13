<template>
  <div ref="rootRef" :class="['sv-root', `theme-${theme}`]">
    <div class="sv-glow" aria-hidden="true"></div>
    <div class="sv-grain" aria-hidden="true"></div>

    <NavBar v-model:lang="lang" v-model:theme="theme" />

    <!-- ══ HERO ══════════════════════════════════════════════ -->
    <section id="hero" aria-labelledby="hero-heading">
      <div class="hero-grid" aria-hidden="true"></div>
      <div class="hero-inner">
        <div class="hero-left">
          <div class="t-eyebrow hero-anim">
            <span class="pf-dot"></span>Web Design · Conversão · SEO
          </div>
          <div class="hero-headline hero-anim hero-anim-d1">
            <h1 id="hero-heading" class="t-display">
              Seu site<br />está <em>vendendo</em><br />ou só existe?
            </h1>
          </div>
          <p class="t-body hero-anim hero-anim-d2" style="max-width: 38ch">
            Criamos landing pages e sites completos com foco em resultado — cada
            detalhe pensado para transformar visitante em cliente.
          </p>
          <div class="hero-ctas hero-anim hero-anim-d3">
            <button class="pf-btn pf-btn--solid" @click="scrollToId('planos')">
              <span class="pf-ring"></span><span class="pf-veil"></span><span class="pf-core"></span>
              <span class="pf-btn-lbl">Ver planos <span class="pf-arr">→</span></span>
            </button>
            <button class="pf-btn pf-btn--ghost" @click="scrollToId('portfolio')">
              <span class="pf-ring"></span><span class="pf-veil"></span><span class="pf-core"></span>
              <span class="pf-btn-lbl">Ver portfólio</span>
            </button>
          </div>
          <div class="hero-stats hero-anim hero-anim-d4" role="list" aria-label="Métricas de resultado">
            <div class="stat-item" role="listitem">
              <span class="stat-num"><em>+</em>40</span>
              <span class="stat-desc">Sites entregues</span>
            </div>
            <div class="stat-item" role="listitem">
              <span class="stat-num"><em>3×</em></span>
              <span class="stat-desc">Média de conversão</span>
            </div>
            <div class="stat-item" role="listitem">
              <span class="stat-num">100<em>%</em></span>
              <span class="stat-desc">Satisfação</span>
            </div>
          </div>
        </div>

        <div class="hero-right" aria-hidden="true">
          <div style="position: relative; width: 100%; max-width: 460px">
            <div class="hero-mockup">
              <div class="mockup-bar">
                <span class="mockup-dot" style="background: #ff5f57"></span>
                <span class="mockup-dot" style="background: #febc2e"></span>
                <span class="mockup-dot" style="background: #28c840"></span>
              </div>
              <div class="mockup-body">
                <div class="mockup-line mockup-line--accent"></div>
                <div class="mockup-line" style="width: 80%"></div>
                <div class="mockup-line mockup-line--sm"></div>
                <div class="mockup-block"></div>
                <div class="mockup-cta">
                  <div class="mockup-btn mockup-btn--solid"></div>
                  <div class="mockup-btn mockup-btn--ghost"></div>
                </div>
                <div class="mockup-line" style="width: 90%; margin-top: 8px"></div>
                <div class="mockup-line" style="width: 65%"></div>
              </div>
            </div>
            <div class="hero-badge hero-badge--tl">
              <div>
                <div class="badge-num">+320%</div>
                <div class="badge-txt">Conversão após redesign</div>
              </div>
            </div>
            <div class="hero-badge hero-badge--br">
              <div class="pf-dot" style="animation-delay: 0.8s"></div>
              <div>
                <div class="badge-num" style="font-size: 0.75rem; color: var(--fg)">SEO ativo</div>
                <div class="badge-txt">Rankeando no Google</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- ══ COMO FUNCIONA ═════════════════════════════════════ -->
    <section id="como-funciona" aria-labelledby="como-funciona-heading">
      <div class="pf-rule"></div>
      <div class="wrap">
        <header class="sec-header">
          <div class="t-eyebrow reveal"><span class="pf-dot"></span>Processo</div>
          <h2 id="como-funciona-heading" class="t-headline reveal reveal-d1">
            Do briefing ao <em>resultado</em><br />em três etapas.
          </h2>
          <p class="t-body reveal reveal-d2">
            Um processo claro, sem ruído. Você acompanha cada fase e recebe
            exatamente o que foi acordado.
          </p>
        </header>
        <div class="steps-grid">
          <div
            v-for="(step, i) in steps"
            :key="step.title"
            :class="['step-card', 'reveal', revealDelay[i]]"
          >
            <div class="step-num">{{ pad(i + 1) }}</div>
            <h3 class="step-title">{{ step.title }}</h3>
            <p class="step-desc">{{ step.desc }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- ══ PORTFÓLIO ═════════════════════════════════════════ -->
    <section id="portfolio" aria-labelledby="portfolio-heading">
      <div class="pf-rule"></div>
      <div class="wrap">
        <header class="sec-header">
          <div class="t-eyebrow reveal"><span class="pf-dot"></span>Portfólio</div>
          <h2 id="portfolio-heading" class="t-headline reveal reveal-d1">
            Projetos que <em>performam.</em>
          </h2>
          <p class="t-body reveal reveal-d2">
            Cada site foi criado com uma hipótese de conversão clara — e os
            números provam que funcionou.
          </p>
        </header>

        <!-- Destaques com antes/depois -->
        <div v-for="c in featured" :key="c.id" class="reveal">
          <article class="port-featured">
            <div class="port-featured-body">
              <div>
                <div v-if="c.badge" class="port-badge-featured">
                  <span class="pf-dot"></span>{{ c.badge }}
                </div>
                <span class="port-sector">{{ c.sector }}</span>
              </div>
              <h3 class="port-featured-name" v-html="c.name"></h3>
              <p class="port-desc">{{ c.desc }}</p>
              <div class="port-metrics">
                <div v-for="m in c.metrics" :key="m.label" class="port-metric-item">
                  <span class="port-metric-num" v-html="m.num"></span>
                  <span class="port-metric-lbl">{{ m.label }}</span>
                </div>
              </div>
              <a v-if="c.link" :href="c.link" target="_blank" rel="noopener" class="port-link">
                Ver site ao vivo →
              </a>
            </div>

            <div class="port-featured-visual">
              <div class="port-featured-frames">
                <div
                  v-for="mode in ['after', 'before']"
                  :key="mode"
                  class="ba-panel"
                  :style="{
                    opacity: ba[c.id] === mode ? 1 : 0,
                    pointerEvents: ba[c.id] === mode ? 'auto' : 'none',
                  }"
                >
                  <img class="ba-img" :src="c[mode].src" :alt="c[mode].alt" loading="lazy" />
                </div>
              </div>
              <div class="port-ba" role="group" aria-label="Alternar visualização antes/depois">
                <button
                  class="port-ba-btn"
                  :class="{ active: ba[c.id] === 'before' }"
                  @click="ba[c.id] = 'before'"
                >
                  Antes
                </button>
                <button
                  class="port-ba-btn"
                  :class="{ active: ba[c.id] === 'after' }"
                  @click="ba[c.id] = 'after'"
                >
                  Depois
                </button>
              </div>
            </div>
          </article>
        </div>

        <!-- Grid secundário -->
        <div class="portfolio-grid">
          <article class="port-card reveal reveal-d2">
            <div class="port-img">
              <div class="port-img-inner" style="padding: 0">
                <img
                  class="ba-img"
                  :src="imgArf"
                  alt="Sites da ARF Realty, imobiliária de luxo em Miami"
                  loading="lazy"
                />
              </div>
            </div>
            <div class="port-body">
              <span class="port-sector">Imobiliária de Luxo · Miami, EUA</span>
              <h3 class="port-name">ARF Real Estate</h3>
              <p class="port-desc">
                Construímos 6 sites, identidades visuais, logotipos e estratégia
                de marca para uma imobiliária de luxo em Miami, na Flórida —
                voltada para brasileiros de alto poder aquisitivo em busca de
                mansões nos bairros mais badalados da cidade.
              </p>
              <div class="port-metric">
                <span class="port-metric-val">6 sites</span>
                <span>branding e logo desenvolvidos do zero</span>
              </div>
            </div>
          </article>
        </div>
      </div>
    </section>

    <!-- ══ SOBRE ═════════════════════════════════════════════ -->
    <section id="sobre" aria-labelledby="sobre-heading">
      <div class="pf-rule"></div>
      <div class="wrap">
        <div class="about-grid">
          <div class="about-media reveal">
            <img
              :src="imgSobre"
              alt="Retrato de Tayná Schultz, fundadora da Taynart"
              loading="lazy"
            />
          </div>
          <div class="about-body">
            <div class="t-eyebrow reveal"><span class="pf-dot"></span>Quem sou eu</div>
            <h2 id="sobre-heading" class="t-headline reveal reveal-d1">
              Uma designer calibre <em>L'Oréal</em>, cuidando do seu negócio.
            </h2>
            <div class="about-text reveal reveal-d2">
              <p>
                Antes de fundar a Taynart, passei anos numa agência de marketing
                cuidando dos e-commerces de marcas do grupo L'Oréal — DTC, B2B e
                B2C, entre elas SkinCeuticals, Lancôme, Dermaclub, Segredos de
                Salão, Yves Saint Laurent e Prada.
              </p>
              <p>
                Aprendi na prática, sob a régua de marcas globais, o que faz um
                site vender de verdade: estratégia antes de estética, copy que
                resolve objeção e um nível de detalhe que não pode falhar. Hoje
                aplico o mesmo padrão para negócios que, mesmo sem uma agência
                gigante por trás, merecem um site à altura.
              </p>
              <p>
                Não sou uma agência sem rosto nem um site gerado por IA. Sou eu,
                de ponta a ponta — do primeiro briefing ao site no ar.
              </p>
            </div>
            <router-link to="/projetos" class="port-link reveal reveal-d3">
              Ver todos os meus projetos →
            </router-link>
          </div>
        </div>
      </div>
    </section>

    <!-- ══ OUTROS TRABALHOS ══════════════════════════════════ -->
    <section id="outros-trabalhos" aria-labelledby="outros-trabalhos-heading">
      <div class="wrap">
        <header class="sec-header sec-header--center">
          <div class="t-eyebrow reveal" style="justify-content: center">
            <span class="pf-dot"></span>Mais trabalhos
          </div>
          <h2
            id="outros-trabalhos-heading"
            class="t-headline reveal reveal-d1"
            style="text-align: center"
          >
            Um pouco mais do que <em>já criei.</em>
          </h2>
        </header>
      </div>
      <div
        class="marquee reveal reveal-d2"
        aria-label="Carrossel com outros projetos de design"
        @mouseenter="slowMarquee(true)"
        @mouseleave="slowMarquee(false)"
      >
        <!-- lista duplicada para loop contínuo -->
        <div ref="trackRef" class="marquee-track">
          <template v-for="pass in 2" :key="pass">
            <img
              v-for="w in works"
              :key="`${pass}-${w.file}`"
              class="marquee-img"
              :src="w.src"
              :alt="pass === 1 ? w.alt : ''"
              :aria-hidden="pass === 2 ? 'true' : undefined"
              loading="lazy"
            />
          </template>
        </div>
      </div>
    </section>

    <!-- ══ DEPOIMENTOS ═══════════════════════════════════════ -->
    <section id="depoimentos" aria-labelledby="depoimentos-heading">
      <div class="pf-rule"></div>
      <div class="wrap">
        <header class="sec-header sec-header--center">
          <div class="t-eyebrow reveal" style="justify-content: center">
            <span class="pf-dot"></span>Depoimentos
          </div>
          <h2 id="depoimentos-heading" class="t-headline reveal reveal-d1">
            O que dizem quem <em>confiou</em> no processo.
          </h2>
        </header>
        <div class="test-showcase reveal reveal-d2">
          <img
            :src="imgDepoimentos"
            alt="Conversas de WhatsApp com depoimentos de clientes: equipe de marketing da ARF elogiando o aumento de conversão, Mercantil do Brasil parabenizando o redesign de marca, e Álvaro Rosa Lopes agradecendo pelo trabalho na Taynart"
            loading="lazy"
          />
        </div>
      </div>
    </section>

    <!-- ══ PLANOS ════════════════════════════════════════════ -->
    <section id="planos" aria-labelledby="planos-heading">
      <div class="pf-rule"></div>
      <div class="wrap">
        <header class="sec-header sec-header--center">
          <div class="t-eyebrow reveal" style="justify-content: center">
            <span class="pf-dot"></span>Planos
          </div>
          <h2 id="planos-heading" class="t-headline reveal reveal-d1">
            Escolha o plano certo<br />para o <em>seu momento.</em>
          </h2>
          <p class="t-body reveal reveal-d2">
            Sem surpresas, sem escopo aberto. Você sabe exatamente o que recebe.
          </p>
        </header>
        <div class="plans-grid">
          <div
            v-for="(plan, i) in plans"
            :key="plan.name"
            :class="['plan-card', 'reveal', revealDelay[i], { 'plan-card--featured': plan.featured }]"
          >
            <div v-if="plan.featured" class="plan-badge">Mais indicado</div>
            <div>
              <div class="plan-name">{{ plan.name }}</div>
              <div class="plan-from">A partir de</div>
              <div class="plan-price">
                <span class="plan-currency">R$</span><span class="plan-val">{{ plan.price }}</span>
              </div>
            </div>
            <p class="plan-desc">{{ plan.desc }}</p>
            <div class="plan-divider"></div>
            <ul class="plan-features" role="list">
              <li v-for="f in plan.features" :key="f" class="plan-feature" role="listitem">
                <span class="plan-feature-check" aria-hidden="true">
                  <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="20 6 9 17 4 12" />
                  </svg>
                </span>
                {{ f }}
              </li>
            </ul>
            <a
              :href="plan.href"
              target="_blank"
              rel="noopener"
              :class="['pf-btn', plan.featured ? 'pf-btn--solid' : 'pf-btn--ghost']"
              style="width: 100%; min-width: 0"
            >
              <span class="pf-ring"></span><span class="pf-veil"></span><span class="pf-core"></span>
              <span class="pf-btn-lbl">Quero o {{ plan.name }} <span class="pf-arr">→</span></span>
            </a>
          </div>
        </div>
        <p class="t-body reveal" style="text-align: center; margin-top: var(--sp-8)">
          Dúvidas sobre qual plano faz mais sentido?
          <a
            :href="wa()"
            target="_blank"
            rel="noopener"
            style="color: var(--accent); font-weight: 400"
          >Fala comigo antes de decidir →</a>
        </p>
      </div>
    </section>

    <!-- ══ MAIS SERVIÇOS ═════════════════════════════════════ -->
    <section id="mais-servicos" aria-labelledby="mais-servicos-heading">
      <div class="pf-rule"></div>
      <div class="wrap">
        <header class="sec-header sec-header--center">
          <div class="t-eyebrow reveal" style="justify-content: center">
            <span class="pf-dot"></span>Mais serviços
          </div>
          <h2 id="mais-servicos-heading" class="t-headline reveal reveal-d1">
            Além do site,<br />a <em>marca inteira.</em>
          </h2>
          <p class="t-body reveal reveal-d2">
            Identidade visual e design de produto para quem quer ir além da
            página.
          </p>
        </header>
        <div class="services-grid">
          <div
            v-for="(svc, i) in services"
            :key="svc.name"
            :class="['plan-card', 'reveal', revealDelay[i]]"
          >
            <div>
              <div class="plan-name">{{ svc.name }}</div>
              <div class="plan-from">A partir de</div>
              <div class="plan-price">
                <span class="plan-currency">R$</span><span class="plan-val">{{ svc.price }}</span
                ><span v-if="svc.period" class="plan-period">{{ svc.period }}</span>
              </div>
            </div>
            <p class="plan-desc">{{ svc.desc }}</p>
            <div class="plan-divider"></div>
            <ul class="plan-features" role="list">
              <li v-for="f in svc.features" :key="f" class="plan-feature" role="listitem">
                <span class="plan-feature-check" aria-hidden="true">
                  <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="20 6 9 17 4 12" />
                  </svg>
                </span>
                {{ f }}
              </li>
            </ul>
            <a
              :href="wa(svc.waText)"
              target="_blank"
              rel="noopener"
              class="pf-btn pf-btn--ghost"
              style="width: 100%; min-width: 0"
            >
              <span class="pf-ring"></span><span class="pf-veil"></span><span class="pf-core"></span>
              <span class="pf-btn-lbl">Solicitar orçamento <span class="pf-arr">→</span></span>
            </a>
          </div>
        </div>
      </div>
    </section>

    <!-- ══ FAQ ═══════════════════════════════════════════════ -->
    <section id="faq" aria-labelledby="faq-heading">
      <div class="pf-rule"></div>
      <div class="wrap">
        <header class="sec-header sec-header--center">
          <div class="t-eyebrow reveal" style="justify-content: center">
            <span class="pf-dot"></span>FAQ
          </div>
          <h2 id="faq-heading" class="t-headline reveal reveal-d1">Perguntas frequentes.</h2>
        </header>
        <div class="faq-inner">
          <div class="faq-list" role="list">
            <!-- .reveal fica no wrapper: o observer mexe na classe via DOM
                 e o :class dinâmico do item sobrescreveria -->
            <div
              v-for="(item, i) in faq"
              :key="item.q"
              :class="['reveal', revealDelay[i]]"
              role="listitem"
            >
              <div class="faq-item" :class="{ open: openFaq === i }">
                <button
                  class="faq-question"
                  :aria-expanded="openFaq === i"
                  @click="openFaq = openFaq === i ? null : i"
                >
                  {{ item.q }}
                  <span class="faq-icon" aria-hidden="true">
                    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                      <line x1="12" y1="5" x2="12" y2="19" />
                      <line x1="5" y1="12" x2="19" y2="12" />
                    </svg>
                  </span>
                </button>
                <div class="faq-answer">
                  <p>{{ item.a }}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- ══ IMPORTÂNCIA DO SITE ═══════════════════════════════ -->
    <section id="importancia" aria-labelledby="importancia-heading">
      <div class="pf-rule"></div>
      <div class="wrap">
        <header class="sec-header sec-header--center">
          <div class="t-eyebrow reveal" style="justify-content: center">
            <span class="pf-dot"></span>Por que agora
          </div>
          <h2
            id="importancia-heading"
            class="t-headline reveal reveal-d1"
            style="text-align: center"
          >
            Quem não está online<br />não existe para o seu cliente.
          </h2>
          <p class="t-body reveal reveal-d2" style="text-align: center; max-width: 56ch">
            Antes de ligar ou visitar sua loja, seu cliente já pesquisou no
            Google. Hoje, ter um site — ou uma loja virtual — deixou de ser
            diferencial: é o mínimo para ser encontrado, gerar confiança e
            vender todos os dias, 24 horas, mesmo enquanto você dorme. Quem
            ainda não está online está perdendo venda todo dia para quem está.
          </p>
        </header>
        <div class="importance-highlight reveal reveal-d3">
          <p>
            Cuidamos de toda a conexão pra você — domínio, hospedagem,
            pagamentos e integrações — tudo pronto e no ar em até
            <strong><span style="margin-right: 0.2em">1</span>semana.</strong>
          </p>
        </div>
      </div>
    </section>

    <!-- ══ CTA FINAL ═════════════════════════════════════════ -->
    <section id="contato" aria-labelledby="contato-heading">
      <div class="pf-rule"></div>
      <div id="cta-final">
        <div class="cta-glow" aria-hidden="true"></div>
        <div class="wrap">
          <div class="cta-inner">
            <div class="cta-rule" aria-hidden="true"></div>
            <div class="t-eyebrow reveal" style="justify-content: center">
              <span class="pf-dot"></span>Próximo passo
            </div>
            <h2
              id="contato-heading"
              class="t-headline reveal reveal-d1"
              style="text-align: center; max-width: 14ch"
            >
              Seu site pode ser<br />seu melhor <em>vendedor.</em>
            </h2>
            <p class="t-body reveal reveal-d2" style="text-align: center; max-width: 42ch">
              Vamos conversar sobre o seu negócio, público e o que você precisa
              que o site faça por você. Sem compromisso.
            </p>
            <div class="cta-btns reveal reveal-d3">
              <a
                :href="wa('Olá! Quero saber mais sobre os planos de site.')"
                target="_blank"
                rel="noopener"
                class="pf-btn pf-btn--solid"
              >
                <span class="pf-ring"></span><span class="pf-veil"></span><span class="pf-core"></span>
                <span class="pf-btn-lbl">Falar pelo WhatsApp <span class="pf-arr">→</span></span>
              </a>
              <a href="mailto:tayna.schultz@gmail.com" class="pf-btn pf-btn--ghost">
                <span class="pf-ring"></span><span class="pf-veil"></span><span class="pf-core"></span>
                <span class="pf-btn-lbl">Enviar e-mail</span>
              </a>
            </div>
            <p class="t-label reveal reveal-d4" style="opacity: 0.5">
              Resposta em até 24h · Sem compromisso
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- ══ FOOTER ════════════════════════════════════════════ -->
    <footer aria-label="Rodapé">
      <div class="footer-top">
        <div class="footer-logo">
          <img :src="logoImg" alt="Taynart" />
        </div>
        <span class="footer-copy">© 2026 Taynart · Todos os direitos reservados</span>
        <nav class="footer-links" aria-label="Links do rodapé">
          <router-link to="/projetos" class="footer-link">Portfólio</router-link>
          <a
            href="https://linkedin.com/in/taynart"
            target="_blank"
            rel="noopener"
            class="footer-link"
          >LinkedIn</a>
        </nav>
      </div>
      <div class="footer-tags" aria-label="Serviços e especialidades">
        <span v-for="tag in footerTags" :key="tag" class="footer-tag">#{{ tag }}</span>
      </div>
    </footer>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted, onUnmounted } from 'vue'
import NavBar from './NavBar.vue'
import { useLang } from '../src/composables/useLang'
import logoImg from '../LOGO grande.png'

import imgCdaAntes    from '../src/assets/servicos/caixa-dagua-antes.jpg'
import imgCdaDepois   from '../src/assets/servicos/caixa-dagua-depois.jpg'
import imgNv8Antes    from '../src/assets/servicos/nv8-antes.jpg'
import imgNv8Depois   from '../src/assets/servicos/nv8-depois.jpg'
import imgArf         from '../src/assets/servicos/arf-cover.jpg'
import imgSobre       from '../src/assets/servicos/tayna-sobre.jpg'
import imgDepoimentos from '../src/assets/servicos/depoimentos-whatsapp.png'

const props = defineProps({
  lang:  { type: String, default: 'PT' },
  theme: { type: String, default: 'light' },
})

const { lang } = useLang()
const theme = ref(props.theme)

// ── Helpers ────────────────────────────────────────────────
const pad = (n) => String(n).padStart(2, '0')
const revealDelay = ['', 'reveal-d2', 'reveal-d3', 'reveal-d3', 'reveal-d4']

const WHATSAPP = '5521998761604'
const wa = (text) =>
  `https://wa.me/${WHATSAPP}${text ? `?text=${encodeURIComponent(text)}` : ''}`

function scrollToId (id) {
  document.getElementById(id)?.scrollIntoView({ behavior: 'smooth' })
}

// ── Como funciona ──────────────────────────────────────────
const steps = [
  {
    title: 'Briefing estratégico',
    desc: 'Entendemos seu negócio, público-alvo e objetivo de conversão. Nada é construído antes de termos clareza sobre para quem estamos falando — e o que queremos que essa pessoa faça.',
  },
  {
    title: 'Design + Desenvolvimento',
    desc: 'Criamos do zero: identidade visual, copy persuasiva, estrutura de conversão e código limpo. Cada elemento tem um propósito — nada é decorativo.',
  },
  {
    title: 'Entrega + Otimização',
    desc: 'Lançamos, ajustamos conforme os dados e, nos planos com acompanhamento, continuamos evoluindo o site de forma estratégica ao longo do tempo.',
  },
]

// ── Portfólio (destaques com antes/depois) ─────────────────
const featured = [
  {
    id: 'cda',
    badge: 'Projeto em destaque',
    sector: 'Site Completo · SEO · Google Meu Negócio',
    name: "Caixa d'Água<br /><em>Revestimentos</em>",
    desc: 'De uma landing page simples para um site completo com sitemap, rankeamento orgânico e Google Meu Negócio otimizado. Copy focada no problema do cliente — caixa com vazamento, água suja — e produto patenteado no centro da narrativa. Resultado: saíram de 3 para 4,9 estrelas no Google e +150% em ligações.',
    metrics: [
      { num: '4,<em>9</em>★',   label: 'Google (era 3,0)' },
      { num: '+<em>150</em>%',  label: 'Ligações' },
      { num: '+<em>80</em>%',   label: 'Rotas pedidas' },
      { num: '+<em>34</em>%',   label: 'Pesquisas orgânicas' },
    ],
    link: 'https://www.caixadaguarevestimentos.com.br/',
    after:  { src: imgCdaDepois, alt: "Site atual da Caixa d'Água Revestimentos, redesenhado" },
    before: { src: imgCdaAntes,  alt: "Site antigo da Caixa d'Água Revestimentos, antes do redesign" },
  },
  {
    id: 'nv8',
    sector: 'Tecnologia · Reposicionamento de Marca',
    name: 'NV8',
    desc: 'O site antigo parecia de uma empresa pequena — mesmo a NV8 sendo referência em tecnologia para grandes clientes. Além disso, era um site só em português, pensado apenas para o público brasileiro. Recriamos a identidade visual do zero e colocamos o site em três idiomas: hoje, no primeiro segundo de acesso, qualquer visitante — daqui ou de fora do Brasil — já sente que está falando com uma empresa de ponta. Isso muda a conversa antes mesmo da primeira reunião comercial.',
    metrics: [
      { num: '1 <em>semana</em>',  label: 'Para lançar, com 6 produtos com página própria' },
      { num: '3 <em>idiomas</em>', label: 'De site local a site internacional' },
    ],
    after:  { src: imgNv8Depois, alt: 'Site atual da NV8, com identidade visual própria e sofisticada' },
    before: { src: imgNv8Antes,  alt: 'Site antigo da NV8, com visual institucional genérico' },
  },
]

const ba = reactive({ cda: 'after', nv8: 'after' })

// ── Outros trabalhos (carrossel) ───────────────────────────
const workFiles = import.meta.glob('../src/assets/servicos/work-*.jpg', {
  eager: true,
  import: 'default',
})

const works = [
  ['lancome',       'Campanha de Dia das Mães para Lancôme'],
  ['mixes1',        "Landing page da linha L'OR Cappuccino"],
  ['mixes3',        "Landing page da linha L'OR Cappuccino, versão 2"],
  ['desktop-exp',   'Site institucional NewCo, versão desktop'],
  ['mobile-exp',    'Site institucional NewCo, versão mobile'],
  ['arf-mobile',    'App mobile da ARF Realty'],
  ['dualipa',       'Landing page de captação para Yves Saint Laurent'],
  ['ysl',           'E-commerce e formulário promocional para Yves Saint Laurent'],
  ['arf-realstate', 'Site da ARF Realty, imóveis de luxo em Miami'],
  ['dermaclub',     'Checkout do e-commerce Dermaclub'],
  ['serena1',       'Landing page de energia renovável'],
  ['serena2',       'Site institucional de energia renovável'],
  ['serena3',       'Mockups mobile de site de energia renovável'],
  ['serena6',       'Páginas internas de site de energia renovável'],
  ['prada',         'Landing page mobile da Prada Paradoxe'],
  ['pucrs',         'Site institucional da PUC-Campinas'],
  ['puc',           'Landing page de captação de leads da PUC-Campinas'],
  ['mercantil1',    'Landing page do Banco Mercantil, saque-aniversário FGTS'],
  ['mercantil2',    'Site do Banco Mercantil, campanha de saque-aniversário FGTS'],
].map(([file, alt]) => ({
  file,
  alt,
  src: workFiles[`../src/assets/servicos/work-${file}.jpg`],
}))

// Posição contínua em JS — desacelera no hover sem resetar
const MARQUEE_NORMAL = 0.55 // px por frame
const MARQUEE_SLOW   = 0.08
const trackRef  = ref(null)
let marqueeTarget = MARQUEE_NORMAL
let marqueeRaf    = 0
let marqueeRO     = null

function slowMarquee (slow) {
  marqueeTarget = slow ? MARQUEE_SLOW : MARQUEE_NORMAL
}

function startMarquee () {
  const track = trackRef.value
  if (!track) return
  if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return

  let speed = MARQUEE_NORMAL
  let pos   = 0
  let half  = 0
  const measure = () => { half = track.scrollWidth / 2 }
  measure()
  marqueeRO = new ResizeObserver(measure)
  marqueeRO.observe(track)

  const tick = () => {
    speed += (marqueeTarget - speed) * 0.04
    pos -= speed
    if (half && pos <= -half) pos += half
    track.style.transform = `translateX(${pos}px)`
    marqueeRaf = requestAnimationFrame(tick)
  }
  marqueeRaf = requestAnimationFrame(tick)
}

// ── Planos ─────────────────────────────────────────────────
const plans = [
  {
    name: 'Starter',
    price: '500',
    desc: 'Para quem precisa de uma página que converte — clara, rápida e com foco total em fazer o visitante agir.',
    features: [
      'Landing page otimizada para conversão',
      'Copy persuasiva incluída',
      'Design responsivo (mobile + desktop)',
      'Até 3 ajustes inclusos',
      'Entrega em até 7 dias após assinatura',
    ],
    href: 'https://pay.kiwify.com.br/Ae8AzB8',
  },
  {
    name: 'Essencial',
    price: '1.000',
    featured: true,
    desc: 'Site completo com estratégia de SEO para quem quer ser encontrado no Google — e converter quem encontra.',
    features: [
      'Tudo do plano Starter',
      'Site completo (múltiplas páginas)',
      'Integrações essenciais: formulários, pixel de conversão, e-mail e calendário de agendamento',
      'Planejamento de SEO orgânico',
      'Otimização para rankeamento no Google',
      'Até 3 ajustes inclusos',
      'Entrega em até 15 dias (conforme complexidade)',
    ],
    href: 'https://pay.kiwify.com.br/EfEnlYv',
  },
  {
    name: 'Premium',
    price: '2.500',
    desc: 'Para crescimento consistente: tudo do Essencial mais 2 meses de acompanhamento e evolução estratégica.',
    features: [
      'Tudo do plano Essencial',
      'Design totalmente personalizado',
      'Copy persuasiva e integrações complexas, com foco máximo em conversão',
      'Configuração e otimização do Google Meu Negócio',
      'Configuração de conta do Google Analytics',
      '2 meses de acompanhamento estratégico',
      'Modificações contínuas baseadas em dados',
      'Relatório mensal de performance',
      'Prioridade de atendimento',
      'Ajustes ilimitados durante o período',
    ],
    href: 'https://pay.kiwify.com.br/3cOiPiQ',
  },
]

// ── Mais serviços ──────────────────────────────────────────
const services = [
  {
    name: 'Identidade Visual · Estratégico',
    price: '1.500',
    desc: 'Marca estratégica e memorável — do conceito às aplicações, pronta para usar em qualquer lugar.',
    features: [
      'Logo em várias versões (principal, horizontal, vertical, monocromática e negativa)',
      'Paleta de cores e tipografia',
      'Arquivos vetoriais para impressão e digital',
      'Manual de marca',
      'Aplicações essenciais (cartão, assinatura de e-mail e redes sociais)',
    ],
    waText: 'Olá! Quero um orçamento de identidade visual.',
  },
  {
    name: 'UX/UI de Produto',
    price: '85',
    period: '/ hora',
    desc: 'Design de app, dashboard ou SaaS — interfaces intuitivas, orientadas a dados e prontas para escalar. Faixa de R$85 a R$220/h.',
    features: [
      'Design de app, dashboard e SaaS',
      'Pesquisa de usuário e wireframes',
      'Protótipos navegáveis',
      'Handoff pronto para desenvolvimento',
      'Cobrança por hora, com estimativa fechada antes de começar',
    ],
    waText: 'Olá! Quero um orçamento de UX/UI de produto.',
  },
]

// ── FAQ ────────────────────────────────────────────────────
const openFaq = ref(null)

const faq = [
  {
    q: 'Qual é o prazo de entrega?',
    a: 'O plano Starter tem entrega em até 7 dias. O Essencial em até 15 dias, podendo variar de acordo com a complexidade do projeto. O Premium segue o mesmo prazo do Essencial para o lançamento — o acompanhamento estratégico começa logo após. Todos os prazos contam a partir da assinatura do contrato.',
  },
  {
    q: 'Posso parcelar o pagamento?',
    a: 'Sim. Os planos podem ser divididos em até 2x no cartão de crédito ou boleto. É obrigatório o pagamento de um sinal de 50% após a assinatura do contrato, com os 50% restantes na entrega — garantindo alinhamento de ambos os lados.',
  },
  {
    q: 'O que acontece depois dos ajustes inclusos?',
    a: 'Após os ajustes inclusos, novos pedidos são orçados separadamente. Quem escolhe o Premium tem ajustes ilimitados durante os 2 meses de acompanhamento.',
  },
  {
    q: 'Preciso já ter domínio e hospedagem?',
    a: 'Não necessariamente. Se você ainda não tem, posso indicar as melhores opções para o seu caso e ajudar na configuração. Se já tem, conectamos direto ao seu serviço atual.',
  },
  {
    q: 'Você trabalha com qualquer tipo de negócio?',
    a: 'Sim — atendo profissionais liberais, pequenos negócios, empreendedores digitais, empresas de pequeno, médio e grande porte e startups em fase inicial. Se você tem um produto ou serviço real para oferecer, podemos ajudar a vender pela internet.',
  },
]

// ── Footer ─────────────────────────────────────────────────
const footerTags = [
  'criaçãodesites', 'landingpage', 'sitequeconverte', 'designerdesites',
  'redesigndesite', 'ecommerce', 'seoorganico', 'googlemeunegocio',
  'identidadevisual', 'sitesparapequenosnegocios', 'freelancerdesigner',
  'sitesresponsivos',
]

// ── Scroll reveal ──────────────────────────────────────────
const rootRef = ref(null)
let revealObs = null

onMounted(() => {
  revealObs = new IntersectionObserver(
    (entries) => {
      entries.forEach((e) => {
        if (e.isIntersecting) {
          e.target.classList.add('visible')
          revealObs.unobserve(e.target)
        }
      })
    },
    { threshold: 0.12, rootMargin: '0px 0px -40px 0px' },
  )
  rootRef.value.querySelectorAll('.reveal').forEach((el) => revealObs.observe(el))

  startMarquee()
})

onUnmounted(() => {
  revealObs?.disconnect()
  marqueeRO?.disconnect()
  cancelAnimationFrame(marqueeRaf)
})
</script>

<style scoped>
/* ── TOKENS LOCAIS (valores da landing) ─────────────────── */
.sv-root {
  --accent-glow   : rgba(219, 21, 82, 0.1);
  --accent-soft   : rgba(219, 21, 82, 0.32);
  --accent-subtle : rgba(219, 21, 82, 0.06);

  position: relative;
  background: var(--bg);
  color: var(--fg);
}

/* ── ATMOSFERA ──────────────────────────────────────────── */
.sv-glow {
  position: fixed;
  top: -20%;
  right: -10%;
  width: 80vw;
  height: 80vw;
  max-width: 900px;
  max-height: 900px;
  background: radial-gradient(ellipse at 65% 30%, var(--accent-glow) 0%, transparent 62%);
  pointer-events: none;
  z-index: 0;
}
.sv-grain {
  position: fixed;
  inset: 0;
  z-index: 0;
  pointer-events: none;
  opacity: var(--grain-opacity);
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");
  background-size: 180px;
}

/* ── LAYOUT ─────────────────────────────────────────────── */
.wrap {
  position: relative;
  z-index: 2;
  max-width: 1120px;
  margin: 0 auto;
  padding: 0 var(--sp-6);
}
section {
  position: relative;
  z-index: 2;
}

/* ── TIPOGRAFIA ─────────────────────────────────────────── */
.t-eyebrow {
  font-size: 0.6rem;
  font-weight: 500;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--fg-muted);
  display: flex;
  align-items: center;
  gap: var(--sp-2);
  margin-bottom: var(--sp-6);
}
.t-display {
  font-family: var(--font-display);
  font-weight: 700;
  font-size: clamp(2.6rem, 7.5vw, 5rem);
  line-height: 0.88;
  letter-spacing: -0.03em;
}
.t-display em {
  font-style: italic;
  color: var(--accent);
}
.t-headline {
  font-family: var(--font-display);
  font-weight: 600;
  font-size: clamp(1.5rem, 4vw, 2.6rem);
  line-height: 1.1;
  letter-spacing: -0.02em;
}
.t-headline em {
  font-style: italic;
  color: var(--accent);
}
.t-body {
  font-size: clamp(0.875rem, 2vw, 1rem);
  font-weight: 300;
  line-height: 1.8;
  color: var(--fg-muted);
}
.t-label {
  font-size: 0.55rem;
  font-weight: 500;
  letter-spacing: 0.16em;
  text-transform: uppercase;
  color: var(--fg-muted);
}

/* ── ELEMENTOS DECORATIVOS ──────────────────────────────── */
.pf-dot {
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background: var(--accent);
  flex-shrink: 0;
  animation: sv-pulse 2.5s ease-in-out infinite;
}
.pf-rule {
  position: relative;
  height: 1px;
  overflow: hidden;
  background: rgba(219, 21, 82, 0.14);
  margin: var(--sp-10) var(--sp-6);
}
.pf-rule::after {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 25%;
  background: linear-gradient(90deg, transparent, var(--accent) 50%, transparent);
  transform: translateX(-100%);
  animation: sv-rule-sweep 3.5s ease-in-out infinite;
}
@keyframes sv-rule-sweep {
  from { transform: translateX(-100%); }
  to   { transform: translateX(500%); }
}
@media (prefers-reduced-motion: reduce) {
  .pf-rule::after { animation: none; }
}

/* ── BOTÕES ─────────────────────────────────────────────── */
.pf-btn {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  height: 52px;
  padding: 0 2rem;
  overflow: hidden;
  outline: none;
  transition: transform 0.15s ease;
  font-family: var(--font-body);
  min-width: 180px;
}
.pf-btn:active { transform: scale(0.97); }
.pf-ring {
  position: absolute;
  inset: -100%;
  animation: sv-spin-ring 3s linear infinite;
  opacity: 0;
  transition: opacity 0.4s ease;
  pointer-events: none;
}
.pf-btn:hover .pf-ring { opacity: 1; }
.pf-veil {
  position: absolute;
  inset: 0;
  transition: opacity 0.4s ease;
  pointer-events: none;
}
.pf-btn:hover .pf-veil { opacity: 0; }
.pf-core {
  position: absolute;
  inset: 1px;
  z-index: 1;
  pointer-events: none;
}
.pf-btn-lbl {
  position: relative;
  z-index: 2;
  font-size: 0.63rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  transition: color 0.2s;
}
.pf-arr {
  display: inline-block;
  transition: transform 0.2s ease;
  margin-left: var(--sp-2);
}
.pf-btn:hover .pf-arr { transform: translateX(4px); }

/* Solid */
.pf-btn--solid .pf-ring {
  background: conic-gradient(from 90deg at 50% 50%, transparent 0%, transparent 75%, rgba(255, 255, 255, 0.85) 100%);
}
.pf-btn--solid .pf-veil    { background: var(--accent); }
.pf-btn--solid .pf-core    { background: var(--accent); }
.pf-btn--solid .pf-btn-lbl { color: #fff; }

/* Ghost */
.pf-btn--ghost .pf-ring {
  background: conic-gradient(from 90deg at 50% 50%, transparent 0%, transparent 75%, var(--accent) 100%);
}
.pf-btn--ghost .pf-veil { background: var(--ghost-border); }
.pf-btn--ghost .pf-core {
  background: var(--btn-fill);
  border: 1px solid var(--ghost-border);
}
.pf-btn--ghost .pf-btn-lbl { color: var(--fg); }

/* ── HERO ───────────────────────────────────────────────── */
#hero {
  min-height: 100svh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: calc(56px + var(--sp-20)) var(--sp-6) var(--sp-20);
  overflow: hidden;
}
.hero-inner {
  max-width: 1120px;
  margin: 0 auto;
  width: 100%;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: var(--sp-16);
  align-items: center;
}
.hero-left {
  display: flex;
  flex-direction: column;
  gap: var(--sp-8);
}
.hero-headline {
  display: flex;
  flex-direction: column;
  gap: var(--sp-3);
}
.hero-ctas {
  display: flex;
  flex-wrap: wrap;
  gap: var(--sp-4);
  margin-top: var(--sp-4);
}
.hero-stats {
  display: flex;
  gap: var(--sp-8);
  margin-top: var(--sp-6);
  padding-top: var(--sp-6);
  border-top: 1px solid var(--border);
}
.stat-item {
  display: flex;
  flex-direction: column;
  gap: 4px;
}
.stat-num {
  font-family: var(--font-display);
  font-size: 1.6rem;
  font-weight: 700;
  color: var(--fg);
  line-height: 1;
}
.stat-num em {
  color: var(--accent);
  font-style: normal;
}
.stat-desc {
  font-size: 0.55rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--fg-muted);
}

/* Hero mockup */
.hero-right {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
}
.hero-mockup {
  width: 100%;
  max-width: 460px;
  border: 1px solid var(--border);
  background: #fff;
  position: relative;
  overflow: hidden;
  aspect-ratio: 4/3;
  box-shadow: 0 8px 48px rgba(13, 12, 26, 0.08);
}
.mockup-bar {
  height: 32px;
  background: var(--fg-faint);
  border-bottom: 1px solid var(--border);
  display: flex;
  align-items: center;
  padding: 0 var(--sp-4);
  gap: var(--sp-2);
}
.mockup-dot {
  width: 8px;
  height: 8px;
  border-radius: 50%;
}
.mockup-body {
  padding: var(--sp-6);
  display: flex;
  flex-direction: column;
  gap: var(--sp-4);
}
.mockup-line {
  height: 8px;
  background: var(--fg-faint);
  border-radius: 4px;
}
.mockup-line--accent {
  background: rgba(219, 21, 82, 0.3);
  width: 60%;
}
.mockup-line--sm { width: 40%; }
.mockup-block {
  margin-top: var(--sp-4);
  height: 80px;
  background: linear-gradient(135deg, rgba(219, 21, 82, 0.06) 0%, rgba(219, 21, 82, 0.02) 100%);
  border: 1px solid rgba(219, 21, 82, 0.12);
}
.mockup-cta {
  display: flex;
  gap: var(--sp-3);
  margin-top: var(--sp-2);
}
.mockup-btn {
  height: 22px;
  border-radius: 2px;
  flex: 1;
}
.mockup-btn--solid { background: rgba(219, 21, 82, 0.5); }
.mockup-btn--ghost { border: 1px solid var(--border); }

.hero-badge {
  position: absolute;
  border: 1px solid var(--border);
  background: var(--glass-bg);
  backdrop-filter: blur(12px);
  -webkit-backdrop-filter: blur(12px);
  padding: var(--sp-3) var(--sp-5);
  display: flex;
  align-items: center;
  gap: var(--sp-3);
  box-shadow: 0 4px 24px rgba(13, 12, 26, 0.08);
}
.hero-badge--tl { top: -20px; left: -20px; }
.hero-badge--br { bottom: -20px; right: -20px; }
.badge-num {
  font-family: var(--font-display);
  font-size: 1rem;
  font-weight: 700;
  color: var(--accent);
  line-height: 1;
}
.badge-txt {
  font-size: 0.5rem;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--fg-muted);
  line-height: 1.4;
}

.hero-grid {
  position: absolute;
  inset: 0;
  z-index: -1;
  pointer-events: none;
  background-image:
    linear-gradient(rgba(13, 12, 26, 0.04) 1px, transparent 1px),
    linear-gradient(90deg, rgba(13, 12, 26, 0.04) 1px, transparent 1px);
  background-size: 60px 60px;
  -webkit-mask-image: radial-gradient(ellipse at 50% 50%, black 0%, transparent 72%);
  mask-image: radial-gradient(ellipse at 50% 50%, black 0%, transparent 72%);
}

/* ── SECTION HEADER ─────────────────────────────────────── */
.sec-header {
  display: flex;
  flex-direction: column;
  gap: var(--sp-5);
  margin-bottom: var(--sp-12);
}
.sec-header--center {
  align-items: center;
  text-align: center;
}
.sec-header--center .t-body { max-width: 48ch; }

/* ── COMO FUNCIONA ──────────────────────────────────────── */
#como-funciona { padding: var(--sp-24) var(--sp-6); }
.steps-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: var(--sp-8);
  position: relative;
}
.steps-grid::before {
  content: "";
  position: absolute;
  top: 28px;
  left: calc(16.66% + 20px);
  right: calc(16.66% + 20px);
  height: 1px;
  background: linear-gradient(90deg, var(--accent-soft), rgba(219, 21, 82, 0.08), var(--accent-soft));
}
.step-card {
  display: flex;
  flex-direction: column;
  gap: var(--sp-5);
  padding: var(--sp-8);
  border: 1px solid var(--border);
  background: #fff;
  transition:
    border-color 0.3s ease,
    transform 0.4s var(--ease-expo),
    box-shadow 0.3s ease;
}
.step-card:hover {
  border-color: var(--accent-soft);
  transform: translateY(-4px);
  box-shadow: 0 8px 32px rgba(219, 21, 82, 0.06);
}
.step-num {
  font-family: var(--font-display);
  font-size: 0.7rem;
  font-weight: 700;
  letter-spacing: 0.1em;
  color: var(--accent);
  width: 44px;
  height: 44px;
  border: 1px solid var(--accent-soft);
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
}
.step-title {
  font-family: var(--font-display);
  font-weight: 600;
  font-size: 1.1rem;
  letter-spacing: -0.01em;
  color: var(--fg);
}
.step-desc {
  font-size: 0.875rem;
  font-weight: 300;
  line-height: 1.75;
  color: var(--fg-muted);
}

/* ── PORTFÓLIO ──────────────────────────────────────────── */
#portfolio { padding: 0 var(--sp-6) var(--sp-24); }

.port-featured {
  border: 1px solid var(--border);
  background: #fff;
  display: grid;
  grid-template-columns: 1fr 1fr;
  min-height: 340px;
  overflow: hidden;
  margin-bottom: var(--sp-6);
  transition:
    border-color 0.3s ease,
    box-shadow 0.3s ease;
  position: relative;
}
.port-featured::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 2px;
  background: linear-gradient(90deg, transparent, var(--accent), transparent);
}
.port-featured:hover {
  border-color: var(--accent-soft);
  box-shadow: 0 16px 56px rgba(219, 21, 82, 0.08);
}
.port-featured-body {
  padding: var(--sp-10);
  display: flex;
  flex-direction: column;
  gap: var(--sp-5);
  justify-content: center;
}
.port-featured-visual {
  display: flex;
  flex-direction: column;
  overflow: hidden;
  background: #0b1a2e;
  min-height: 280px;
}
/* Painéis do toggle — sobrepostos via CSS grid na mesma célula */
.port-featured-frames {
  flex: 1;
  min-height: 0;
  display: grid;
  grid-template-areas: "frame";
  grid-template-rows: 1fr;
  grid-template-columns: 1fr;
}
.ba-panel {
  grid-area: frame;
  display: flex;
  flex-direction: column;
  transition: opacity 0.35s ease;
}
.ba-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: top center;
  display: block;
}

/* Before/After toggle */
.port-ba {
  flex-shrink: 0;
  display: flex;
  justify-content: center;
  background: rgba(11, 26, 46, 0.85);
  backdrop-filter: blur(8px);
  -webkit-backdrop-filter: blur(8px);
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  padding: 5px;
  gap: 2px;
}
.port-ba-btn {
  font-size: 0.48rem;
  font-weight: 500;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: rgba(255, 255, 255, 0.5);
  padding: 5px 14px;
  cursor: pointer;
  transition:
    color 0.2s,
    background 0.2s;
  background: none;
  border: none;
  font-family: inherit;
  border-radius: 1px;
}
.port-ba-btn.active {
  background: var(--accent);
  color: #fff;
}

/* Grid secundário */
.portfolio-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: var(--sp-6);
}
.portfolio-grid .port-card:only-child { grid-column: 1/-1; }
.port-card {
  border: 1px solid var(--border);
  background: #fff;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  transition:
    border-color 0.3s ease,
    transform 0.4s var(--ease-expo),
    box-shadow 0.3s ease;
}
.port-card:hover {
  border-color: var(--accent-soft);
  transform: translateY(-6px);
  box-shadow: 0 12px 40px rgba(219, 21, 82, 0.08);
}
.port-img {
  aspect-ratio: 16/9;
  position: relative;
  overflow: hidden;
}
.port-img-inner {
  position: absolute;
  inset: 0;
  display: flex;
  flex-direction: column;
  gap: var(--sp-3);
  padding: var(--sp-5);
  transition: transform 0.5s var(--ease-expo);
}
.port-card:hover .port-img-inner { transform: scale(1.03); }
.port-body {
  padding: var(--sp-6);
  display: flex;
  flex-direction: column;
  gap: var(--sp-3);
}
.port-sector {
  font-size: 0.5rem;
  letter-spacing: 0.16em;
  text-transform: uppercase;
  color: var(--accent);
}
.port-featured-name {
  font-family: var(--font-display);
  font-weight: 700;
  font-size: clamp(1.4rem, 3vw, 2rem);
  letter-spacing: -0.025em;
  color: var(--fg);
  line-height: 1.05;
}
.port-featured-name :deep(em) {
  color: var(--accent);
  font-style: italic;
}
.port-name {
  font-family: var(--font-display);
  font-weight: 600;
  font-size: 1.05rem;
  letter-spacing: -0.01em;
  color: var(--fg);
}
.port-desc {
  font-size: 0.8rem;
  font-weight: 300;
  line-height: 1.65;
  color: var(--fg-muted);
}
.port-metrics {
  display: flex;
  flex-wrap: wrap;
  gap: var(--sp-5) var(--sp-6);
  margin-top: var(--sp-2);
}
.port-metric {
  display: flex;
  align-items: center;
  gap: var(--sp-2);
  margin-top: auto;
  padding-top: var(--sp-4);
  border-top: 1px solid var(--border);
  font-size: 0.55rem;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--fg-muted);
}
.port-metric-val {
  color: var(--accent);
  font-family: var(--font-display);
  font-size: 0.85rem;
  font-weight: 700;
}
.port-metric-item {
  display: flex;
  flex-direction: column;
  gap: 3px;
}
.port-metric-num {
  font-family: var(--font-display);
  font-weight: 700;
  font-size: 1.4rem;
  letter-spacing: -0.02em;
  color: var(--fg);
}
.port-metric-num :deep(em) {
  color: var(--accent);
  font-style: normal;
}
.port-metric-lbl {
  font-size: 0.5rem;
  letter-spacing: 0.12em;
  text-transform: uppercase;
  color: var(--fg-muted);
}
.port-badge-featured {
  display: inline-flex;
  align-items: center;
  gap: var(--sp-2);
  background: var(--accent-subtle);
  border: 1px solid var(--accent-soft);
  padding: var(--sp-1) var(--sp-3);
  margin-bottom: var(--sp-3);
  font-size: 0.48rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--accent);
}
.port-link {
  display: inline-flex;
  align-items: center;
  gap: var(--sp-2);
  font-size: 0.58rem;
  font-weight: 500;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--accent);
  margin-top: var(--sp-4);
  transition: gap 0.2s;
}
.port-link:hover { gap: var(--sp-3); }

@media (max-width: 780px) {
  .port-featured { grid-template-columns: 1fr; }
  .port-featured-visual { min-height: 220px; }
  .portfolio-grid { grid-template-columns: 1fr; }
}

/* ── SOBRE ──────────────────────────────────────────────── */
#sobre { padding: 0 var(--sp-6) var(--sp-24); }
.about-grid {
  display: grid;
  grid-template-columns: 0.8fr 1.2fr;
  gap: var(--sp-12);
  align-items: center;
}
.about-media {
  border: 1px solid var(--border);
  overflow: hidden;
}
.about-media img {
  width: 100%;
  height: 100%;
  aspect-ratio: 3/4;
  object-fit: cover;
  display: block;
}
.about-text {
  display: flex;
  flex-direction: column;
  gap: var(--sp-4);
  margin: var(--sp-6) 0;
}
.about-text p {
  font-size: 0.875rem;
  font-weight: 300;
  line-height: 1.8;
  color: var(--fg-muted);
}

@media (max-width: 780px) {
  .about-grid {
    grid-template-columns: 1fr;
    gap: var(--sp-8);
  }
  .about-media img { aspect-ratio: 4/3; }
}

/* ── OUTROS TRABALHOS (carrossel) ───────────────────────── */
#outros-trabalhos { padding: var(--sp-16) 0 var(--sp-24); }
#outros-trabalhos .wrap { margin-bottom: var(--sp-10); }
.marquee {
  position: relative;
  overflow: hidden;
  width: 100%;
}
.marquee::before,
.marquee::after {
  content: "";
  position: absolute;
  top: 0;
  bottom: 0;
  width: 120px;
  z-index: 2;
  pointer-events: none;
}
.marquee::before {
  left: 0;
  background: linear-gradient(90deg, var(--bg), transparent);
}
.marquee::after {
  right: 0;
  background: linear-gradient(270deg, var(--bg), transparent);
}
.marquee-track {
  display: flex;
  align-items: center;
  gap: var(--sp-6);
  width: max-content;
  will-change: transform;
}
.marquee-img {
  height: 260px;
  width: auto;
  max-width: none;
  display: block;
  flex-shrink: 0;
  border: 1px solid var(--border);
  background: #fff;
}
@media (max-width: 780px) {
  .marquee-img { height: 170px; }
  .marquee::before,
  .marquee::after { width: 60px; }
}

/* ── DEPOIMENTOS ────────────────────────────────────────── */
#depoimentos { padding: 0 var(--sp-6) var(--sp-24); }
.test-showcase {
  max-width: 1000px;
  margin: 0 auto;
}
.test-showcase img {
  width: 100%;
  height: auto;
  display: block;
}

/* ── PLANOS ─────────────────────────────────────────────── */
#planos { padding: 0 var(--sp-6) var(--sp-24); }
.plans-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: var(--sp-6);
  align-items: start;
}
.plan-card {
  border: 1px solid var(--border);
  background: #fff;
  padding: var(--sp-8);
  display: flex;
  flex-direction: column;
  gap: var(--sp-6);
  position: relative;
  transition:
    transform 0.4s var(--ease-expo),
    border-color 0.3s,
    box-shadow 0.3s;
}
.plan-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 32px rgba(13, 12, 26, 0.06);
}
.plan-card--featured {
  border-color: var(--accent-soft);
  background: linear-gradient(160deg, rgba(219, 21, 82, 0.04) 0%, #fff 50%);
}
.plan-card--featured::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 2px;
  background: linear-gradient(90deg, transparent, var(--accent), transparent);
}
.plan-badge {
  position: absolute;
  top: var(--sp-6);
  right: var(--sp-6);
  background: var(--accent);
  color: #fff;
  font-size: 0.45rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  padding: var(--sp-1) var(--sp-3);
}
.plan-name {
  font-family: var(--font-display);
  font-size: 0.65rem;
  font-weight: 600;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--fg-muted);
}
.plan-price {
  display: flex;
  align-items: baseline;
  gap: var(--sp-2);
}
.plan-currency {
  font-size: 0.8rem;
  font-weight: 500;
  color: var(--fg-muted);
  margin-top: 4px;
}
.plan-val {
  font-family: var(--font-display);
  font-size: 2.8rem;
  font-weight: 700;
  line-height: 1;
  letter-spacing: -0.03em;
  color: var(--fg);
}
.plan-card--featured .plan-val { color: var(--accent); }
.plan-from {
  font-size: 0.6rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  color: var(--fg-muted);
  margin-bottom: 6px;
}
.plan-period {
  font-size: 0.85rem;
  font-weight: 400;
  color: var(--fg-muted);
  align-self: flex-end;
  margin-bottom: 6px;
}
.plan-desc {
  font-size: 0.85rem;
  font-weight: 300;
  line-height: 1.7;
  color: var(--fg-muted);
}
.plan-divider {
  height: 1px;
  background: var(--border);
}
.plan-features {
  display: flex;
  flex-direction: column;
  gap: var(--sp-4);
  list-style: none;
}
.plan-feature {
  display: flex;
  align-items: flex-start;
  gap: var(--sp-3);
  font-size: 0.825rem;
  font-weight: 300;
  line-height: 1.5;
  color: var(--fg);
}
.plan-feature-check {
  width: 16px;
  height: 16px;
  border: 1px solid var(--accent-soft);
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  margin-top: 1px;
}
.plan-feature-check svg { color: var(--accent); }

/* ── MAIS SERVIÇOS ──────────────────────────────────────── */
#mais-servicos { padding: 0 var(--sp-6) var(--sp-24); }
.services-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: var(--sp-6);
  align-items: start;
  max-width: 880px;
  margin: 0 auto;
}
@media (max-width: 960px) {
  .services-grid { grid-template-columns: 1fr; }
}

/* ── FAQ ────────────────────────────────────────────────── */
#faq { padding: 0 var(--sp-6) var(--sp-24); }
.faq-inner {
  max-width: 720px;
  margin: 0 auto;
}
.faq-list {
  display: flex;
  flex-direction: column;
}
.faq-item { border-bottom: 1px solid var(--border); }
.faq-question {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: var(--sp-6) 0;
  text-align: left;
  font-family: var(--font-display);
  font-size: 1rem;
  font-weight: 600;
  letter-spacing: -0.01em;
  color: var(--fg);
  cursor: pointer;
  transition: color 0.2s;
  gap: var(--sp-6);
}
.faq-question:hover { color: var(--accent); }
.faq-icon {
  width: 24px;
  height: 24px;
  border: 1px solid var(--border);
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  transition:
    border-color 0.2s,
    transform 0.3s var(--ease-expo);
}
.faq-item.open .faq-icon {
  border-color: var(--accent-soft);
  transform: rotate(45deg);
}
.faq-answer {
  max-height: 0;
  overflow: hidden;
  transition:
    max-height 0.4s var(--ease-expo),
    padding 0.3s ease;
}
.faq-item.open .faq-answer {
  max-height: 300px;
  padding-bottom: var(--sp-6);
}
.faq-answer p {
  font-size: 0.9rem;
  font-weight: 300;
  line-height: 1.8;
  color: var(--fg-muted);
}

/* ── IMPORTÂNCIA DO SITE ────────────────────────────────── */
#importancia { padding: 0 var(--sp-6) var(--sp-24); }
.importance-highlight {
  margin: var(--sp-10) auto 0;
  max-width: 640px;
  border: 1px solid var(--accent-soft);
  background: var(--accent-subtle);
  padding: var(--sp-6) var(--sp-8);
  text-align: center;
}
.importance-highlight p {
  font-size: 0.9rem;
  font-weight: 300;
  line-height: 1.7;
  color: var(--fg);
}
.importance-highlight strong {
  color: var(--accent);
  font-family: var(--font-display);
  font-weight: 700;
}

/* ── CTA FINAL ──────────────────────────────────────────── */
#cta-final {
  padding: var(--sp-24) var(--sp-6);
  text-align: center;
  position: relative;
  overflow: hidden;
}
.cta-glow {
  position: absolute;
  bottom: -50%;
  left: 50%;
  transform: translateX(-50%);
  width: 600px;
  height: 600px;
  background: radial-gradient(ellipse, rgba(219, 21, 82, 0.08) 0%, transparent 65%);
  pointer-events: none;
}
.cta-inner {
  position: relative;
  z-index: 2;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: var(--sp-8);
}
.cta-rule {
  width: 60px;
  height: 1px;
  background: linear-gradient(90deg, transparent, var(--accent), transparent);
  margin-bottom: var(--sp-4);
}
.cta-btns {
  display: flex;
  flex-wrap: wrap;
  gap: var(--sp-4);
  justify-content: center;
}

/* ── FOOTER ─────────────────────────────────────────────── */
footer {
  padding: var(--sp-8) var(--sp-6);
  border-top: 1px solid var(--border);
  display: flex;
  flex-direction: column;
  gap: var(--sp-6);
  position: relative;
  z-index: 2;
}
.footer-top {
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: var(--sp-4);
  /* respiro para o botão "voltar ao topo" não cobrir os links */
  padding-right: var(--sp-16);
}
.footer-logo {
  display: flex;
  align-items: center;
}
.footer-logo img {
  height: 22px;
  width: auto;
  display: block;
}
.footer-copy {
  font-size: 0.55rem;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--fg-muted);
}
.footer-links {
  display: flex;
  gap: var(--sp-6);
}
.footer-link {
  font-size: 0.55rem;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--fg-muted);
  transition: color 0.2s;
}
.footer-link:hover { color: var(--fg); }
.footer-tags {
  display: flex;
  flex-wrap: wrap;
  gap: var(--sp-2) var(--sp-5);
  padding-top: var(--sp-6);
  border-top: 1px solid var(--border);
}
.footer-tag {
  font-size: 0.6rem;
  color: var(--fg-muted);
  opacity: 0.65;
}

/* ── ANIMAÇÕES ──────────────────────────────────────────── */
@keyframes sv-pulse {
  0%, 100% { opacity: 1;   transform: scale(1); }
  50%      { opacity: 0.3; transform: scale(0.75); }
}
@keyframes sv-spin-ring {
  to { transform: rotate(360deg); }
}
@keyframes sv-fade-up {
  from { opacity: 0; transform: translateY(28px); filter: blur(8px); }
  to   { opacity: 1; transform: translateY(0);    filter: blur(0); }
}

.reveal {
  opacity: 0;
  transform: translateY(24px);
  filter: blur(5px);
  transition:
    opacity 0.8s var(--ease-expo),
    transform 0.8s var(--ease-expo),
    filter 0.8s var(--ease-expo);
}
.reveal.visible {
  opacity: 1;
  transform: translateY(0);
  filter: blur(0);
}
.reveal-d1 { transition-delay: 0.1s; }
.reveal-d2 { transition-delay: 0.2s; }
.reveal-d3 { transition-delay: 0.3s; }
.reveal-d4 { transition-delay: 0.4s; }

.hero-anim    { animation: sv-fade-up 0.9s var(--ease-expo) both; }
.hero-anim-d1 { animation-delay: 0.1s; }
.hero-anim-d2 { animation-delay: 0.22s; }
.hero-anim-d3 { animation-delay: 0.36s; }
.hero-anim-d4 { animation-delay: 0.52s; }

@media (prefers-reduced-motion: reduce) {
  .reveal {
    opacity: 1;
    transform: none;
    filter: none;
    transition: none;
  }
  .hero-anim { animation: none; }
}

/* ── RESPONSIVE ─────────────────────────────────────────── */
@media (max-width: 960px) {
  .hero-inner { grid-template-columns: 1fr; }
  .hero-right { display: none; }
  .steps-grid { grid-template-columns: 1fr; }
  .steps-grid::before { display: none; }
  .plans-grid { grid-template-columns: 1fr; }
  .plan-card--featured { order: -1; }
}
@media (max-width: 640px) {
  .hero-ctas .pf-btn {
    min-width: 0;
    flex: 1;
  }
}
@media (min-width: 961px) {
  #como-funciona .wrap,
  #portfolio .wrap,
  #depoimentos .wrap,
  #planos .wrap,
  #faq .wrap,
  #cta-final .wrap { padding: 0 var(--sp-10); }
}
@media (min-width: 1200px) {
  #como-funciona .wrap,
  #portfolio .wrap,
  #depoimentos .wrap,
  #planos .wrap,
  #faq .wrap,
  #cta-final .wrap { padding: 0 var(--sp-16); }
}
</style>
