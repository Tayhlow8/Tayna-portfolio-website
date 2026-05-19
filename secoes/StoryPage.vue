<template>
  <div :class="['sp-root', `theme-${theme}`]">
    <!-- Camera flash overlay — fires on slide 6 → 7 transition -->
    <div
      class="sp-flash"
      :class="{ 'sp-flash--active': flashActive }"
      aria-hidden="true"
    ></div>

    <div class="sp-grain" aria-hidden="true"></div>
    <NavBar v-model:lang="lang" v-model:theme="theme" />

    <!-- ── Slides — first two screens ──────────────────────────── -->
    <div
      class="sp-slides"
      ref="slidesRef"
      @touchstart.passive="handleTouchStart"
      @touchend.passive="handleTouchEnd"
    >
      <!-- ── Slide 1: Hero ──────────────────────────────────────── -->
      <section
        class="sp-slide sp-slide--hero"
        :class="{ 'sp-slide--exit': currentSlide > 0 }"
      >
        <!-- Text: slides in from left -->
        <div class="sp-hero-text" :class="{ 'sp-hero-text--in': heroIn }">
          <div class="sp-eyebrow">
            <span class="sp-dot" aria-hidden="true"></span>
            {{ t.eyebrow }}
          </div>

          <h1 class="sp-title">
            <span class="sp-title-static">{{ t.titleStatic }}</span>
            <em class="sp-title-typing"
              >{{ typedText
              }}<span
                class="sp-cursor"
                :class="{ 'sp-cursor--done': typingDone }"
              ></span
            ></em>
          </h1>

          <p class="sp-lead">{{ t.lead }}</p>
        </div>

        <!-- Avatar: slides in from right -->
        <div
          class="sp-hero-avatar"
          :class="{ 'sp-hero-avatar--in': heroIn }"
          aria-hidden="true"
        >
          <img :src="avatarSrc" alt="" class="sp-avatar-img" />
        </div>

        <!-- Scroll hint -->
        <div
          class="sp-scroll-hint"
          :class="{ 'sp-scroll-hint--gone': currentSlide > 0 }"
        >
          <span class="sp-scroll-label">{{ t.scrollHint }}</span>
          <div class="sp-scroll-mouse">
            <div class="sp-scroll-dot"></div>
          </div>
        </div>
      </section>

      <!-- ── Slide 2: Chapter 1 — Journalist ───────────────────── -->
      <section
        class="sp-slide sp-slide--ch1"
        :class="{
          'sp-slide--active': currentSlide === 1,
          'sp-slide--exit': currentSlide > 1 && !ch1ZoomExit,
          'sp-slide--zoom-exit': currentSlide > 1 && ch1ZoomExit,
        }"
      >
        <!-- Image pair: blurred shadow + main -->
        <div
          class="sp-ch1-images"
          :class="{ 'sp-ch1-images--in': ch1In }"
          aria-hidden="true"
        >
          <img :src="sittedSrc" alt="" class="sp-ch1-img sp-ch1-img--blur" />
          <img :src="sittedSrc" alt="" class="sp-ch1-img sp-ch1-img--main" />
        </div>

        <!-- Content -->
        <div class="sp-ch1-body" :class="{ 'sp-ch1-body--in': ch1In }">
          <!-- Timeline node -->
          <div class="sp-ch1-node" aria-hidden="true">
            <span class="sp-node-dot"></span>
            <span class="sp-node-ring"></span>
          </div>

          <span class="sp-period">{{ t.chapters[0].period }}</span>
          <h2 class="sp-ch1-title" v-html="t.chapters[0].title"></h2>

          <div class="sp-text">
            <p
              v-for="(para, pi) in t.chapters[0].paras"
              :key="pi"
              v-html="para"
            ></p>
          </div>

          <div v-if="t.chapters[0].tags" class="sp-tags">
            <span v-for="tag in t.chapters[0].tags" :key="tag" class="sp-tag">{{
              tag
            }}</span>
          </div>
        </div>
      </section>

      <!-- ── Slide 3: Chapter 2 — Pandemic ────────────────────── -->
      <section
        class="sp-slide sp-slide--ch2"
        :class="{
          'sp-slide--active': currentSlide === 2,
          'sp-slide--exit': currentSlide > 2 && !ch2ZoomExit,
          'sp-slide--zoom-exit': currentSlide > 2 && ch2ZoomExit,
        }"
      >
        <!-- Content: slides in from left -->
        <div class="sp-ch2-body" :class="{ 'sp-ch2-body--in': ch2In }">
          <div class="sp-ch2-node" aria-hidden="true">
            <span class="sp-node-dot"></span>
            <span class="sp-node-ring"></span>
          </div>
          <span class="sp-period">{{ t.chapters[1].period }}</span>
          <h2 class="sp-ch2-title" v-html="t.chapters[1].title"></h2>
          <div class="sp-text">
            <p
              v-for="(para, pi) in t.chapters[1].paras"
              :key="pi"
              v-html="para"
            ></p>
          </div>
          <div v-if="t.chapters[1].tags" class="sp-tags">
            <span v-for="tag in t.chapters[1].tags" :key="tag" class="sp-tag">{{
              tag
            }}</span>
          </div>
        </div>

        <!-- Photo: slides in from right, full bleed -->
        <div
          class="sp-ch2-image"
          :class="{ 'sp-ch2-image--in': ch2In }"
          aria-hidden="true"
        >
          <img :src="pandemicSrc" alt="" class="sp-ch2-img" />
        </div>
      </section>

      <!-- ── Slide 4: Chapter 3 — L'Oréal ─────────────────────── -->
      <section
        class="sp-slide sp-slide--ch3"
        :class="{
          'sp-slide--active': currentSlide === 3,
          'sp-slide--break-exit': currentSlide > 3 && ch3BreakExit,
          'sp-slide--exit': currentSlide > 3 && !ch3BreakExit,
        }"
      >
        <!-- Content: slides in from left -->
        <div class="sp-ch3-body" :class="{ 'sp-ch3-body--in': ch3In }">
          <div class="sp-ch3-node" aria-hidden="true">
            <span class="sp-node-dot"></span>
            <span class="sp-node-ring"></span>
          </div>

          <span class="sp-period">{{ t.chapters[2].period }}</span>
          <h2 class="sp-ch3-title" v-html="t.chapters[2].title"></h2>

          <span v-if="t.chapters[2].company" class="sp-company">{{
            t.chapters[2].company
          }}</span>

          <div class="sp-text">
            <p
              v-for="(para, pi) in t.chapters[2].paras"
              :key="pi"
              v-html="para"
            ></p>
          </div>

          <div
            v-if="t.chapters[2].highlights"
            class="sp-highlights sp-ch3-highlights"
          >
            <div
              v-for="h in t.chapters[2].highlights"
              :key="h.label"
              class="sp-highlight"
            >
              <b class="sp-hl-num">{{ h.num }}</b>
              <span class="sp-hl-label">{{ h.label }}</span>
            </div>
          </div>

          <div v-if="t.chapters[2].tags" class="sp-tags">
            <span v-for="tag in t.chapters[2].tags" :key="tag" class="sp-tag">{{
              tag
            }}</span>
          </div>
        </div>

        <!-- Illustration: slides in from right, bottom-aligned -->
        <div
          class="sp-ch3-image"
          :class="{ 'sp-ch3-image--in': ch3In }"
          aria-hidden="true"
        >
          <img :src="lorealSrc" alt="" class="sp-ch3-img" />
        </div>
      </section>

      <!-- ── Slide 5: Chapter 4 — Rodobens ────────────────────── -->
      <section
        class="sp-slide sp-slide--ch4"
        :class="{
          'sp-slide--active': currentSlide === 4,
          'sp-slide--exit': currentSlide > 4,
        }"
      >
        <!-- Image: left side, bleeds left edge -->
        <div
          class="sp-ch4-image"
          :class="{ 'sp-ch4-image--in': ch4In }"
          aria-hidden="true"
        >
          <img :src="rodobensSrc" alt="" class="sp-ch4-img" />
        </div>

        <!-- Content: right side -->
        <div class="sp-ch4-body" :class="{ 'sp-ch4-body--in': ch4In }">
          <div class="sp-ch4-node" aria-hidden="true">
            <span class="sp-node-dot"></span>
            <span class="sp-node-ring"></span>
          </div>

          <span class="sp-period">{{ t.chapters[3].period }}</span>
          <h2 class="sp-ch4-title" v-html="t.chapters[3].title"></h2>

          <span v-if="t.chapters[3].company" class="sp-company">{{
            t.chapters[3].company
          }}</span>

          <div class="sp-text">
            <p
              v-for="(para, pi) in t.chapters[3].paras"
              :key="pi"
              v-html="para"
            ></p>
          </div>

          <div v-if="t.chapters[3].highlights" class="sp-highlights">
            <div
              v-for="h in t.chapters[3].highlights"
              :key="h.label"
              class="sp-highlight"
            >
              <b class="sp-hl-num">{{ h.num }}</b>
              <span class="sp-hl-label">{{ h.label }}</span>
            </div>
          </div>

          <div v-if="t.chapters[3].tags" class="sp-tags">
            <span v-for="tag in t.chapters[3].tags" :key="tag" class="sp-tag">{{
              tag
            }}</span>
          </div>
        </div>
      </section>

      <!-- ── Slide 6: Chapter 5 — Vibe Coding ─────────────────── -->
      <section
        class="sp-slide sp-slide--ch5"
        :class="{
          'sp-slide--active': currentSlide === 5,
          'sp-slide--exit': currentSlide > 5,
        }"
      >
        <!-- Content: left side -->
        <div class="sp-ch5-body" :class="{ 'sp-ch5-body--in': ch5In }">
          <div class="sp-ch5-node" aria-hidden="true">
            <span class="sp-node-dot"></span>
            <span class="sp-node-ring"></span>
          </div>

          <span class="sp-period">{{ t.chapters[4].period }}</span>
          <h2 class="sp-ch5-title" v-html="t.chapters[4].title"></h2>

          <span v-if="t.chapters[4].company" class="sp-company">{{
            t.chapters[4].company
          }}</span>

          <div class="sp-text">
            <p
              v-for="(para, pi) in t.chapters[4].paras"
              :key="pi"
              v-html="para"
            ></p>
          </div>

          <div v-if="t.chapters[4].highlights" class="sp-highlights">
            <div
              v-for="h in t.chapters[4].highlights"
              :key="h.label"
              class="sp-highlight"
            >
              <b class="sp-hl-num">{{ h.num }}</b>
              <span class="sp-hl-label">{{ h.label }}</span>
            </div>
          </div>

          <div v-if="t.chapters[4].tags" class="sp-tags">
            <span v-for="tag in t.chapters[4].tags" :key="tag" class="sp-tag">{{
              tag
            }}</span>
          </div>
        </div>

        <!-- Image: right side, full bleed -->
        <div
          class="sp-ch5-image"
          :class="{ 'sp-ch5-image--in': ch5In }"
          aria-hidden="true"
        >
          <img :src="worldSrc" alt="" class="sp-ch5-img" />
        </div>
      </section>

      <!-- ── Slide 7: CTA ───────────────────────────────────────── -->
      <section
        class="sp-slide sp-slide--cta"
        :class="{ 'sp-slide--active': currentSlide === 6 }"
      >
        <div class="sp-cta-cover" aria-hidden="true">
          <img :src="gen6Src" alt="" class="sp-cta-cover-img" />
        </div>
        <div class="sp-cta-overlay" :class="{ 'sp-cta-overlay--in': ctaIn }">
          <p class="sp-cta-headline">{{ t.ctaLabel }}</p>
          <PfButton
            variant="solid"
            :href="`mailto:tayna.schultz@gmail.com?subject=${encodeURIComponent(t.mailSubject)}`"
          >
            {{ t.cta }}
            <svg
              width="12"
              height="12"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
              aria-hidden="true"
              style="margin-left: 0.45rem"
            >
              <path d="M5 12h14M12 5l7 7-7 7" />
            </svg>
          </PfButton>
        </div>
      </section>

      <!-- ── Slide 8: Epilogue — developed photo ────────────────── -->
      <section
        class="sp-slide sp-slide--epilogue"
        :class="{ 'sp-slide--active': currentSlide === 7 }"
      >
        <div class="sp-ep-inner" :class="{ 'sp-ep-inner--in': epilogueIn }">
          <p class="sp-ep-headline">{{ t.epilogueHeadline }}</p>
          <div class="sp-ep-btns">
            <PfButton variant="ghost" href="/">{{ t.homeCta }}</PfButton>
            <PfButton variant="solid" href="/projetos">
              {{ t.projectsCta }}
              <svg
                width="12"
                height="12"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
                aria-hidden="true"
                style="margin-left: 0.45rem"
              >
                <path d="M5 12h14M12 5l7 7-7 7" />
              </svg>
            </PfButton>
          </div>
        </div>
      </section>
    </div>
    <!-- /.sp-slides -->
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted, watch } from "vue";
import NavBar from "./NavBar.vue";
import PfButton from "../src/components/PfButton.vue";
import { useLang } from "../src/composables/useLang";

const props = defineProps({
  lang: { type: String, default: "PT" },
  theme: { type: String, default: "light" },
});

const { lang } = useLang();
const theme = ref(props.theme);

// Assets — URL constructor handles spaces in filenames
const avatarSrc = new URL("../src/assets/first avatar.webp", import.meta.url)
  .href;
const sittedSrc = new URL(
  "../src/assets/generated sitted nobg.webp",
  import.meta.url,
).href;
const pandemicSrc = new URL("../src/assets/pandemic.webp", import.meta.url)
  .href;
const lorealSrc = new URL("../src/assets/gen4.webp", import.meta.url).href;
const rodobensSrc = new URL("../src/assets/rodobens.webp", import.meta.url)
  .href;
const worldSrc = new URL(
  "../src/assets/world as my office.webp",
  import.meta.url,
).href;
const gen6Src = new URL("../src/assets/gen6.webp", import.meta.url).href;

// ── Slide system (8 slides) ───────────────────────────────────
const LAST_SLIDE = 7;
const slidesRef = ref(null);
const currentSlide = ref(0);
const isTransitioning = ref(false);
const ch1In = ref(false);
const ch2In = ref(false);
const ch3In = ref(false);
const ch4In = ref(false);
const ch5In = ref(false);
const ctaIn = ref(false);
const epilogueIn = ref(false);
const flashActive = ref(false);
// exit style flags: zoom-in (magnify) or break (slide+blur)
const ch1ZoomExit = ref(false);
const ch2ZoomExit = ref(false);
const ch3BreakExit = ref(false);

function goToSlide(n) {
  if (isTransitioning.value || n === currentSlide.value) return;
  isTransitioning.value = true;
  const prev = currentSlide.value;
  currentSlide.value = n;
  // ch1: magnify exit going forward to ch2, reset when returning
  if (prev === 1 && n === 2) ch1ZoomExit.value = true;
  if (n === 1) ch1ZoomExit.value = false;
  // ch2: magnify exit going forward to ch3, reset when returning
  if (prev === 2 && n === 3) ch2ZoomExit.value = true;
  if (n === 2) ch2ZoomExit.value = false;
  // ch3: break exit going forward to ch4, reset when returning
  if (prev === 3 && n === 4) ch3BreakExit.value = true;
  if (n === 3) ch3BreakExit.value = false;
  if (prev === 1) ch1In.value = false;
  if (prev === 2) ch2In.value = false;
  if (prev === 3) ch3In.value = false;
  if (prev === 4) ch4In.value = false;
  if (prev === 5) ch5In.value = false;
  if (prev === 6) ctaIn.value = false;
  if (prev === 7) epilogueIn.value = false;
  // camera flash: fire when entering the epilogue slide
  if (n === 7) {
    flashActive.value = true;
    setTimeout(() => {
      flashActive.value = false;
    }, 750);
  }
  if (n === 1)
    setTimeout(() => {
      ch1In.value = true;
    }, 120);
  if (n === 2)
    setTimeout(() => {
      ch2In.value = true;
    }, 120);
  if (n === 3)
    setTimeout(() => {
      ch3In.value = true;
    }, 120);
  if (n === 4)
    setTimeout(() => {
      ch4In.value = true;
    }, 120);
  if (n === 5)
    setTimeout(() => {
      ch5In.value = true;
    }, 120);
  if (n === 6)
    setTimeout(() => {
      ctaIn.value = true;
    }, 200);
  if (n === 7)
    setTimeout(() => {
      epilogueIn.value = true;
    }, 500);
  setTimeout(() => {
    isTransitioning.value = false;
  }, 1100);
}

function handleWheel(e) {
  if (isTransitioning.value) {
    e.preventDefault();
    return;
  }
  if (currentSlide.value < LAST_SLIDE && e.deltaY > 20) {
    e.preventDefault();
    goToSlide(currentSlide.value + 1);
  } else if (currentSlide.value > 0 && e.deltaY < -20 && window.scrollY < 5) {
    e.preventDefault();
    goToSlide(currentSlide.value - 1);
  }
}

let touchStartY = 0;
const handleTouchStart = (e) => {
  touchStartY = e.touches[0].clientY;
};
const handleTouchEnd = (e) => {
  if (isTransitioning.value) return;
  const dy = touchStartY - e.changedTouches[0].clientY;
  if (currentSlide.value < LAST_SLIDE && dy > 50)
    goToSlide(currentSlide.value + 1);
  else if (currentSlide.value > 0 && dy < -50 && window.scrollY < 5)
    goToSlide(currentSlide.value - 1);
};

// ── Hero entrance ─────────────────────────────────────────────
const heroIn = ref(false);

// ── Typing animation ──────────────────────────────────────────
const typedText = ref("");
const typingDone = ref(false);
let typingTimer = null;

function startTyping() {
  clearInterval(typingTimer);
  const full = t.value.titleTyping;
  let idx = 0;
  typedText.value = "";
  typingDone.value = false;
  typingTimer = setInterval(() => {
    idx++;
    typedText.value = full.slice(0, idx);
    if (idx >= full.length) {
      clearInterval(typingTimer);
      typingDone.value = true;
    }
  }, 52);
}

// ── Scroll reveal for timeline chapters ──────────────────────
const chapterRefs = ref([]);
const visible = ref([]);
const setRef = (el, i) => {
  if (el) chapterRefs.value[i] = el;
};

let observer = null;
onMounted(() => {
  setTimeout(() => {
    heroIn.value = true;
  }, 80);
  setTimeout(startTyping, 900);

  // Wheel with passive:false so we can preventDefault
  slidesRef.value?.addEventListener("wheel", handleWheel, { passive: false });

  observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        const i = chapterRefs.value.indexOf(entry.target);
        if (entry.isIntersecting && i !== -1) visible.value[i] = true;
      });
    },
    { threshold: 0.12 },
  );
  chapterRefs.value.forEach((el) => el && observer.observe(el));
});

onUnmounted(() => {
  clearInterval(typingTimer);
  observer?.disconnect();
  slidesRef.value?.removeEventListener("wheel", handleWheel);
});

watch(lang, () => {
  clearInterval(typingTimer);
  typedText.value = "";
  typingDone.value = false;
  setTimeout(startTyping, 300);
});

// ── Copy ──────────────────────────────────────────────────────
const copy = {
  PT: {
    eyebrow: "Minha história",
    titleStatic: "De repórter a designer.",
    titleTyping: "A viagem que nunca parei.",
    lead: "Cinco anos, três grandes viradas e uma certeza: design é o lugar onde eu decido fazer parte das causas, não só registrar as consequências.",
    scrollHint: "Role para interagir",
    ctaLabel:
      "Essa história ainda está sendo escrita — quer fazer parte do próximo capítulo?",
    cta: "Vamos conversar",
    mailSubject: "Olá, Tayná — vi sua história e quero conversar",
    epilogueHeadline: "Pronta para o próximo capítulo.",
    homeCta: "Voltar ao início",
    projectsCta: "Ver projetos",
    chapters: [
      {
        period: "2014 — 2020",
        title: "Era uma vez<br><em>uma jornalista.</em>",
        company: null,
        paras: [
          "Desde o início da minha graduação na Pontifícia Universidade Católica do Rio Grande do Sul, em 2014, passei cinco anos fazendo o que me ensinaram a amar: contar histórias, investigar, comunicar. Mas com o tempo percebi que o jornalismo me colocava sempre do lado das <strong>consequências</strong> — eu chegava depois que os problemas já tinham acontecido.",
          "Queria estar do lado das <strong>causas</strong>. Queria construir coisas que mudassem como as pessoas vivem, não só narrar essa mudança de longe.",
        ],
        highlights: null,
        tags: ["Jornalismo", "Comunicação", "Narrativa", "Pesquisa"],
      },
      {
        period: "2020",
        title: "A pandemia,<br><em>e uma nova tela.</em>",
        company: null,
        paras: [
          "A crise que parou o mundo me deu, paradoxalmente, o espaço que eu precisava pra respirar e olhar pra dentro. Cruzei com a formação de Product Design do Leandro Rezende e encontrei a profissão que eu não sabia que estava procurando.",
          "Design e jornalismo tinham mais em comum do que eu imaginava: <strong>pesquisa profunda, empatia estruturada, narrativa com propósito</strong>. Só que aqui eu podia intervir antes do problema virar manchete. E podia ser a causa de uma manchete positiva no mundo.",
        ],
        highlights: null,
        tags: ["Product Design", "UX", "Transição de Carreira"],
      },
      {
        period: "2020 — 2024",
        title: "L'Oréal, e-commerce<br><em>e 150 designs depois.</em>",
        company: "Agência — Grupo L'Oréal & +30 marcas",
        paras: [
          "Minha primeira experiência profissional já veio grande: o Grupo L'Oréal. Marcas que eu já amava como consumidora, agora como designer responsável pelas experiências digitais delas. Por cerca de um ano, construí UIs orientadas à conversão, aumentando significativamente o NPS e os principais KPIs da marca.",
          "Em quatro anos na agência do grupo Wunderman Thompson, mergulhei fundo em otimizações de e-commerces, plataformas educacionais, sites institucionais utilizando uma abordagem de design suportado por base de dados, unificando o trabalho de BI e CRO ao design. Testes A/B, otimização de funil, landing pages estratégicas — aprendi que design bonito sem conversão é só arte, e que resultado de verdade nasce da intersecção entre <strong>estética e intenção</strong>.",
          "Virei <strong>líder da equipe</strong> de design. Fui mentora dos juniores, produzi e também deleguei projetos. Atuei em mais de 30 marcas — moda, educação, financeiro, casa, B2B, B2C.",
        ],
        highlights: [
          { num: "150+", label: "designs entregues" },
          { num: "30+", label: "marcas atendidas" },
          { num: "4", label: "anos de e-commerce" },
        ],
        tags: [
          "E-commerce",
          "CRO",
          "Testes A/B",
          "Liderança",
          "Design System",
          "L'Oréal",
        ],
      },
      {
        period: "2025 — 2026",
        title: "Rodobens:<br><em>o projeto que mudou tudo.</em>",
        company: "Freelance — Grupo Rodobens via NV8 Tecnologia",
        paras: [
          "Depois do período de agência, fui pro mercado por conta própria. O projeto que definiu essa nova fase foi a modernização do sistema interno de locação e leasing do <strong>Grupo Rodobens</strong> — uma empresa de 75 anos do setor financeiro e varejo automotivo que possuía processos complexos e regras de negócio específicas.",
          "O desafio: unir tudo isso numa plataforma intuitiva para <strong>mais de 100 perfis de acesso diferentes</strong>. Foi onde eu entendi de verdade o que é Business Design — não é fazer tela bonita, é traduzir lógica de negócio em clareza para quem usa.",
          "<strong>Entregamos além</strong> do escopo contratado. Wireframes viraram high level designs. Solucionamos + de 84 dores dos usuários e entregamos um sistema interno unificado e com navegação simplificada.",
        ],
        highlights: [
          { num: "100+", label: "perfis de usuário" },
          { num: "75", label: "anos de empresa modernizados" },
        ],
        tags: [
          "Business Design",
          "UX Research",
          "Systems Design",
          "Stakeholders",
          "Freelance",
        ],
      },
      {
        period: "2025 →",
        title: "Era IA First design,<br><em>e o mundo como escritório.</em>",
        company: "NV8 Technology & projetos próprios",
        paras: [
          "Depois da Rodobens, construí o site da própria NV8 Tecnologia — <strong>inteiramente usando IAs</strong>. Foi minha entrada definitiva no <strong>vibe coding</strong>.",
          "Hoje entrego sites simples a complexos, com banco de dados e APIs, em tempo muito menor do que qualquer fluxo tradicional de dev. Aprendi a trabalhar com equipes e gerenciar stakeholders — e isso mudou completamente minha proposta de valor como designer.",
          "Falo inglês fluente desde os 13 anos. Sempre foi meu sonho trabalhar de qualquer lugar do mundo. Esse sonho virou plano — e o plano virou realidade que estou construindo agora, um projeto e um voo de cada vez.",
        ],
        highlights: [
          { num: "EN", label: "fluente desde os 13" },
          { num: "∞", label: "fusos horários possíveis" },
        ],
        tags: [
          "Coding",
          "AI-assisted Design",
          "Vue",
          "JSON",
          "HTML",
          "CSS",
          "Nômade Digital",
          "Internacional",
        ],
      },
    ],
  },

  EN: {
    eyebrow: "My story",
    titleStatic: "From reporter to designer.",
    titleTyping: "The trip I never stopped.",
    lead: "Five years, three major turning points, and one certainty: design is where I decided to be part of the causes — not just report the consequences.",
    scrollHint: "Scroll to interact",
    ctaLabel:
      "This story is still being written — want to be part of the next chapter?",
    cta: "Let's talk",
    mailSubject: "Hi Tayná — I read your story and want to connect",
    epilogueHeadline: "Ready for the next chapter.",
    homeCta: "Back to homepage",
    projectsCta: "Check my projects",
    chapters: [
      {
        period: "2010 — 2020",
        title: "Once upon a time,<br><em>a journalist.</em>",
        company: null,
        paras: [
          "I spent a decade doing what I was taught to love: telling stories, investigating, communicating. But over time I realized journalism always placed me on the side of <strong>consequences</strong> — I arrived after the problems had already happened.",
          "I wanted to be on the side of <strong>causes</strong>. I wanted to build things that changed how people live, not just narrate that change from a distance.",
        ],
        highlights: null,
        tags: ["Journalism", "Communication", "Narrative", "Research"],
      },
      {
        period: "2020",
        title: "A pandemic,<br><em>and a new screen.</em>",
        company: null,
        paras: [
          "The crisis that stopped the world gave me, paradoxically, the space I needed to breathe and look inward. I stumbled upon a Product Design program and it felt like finding the profession I didn't know I was looking for.",
          "Design and journalism had more in common than I imagined: <strong>deep research, structured empathy, purposeful narrative</strong>. Except here I could intervene before the problem became a headline.",
        ],
        highlights: null,
        tags: ["Product Design", "UX", "Career Transition"],
      },
      {
        period: "2020 — 2024",
        title: "L'Oréal, e-commerce,<br><em>and 150 designs later.</em>",
        company: "Agency — L'Oréal Group & 30+ brands",
        paras: [
          "My first professional experience came big: the L'Oréal Group. Brands I already loved as a consumer, now as the designer responsible for their digital experiences.",
          "Over four years, I dove deep into <strong>data-driven e-commerce</strong>. A/B tests, funnel optimization, strategic landing pages — I learned that beautiful design without conversion is just art, and that real results come from the intersection of <strong>aesthetics and intention</strong>.",
          "I became the design team lead. I mentored juniors, delegated projects, and delivered the most complex cases. I worked across different industries — fashion, education, finance, home, B2B, B2C.",
        ],
        highlights: [
          { num: "150+", label: "designs delivered" },
          { num: "30+", label: "brands served" },
          { num: "4", label: "years in e-commerce" },
        ],
        tags: [
          "E-commerce",
          "CRO",
          "A/B Testing",
          "Leadership",
          "Design System",
          "L'Oréal",
        ],
      },
      {
        period: "2025",
        title: "Rodobens:<br><em>the project that changed everything.</em>",
        company: "Freelance — Rodobens Group via NV8 Tecnologia",
        paras: [
          "I left the agency and went independent. The project that defined this new phase was the modernization of the internal leasing system for <strong>Rodobens Group</strong> — a 75-year-old company with complex processes and business rules that felt like labyrinths.",
          "The challenge: bring it all together in an intuitive platform for <strong>over 100 different access profiles</strong>. That's where I truly understood Business Design — it's not about making pretty screens, it's about translating business logic into clarity for the people who use it.",
          "We delivered beyond the contracted scope. Wireframes became final navigable layouts. We invested in a long-term client relationship, and it came back as more projects.",
        ],
        highlights: [
          { num: "100+", label: "user profiles" },
          { num: "75", label: "years of legacy modernized" },
        ],
        tags: [
          "Business Design",
          "UX Research",
          "Systems Design",
          "Stakeholders",
          "Freelance",
        ],
      },
      {
        period: "2025 →",
        title: "IA First design era,<br><em>and the world as my office.</em>",
        company: "NV8 Tecnologia & own projects",
        paras: [
          "After Rodobens, I built NV8 Tecnologia's own website — <strong>entirely using AI</strong>. That was my definitive entry into vibe coding.",
          "Today I deliver websites from simple to complex, with databases and APIs, in much less time than any traditional dev workflow. Learned how to work with teams and manage stakeholders successfully — and those experiences completely changed my value proposition as a designer.",
          "I've spoken fluent English since I was 13. Working from anywhere in the world has always been my dream. That dream became a plan — and the plan became a reality I'm building right now, one project and one flight at a time.",
        ],
        highlights: [
          { num: "EN", label: "fluent since age 13" },
          { num: "∞", label: "possible time zones" },
        ],
        tags: [
          "Coding",
          "AI-assisted Design",
          "Vue",
          "JSON",
          "HTML",
          "CSS",
          "Digital Nomad",
          "International",
        ],
      },
    ],
  },

  ES: {
    eyebrow: "Mi historia",
    titleStatic: "De reportera a diseñadora.",
    titleTyping: "El viaje que nunca detuve.",
    lead: "Cinco años, tres grandes giros y una certeza: el diseño es el lugar donde decidí ser parte de las causas — no solo registrar las consecuencias.",
    scrollHint: "Desplaza para interactuar",
    ctaLabel:
      "Esta historia todavía se está escribiendo — ¿quieres ser parte del próximo capítulo?",
    cta: "Hablemos",
    mailSubject: "Hola Tayná — leí tu historia y quiero conectar",
    epilogueHeadline: "Lista para el próximo capítulo.",
    homeCta: "Volver al inicio",
    projectsCta: "Ver proyectos",
    chapters: [
      {
        period: "2010 — 2020",
        title: "Había una vez<br><em>una periodista.</em>",
        company: null,
        paras: [
          "Pasé una década haciendo lo que me enseñaron a amar: contar historias, investigar, comunicar. Pero con el tiempo me di cuenta de que el periodismo siempre me colocaba del lado de las <strong>consecuencias</strong>.",
          "Quería estar del lado de las <strong>causas</strong>. Quería construir cosas que cambiaran cómo vive la gente, no solo narrar ese cambio desde lejos.",
        ],
        highlights: null,
        tags: ["Periodismo", "Comunicación", "Narrativa", "Investigación"],
      },
      {
        period: "2020",
        title: "Una pandemia,<br><em>y una nueva pantalla.</em>",
        company: null,
        paras: [
          "La crisis que detuvo al mundo me dio, paradójicamente, el espacio que necesitaba para respirar y mirarme por dentro. Me topé con una formación en Product Design y fue como encontrar la profesión que no sabía que buscaba.",
          "Diseño y periodismo tenían más en común de lo que imaginaba: <strong>investigación profunda, empatía estructurada, narrativa con propósito</strong>.",
        ],
        highlights: null,
        tags: ["Product Design", "UX", "Cambio de Carrera"],
      },
      {
        period: "2020 — 2024",
        title: "L'Oréal, e-commerce<br><em>y 150 diseños después.</em>",
        company: "Agencia — Grupo L'Oréal & +30 marcas",
        paras: [
          "Mi primera experiencia profesional llegó grande: el Grupo L'Oréal.",
          "En cuatro años, me sumergí en <strong>e-commerce orientado a datos</strong>. Tests A/B, optimización de embudo, landing pages estratégicas.",
          "Me convertí en líder del equipo de diseño. Trabajé con más de 30 marcas — moda, educación, finanzas, hogar, B2B, B2C.",
        ],
        highlights: [
          { num: "150+", label: "diseños entregados" },
          { num: "30+", label: "marcas atendidas" },
          { num: "4", label: "años en e-commerce" },
        ],
        tags: ["E-commerce", "CRO", "Tests A/B", "Liderazgo", "Design System"],
      },
      {
        period: "2025",
        title: "Rodobens:<br><em>el proyecto que cambió todo.</em>",
        company: "Freelance — Grupo Rodobens vía NV8 Tecnologia",
        paras: [
          "El proyecto que definió esta nueva etapa fue la modernización del sistema interno de arrendamiento del <strong>Grupo Rodobens</strong>.",
          "El desafío: reunir todo en una plataforma intuitiva para <strong>más de 100 perfiles de acceso diferentes</strong>.",
        ],
        highlights: [
          { num: "100+", label: "perfiles de usuario" },
          { num: "75", label: "años de legado modernizados" },
        ],
        tags: ["Business Design", "UX Research", "Stakeholders", "Freelance"],
      },
      {
        period: "2025 →",
        title: "Era IA First design,<br><em>y el mundo como oficina.</em>",
        company: "NV8 Tecnologia & proyectos propios",
        paras: [
          "Después de Rodobens, construí el propio sitio de NV8 Tecnologia — <strong>enteramente usando IA</strong>.",
          "Hoy entrego sitios de simple a complejo, con bases de datos y APIs, en mucho menos tiempo. Aprendí a trabajar con equipos y gestionar stakeholders exitosamente.",
          "Hablo inglés fluido desde los 13 años. Trabajar desde cualquier lugar del mundo siempre fue mi sueño.",
        ],
        highlights: [
          { num: "EN", label: "fluida desde los 13" },
          { num: "∞", label: "husos horarios posibles" },
        ],
        tags: [
          "Coding",
          "AI-assisted Design",
          "Vue",
          "JSON",
          "HTML",
          "CSS",
          "Nómada Digital",
          "Internacional",
        ],
      },
    ],
  },

  DE: {
    eyebrow: "Meine Geschichte",
    titleStatic: "Von der Reporterin zur Designerin.",
    titleTyping: "Die Reise, die ich nie aufhörte.",
    lead: "Fünf Jahre, drei große Wendepunkte und eine Gewissheit: Design ist der Ort, wo ich entschied, Teil der Ursachen zu sein — nicht nur die Folgen zu berichten.",
    scrollHint: "Scrollen zum Interagieren",
    ctaLabel:
      "Diese Geschichte wird noch geschrieben — möchtest du Teil des nächsten Kapitels sein?",
    cta: "Lass uns reden",
    mailSubject:
      "Hallo Tayná — ich habe deine Geschichte gelesen und möchte mich vernetzen",
    epilogueHeadline: "Bereit für das nächste Kapitel.",
    homeCta: "Zur Startseite",
    projectsCta: "Projekte ansehen",
    chapters: [
      {
        period: "2010 — 2020",
        title: "Es war einmal<br><em>eine Journalistin.</em>",
        company: null,
        paras: [
          "Ich verbrachte ein Jahrzehnt damit, zu tun, was ich zu lieben gelernt hatte: Geschichten erzählen, recherchieren, kommunizieren. Doch mit der Zeit merkte ich, dass der Journalismus mich immer auf die Seite der <strong>Folgen</strong> stellte.",
          "Ich wollte auf der Seite der <strong>Ursachen</strong> sein. Ich wollte Dinge bauen, die verändern, wie Menschen leben.",
        ],
        highlights: null,
        tags: ["Journalismus", "Kommunikation", "Narrativ", "Recherche"],
      },
      {
        period: "2020",
        title: "Eine Pandemie,<br><em>und ein neuer Bildschirm.</em>",
        company: null,
        paras: [
          "Die Krise, die die Welt anhielt, gab mir paradoxerweise den Raum, den ich brauchte. Ich stieß auf eine Product-Design-Ausbildung.",
          "Design und Journalismus hatten mehr gemeinsam als ich dachte: <strong>tiefe Recherche, strukturierte Empathie, zweckgerichtete Narrative</strong>.",
        ],
        highlights: null,
        tags: ["Product Design", "UX", "Karrierewechsel"],
      },
      {
        period: "2020 — 2024",
        title: "L'Oréal, E-Commerce<br><em>und 150 Designs später.</em>",
        company: "Agentur — L'Oréal-Gruppe & 30+ Marken",
        paras: [
          "Meine erste Berufserfahrung kam groß: die L'Oréal-Gruppe.",
          "In vier Jahren tauchte ich tief in <strong>datengetriebenen E-Commerce</strong> ein. A/B-Tests, Funnel-Optimierung, strategische Landing Pages.",
          "Ich wurde Designteam-Leiterin. Ich arbeitete mit über 30 Marken.",
        ],
        highlights: [
          { num: "150+", label: "Designs geliefert" },
          { num: "30+", label: "Marken betreut" },
          { num: "4", label: "Jahre E-Commerce" },
        ],
        tags: [
          "E-Commerce",
          "CRO",
          "A/B-Tests",
          "Teamleitung",
          "Design System",
        ],
      },
      {
        period: "2025",
        title: "Rodobens:<br><em>das Projekt, das alles veränderte.</em>",
        company: "Freelance — Rodobens-Gruppe über NV8 Tecnologia",
        paras: [
          "Das Projekt, das diese neue Phase definierte, war die Modernisierung des internen Leasing-Systems der <strong>Rodobens-Gruppe</strong>.",
          "Die Herausforderung: alles in einer intuitiven Plattform für <strong>über 100 verschiedene Zugriffsprofile</strong> zusammenzubringen.",
        ],
        highlights: [
          { num: "100+", label: "Nutzerprofile" },
          { num: "75", label: "Jahre Legacy modernisiert" },
        ],
        tags: [
          "Business Design",
          "UX Research",
          "Stakeholder-Management",
          "Freelance",
        ],
      },
      {
        period: "2025 →",
        title: "IA First Design-Ära<br><em>und die Welt als Büro.</em>",
        company: "NV8 Tecnologia & eigene Projekte",
        paras: [
          "Nach Rodobens baute ich die eigene Website von NV8 Tecnologia — <strong>komplett mit KI</strong>.",
          "Heute liefere ich Websites von einfach bis komplex, mit Datenbanken und APIs, in viel kürzerer Zeit. Gelernt mit Teams zu arbeiten und Stakeholder erfolgreich zu managen.",
          "Ich spreche fließend Englisch seit ich 13 bin. Die Welt als Büro zu nutzen war immer mein Traum.",
        ],
        highlights: [
          { num: "EN", label: "fließend seit 13" },
          { num: "∞", label: "mögliche Zeitzonen" },
        ],
        tags: [
          "Coding",
          "KI-gestütztes Design",
          "Vue",
          "JSON",
          "HTML",
          "CSS",
          "Digitale Nomadin",
          "International",
        ],
      },
    ],
  },
};

const t = computed(() => copy[lang.value] ?? copy["PT"]);
</script>

<style>
@import url("https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap");
@import url("https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500&display=swap");

/* ── Root ───────────────────────────────────────────── */
.sp-root {
  font-family: "DM Sans", sans-serif;
  min-height: 100svh;
  position: relative;
  overflow-x: clip;
  transition:
    background 0.5s ease,
    color 0.5s ease;
}
.theme-dark {
  background: #070711;
  color: #f0eff8;
  --bg: #070711;
  --fg: #f0eff8;
  --fg-muted: #6b6a82;
  --border: rgba(255, 255, 255, 0.07);
}
.theme-light {
  background: #f5f3ff;
  color: #0d0c1a;
  --bg: #f5f3ff;
  --fg: #0d0c1a;
  --fg-muted: #62607a;
  --border: rgba(13, 12, 26, 0.1);
}

/* Grain */
.sp-grain {
  position: fixed;
  inset: 0;
  z-index: 0;
  pointer-events: none;
  opacity: 0.035;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");
  background-size: 180px;
}

/* ── Slides container ───────────────────────────────── */
.sp-slides {
  position: relative;
  margin-top: 56px;
  height: calc(100svh - 56px);
  overflow: hidden;
  z-index: 1;
}

/* ── Base slide ─────────────────────────────────────── */
.sp-slide {
  position: absolute;
  inset: 0;
  display: flex;
  align-items: center;
  background: var(--bg, #f5f3ff);
}

/* ── Slide 1: Hero ──────────────────────────────────── */
.sp-slide--hero {
  z-index: 2;
  transform-origin: center center;
  transition:
    transform 1s cubic-bezier(0.16, 1, 0.3, 1),
    opacity 0.8s ease;
  overflow: hidden;
}
.sp-slide--exit {
  transform: scale(0.82);
  opacity: 0;
  pointer-events: none;
}
/* Zoom-in exit: slide magnifies out (ch1 → ch2, ch2 → ch3) */
.sp-slide--zoom-exit {
  transform: scale(1.14);
  opacity: 0;
  pointer-events: none;
}
/* Break exit: lateral slide + rotation + blur (ch3 → ch4) */
.sp-slide--break-exit {
  transform: translateX(-7%) rotate(-1.2deg);
  filter: blur(8px);
  opacity: 0;
  pointer-events: none;
}

/* Hero text — slides in from left */
.sp-hero-text {
  flex: 0 0 48%;
  padding: 3rem 2rem 3rem 6vw;
  opacity: 0;
  transform: translateX(-52px);
  transition:
    opacity 0.9s ease,
    transform 1s cubic-bezier(0.16, 1, 0.3, 1);
}
.sp-hero-text--in {
  opacity: 1;
  transform: translateX(0);
}

/* Hero avatar — slides in from right */
.sp-hero-avatar {
  flex: 0 0 52%;
  align-self: stretch;
  display: flex;
  align-items: flex-end;
  justify-content: center;
  overflow: hidden;
  opacity: 0;
  transform: translateX(52px);
  transition:
    opacity 0.9s ease 0.12s,
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.12s;
}
.sp-hero-avatar--in {
  opacity: 1;
  transform: translateX(0);
}

.sp-avatar-img {
  width: 100%;
  max-width: 540px;
  height: 100%;
  max-height: calc(100svh - 56px);
  object-fit: contain;
  object-position: bottom center;
  display: block;
}

/* Eyebrow */
.sp-eyebrow {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.6rem;
  font-weight: 500;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: #f0185a;
  margin-bottom: 1.25rem;
}
.sp-dot {
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background: #f0185a;
  animation: sp-pulse 2.5s ease-in-out infinite;
  flex-shrink: 0;
}

/* Title */
.sp-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: clamp(2.25rem, 5vw, 4.5rem);
  line-height: 1.05;
  letter-spacing: -0.03em;
  margin-bottom: 1.75rem;
}
.sp-title-static {
  display: block;
}
.sp-title-typing {
  display: block;
  font-style: italic;
  color: #f0185a;
  min-height: 1.1em;
}

/* Cursor */
.sp-cursor {
  display: inline-block;
  width: 3px;
  height: 0.82em;
  background: #f0185a;
  margin-left: 2px;
  vertical-align: -0.07em;
  animation: sp-blink 0.85s step-end infinite;
}
.sp-cursor--done {
  animation: none;
  opacity: 0;
  transition: opacity 0.5s ease 0.4s;
}

/* Lead */
.sp-lead {
  font-size: clamp(0.9rem, 2vw, 1.05rem);
  font-weight: 300;
  line-height: 1.8;
  color: var(--fg-muted, #62607a);
  max-width: 52ch;
}

/* ── Scroll hint ────────────────────────────────────── */
.sp-scroll-hint {
  position: absolute;
  bottom: 2.25rem;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.6rem;
  opacity: 1;
  transition: opacity 0.5s ease;
  pointer-events: none;
  z-index: 10;
}
.sp-scroll-hint--gone {
  opacity: 0;
}

.sp-scroll-label {
  font-size: 0.55rem;
  font-weight: 500;
  letter-spacing: 0.16em;
  text-transform: uppercase;
  color: var(--fg-muted, #62607a);
}
.sp-scroll-mouse {
  width: 22px;
  height: 36px;
  border: 1.5px solid var(--fg-muted, #62607a);
  border-radius: 11px;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  padding-top: 6px;
  opacity: 0.65;
}
.sp-scroll-dot {
  width: 3px;
  height: 6px;
  border-radius: 2px;
  background: #f0185a;
  animation: sp-scroll-bounce 1.6s ease-in-out infinite;
}

/* ── Slide 2: Chapter 1 — Journalist ───────────────── */
.sp-slide--ch1 {
  z-index: 1;
  gap: clamp(2rem, 5vw, 5rem);
  padding: 0 clamp(1.5rem, 6vw, 6rem);
  transform: scale(1.06);
  opacity: 0;
  transition:
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.08s,
    opacity 0.85s ease 0.08s;
  overflow-y: auto;
}
.sp-slide--active {
  transform: scale(1);
  opacity: 1;
  z-index: 3;
}

/* Ch1: Image pair */
.sp-ch1-images {
  position: relative;
  flex: 0 0 42%;
  align-self: flex-end;
  height: min(640px, 88%);
  opacity: 0;
  transform: translateX(-44px);
  transition:
    opacity 0.85s ease 0.2s,
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.2s;
}
.sp-ch1-images--in {
  opacity: 1;
  transform: translateX(0);
}

.sp-ch1-img {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: contain;
  object-position: bottom center;
}
.sp-ch1-img--blur {
  filter: blur(3px);
  transform: translate(8px, 8px);
  opacity: 0.45;
}
.sp-ch1-img--main {
  position: relative;
}

/* Ch1: Content */
.sp-ch1-body {
  flex: 1;
  min-width: 0;
  padding: 2rem 0;
  opacity: 0;
  transform: translateX(44px);
  transition:
    opacity 0.85s ease 0.35s,
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.35s;
}
.sp-ch1-body--in {
  opacity: 1;
  transform: translateX(0);
}

/* Node inside ch1 */
.sp-ch1-node {
  position: relative;
  width: 12px;
  height: 12px;
  margin-bottom: 1rem;
}

/* Ch1 title */
.sp-ch1-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: clamp(1.8rem, 4.5vw, 3.2rem);
  line-height: 1.05;
  letter-spacing: -0.03em;
  margin-bottom: 1.25rem;
}
.sp-ch1-title em {
  font-style: italic;
  color: #f0185a;
}

/* ── Slide 3: Pandemic ──────────────────────────────── */
.sp-slide--ch2 {
  gap: 0;
  padding: 0 0 0 clamp(2rem, 6vw, 6rem);
  align-items: stretch;
  transform-origin: center center;
  transition:
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.08s,
    opacity 0.85s ease 0.08s;
}

/* Content: slides in from left */
.sp-ch2-body {
  flex: 0 0 50%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 3rem clamp(1.5rem, 3vw, 3rem) 3rem 0;
  opacity: 0;
  transform: translateX(-44px);
  transition:
    opacity 0.85s ease 0.2s,
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.2s;
}
.sp-ch2-body--in {
  opacity: 1;
  transform: translateX(0);
}

.sp-ch2-node {
  position: relative;
  width: 12px;
  height: 12px;
  margin-bottom: 1rem;
}

.sp-ch2-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: clamp(1.8rem, 4.5vw, 3.2rem);
  line-height: 1.05;
  letter-spacing: -0.03em;
  margin-bottom: 1.25rem;
}
.sp-ch2-title em {
  font-style: italic;
  color: #f0185a;
}

/* Photo: slides in from right, full bleed to edge */
.sp-ch2-image {
  flex: 0 0 50%;
  overflow: hidden;
  opacity: 0;
  transform: translateX(44px);
  transition:
    opacity 0.85s ease 0.35s,
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.35s;
}
.sp-ch2-image--in {
  opacity: 1;
  transform: translateX(0);
}

.sp-ch2-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center;
  display: block;
}

/* ── Slide 4: L'Oréal ───────────────────────────────── */
.sp-slide--ch3 {
  gap: 0;
  padding: 0 0 0 clamp(2rem, 6vw, 6rem);
  align-items: flex-end;
  transform-origin: center center;
  transition:
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.08s,
    opacity 0.85s ease 0.08s,
    filter 0.9s ease 0.08s;
}

/* Content: slides in from left */
.sp-ch3-body {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  padding: 4rem clamp(1.5rem, 3vw, 3rem) 3rem 0;
  overflow-y: auto;
  opacity: 0;
  transform: translateX(-44px);
  transition:
    opacity 0.85s ease 0.2s,
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.2s;
}
.sp-ch3-body--in {
  opacity: 1;
  transform: translateX(0);
}

.sp-ch3-node {
  position: relative;
  width: 12px;
  height: 12px;
  margin-bottom: 1rem;
}

.sp-ch3-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: clamp(1.8rem, 4vw, 3rem);
  line-height: 1.05;
  letter-spacing: -0.03em;
  margin-bottom: 0.75rem;
}
.sp-ch3-title em {
  font-style: italic;
  color: #f0185a;
}

.sp-ch3-highlights {
  margin-bottom: 1rem;
}

/* Illustration: slides in from right, bottom-aligned */
.sp-ch3-image {
  flex: 0 0 38%;
  align-self: flex-end;
  height: 90%;
  overflow: hidden;
  opacity: 0;
  transform: translateX(44px);
  transition:
    opacity 0.85s ease 0.35s,
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.35s;
}
.sp-ch3-image--in {
  opacity: 1;
  transform: translateX(0);
}

.sp-ch3-img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  object-position: bottom center;
  display: block;
}

/* ── Slide 5: Rodobens ──────────────────────────────── */
.sp-slide--ch4 {
  gap: 0;
  padding: 0;
  align-items: stretch;
  transform-origin: center center;
  transition:
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.08s,
    opacity 0.85s ease 0.08s;
}

/* Image: left side, full bleed */
.sp-ch4-image {
  flex: 0 0 44%;
  overflow: hidden;
  opacity: 0;
  transform: translateX(-44px);
  transition:
    opacity 0.85s ease 0.2s,
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.2s;
}
.sp-ch4-image--in {
  opacity: 1;
  transform: translateX(0);
}

.sp-ch4-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center top;
  display: block;
}

/* Content: right side */
.sp-ch4-body {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 3rem clamp(2rem, 5vw, 5rem) 3rem clamp(1.5rem, 3vw, 3rem);
  overflow-y: auto;
  opacity: 0;
  transform: translateX(44px);
  transition:
    opacity 0.85s ease 0.35s,
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.35s;
}
.sp-ch4-body--in {
  opacity: 1;
  transform: translateX(0);
}

.sp-ch4-node {
  position: relative;
  width: 12px;
  height: 12px;
  margin-bottom: 1rem;
}

.sp-ch4-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: clamp(1.8rem, 4vw, 3rem);
  line-height: 1.05;
  letter-spacing: -0.03em;
  margin-bottom: 0.75rem;
}
.sp-ch4-title em {
  font-style: italic;
  color: #f0185a;
}

/* ── Slide 6: Vibe Coding ───────────────────────────── */
.sp-slide--ch5 {
  gap: 0;
  padding: 0 0 0 clamp(2rem, 6vw, 6rem);
  align-items: stretch;
  transform-origin: center center;
  transition:
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.08s,
    opacity 0.85s ease 0.08s;
}

/* Content: left side */
.sp-ch5-body {
  flex: 1;
  min-height: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 2rem clamp(1.5rem, 3vw, 3rem) 2rem 0;
  overflow: hidden;
  opacity: 0;
  transform: translateX(-44px);
  transition:
    opacity 0.85s ease 0.2s,
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.2s;
}
.sp-ch5-body--in {
  opacity: 1;
  transform: translateX(0);
}

.sp-ch5-node {
  position: relative;
  width: 12px;
  height: 12px;
  margin-bottom: 1rem;
}

.sp-ch5-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: clamp(1.8rem, 4vw, 3rem);
  line-height: 1.05;
  letter-spacing: -0.03em;
  margin-bottom: 0.75rem;
}
.sp-ch5-title em {
  font-style: italic;
  color: #f0185a;
}

/* Image: right side, full bleed */
.sp-ch5-image {
  flex: 0 0 40%;
  min-height: 0;
  overflow: hidden;
  opacity: 0;
  transform: translateX(44px);
  transition:
    opacity 0.85s ease 0.35s,
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.35s;
}
.sp-ch5-image--in {
  opacity: 1;
  transform: translateX(0);
}

.sp-ch5-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center top;
  display: block;
}

/* ── Below (timeline + CTA) ─────────────────────────── */
.sp-below {
  position: relative;
  z-index: 1;
}

/* ── Timeline ───────────────────────────────────────── */
.sp-timeline {
  list-style: none;
  padding: 4rem 1.5rem;
  max-width: 820px;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
}

/* ── Chapter ────────────────────────────────────────── */
.sp-chapter {
  display: flex;
  gap: 1.5rem;
  opacity: 0;
  transform: translateX(-20px);
  transition:
    opacity 0.7s ease,
    transform 0.7s cubic-bezier(0.16, 1, 0.3, 1);
}
.sp-chapter--visible {
  opacity: 1;
  transform: translateX(0);
}

.sp-node-col {
  display: flex;
  flex-direction: column;
  align-items: center;
  flex-shrink: 0;
  padding-top: 0.3rem;
}
.sp-node {
  position: relative;
  width: 12px;
  height: 12px;
  flex-shrink: 0;
}
.sp-node-dot {
  position: absolute;
  inset: 3px;
  border-radius: 50%;
  background: #f0185a;
  display: block;
}
.sp-node-ring {
  position: absolute;
  inset: 0;
  border-radius: 50%;
  border: 1px solid #f0185a;
  opacity: 0;
  animation: sp-ring 2.8s ease-in-out infinite;
}
.sp-chapter:nth-child(2) .sp-node-ring {
  animation-delay: 0.56s;
}
.sp-chapter:nth-child(3) .sp-node-ring {
  animation-delay: 1.12s;
}
.sp-chapter:nth-child(4) .sp-node-ring {
  animation-delay: 1.68s;
}

.sp-vline {
  flex: 1;
  width: 1px;
  background: linear-gradient(
    to bottom,
    rgba(240, 24, 90, 0.3),
    rgba(240, 24, 90, 0.05)
  );
  margin-top: 0.5rem;
  min-height: 3rem;
}
.sp-chapter:last-child .sp-vline {
  display: none;
}

.sp-content {
  padding-bottom: 4rem;
  flex: 1;
  min-width: 0;
}

.sp-period {
  display: block;
  font-size: 0.58rem;
  font-weight: 500;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: #f0185a;
  opacity: 0.7;
  margin-bottom: 0.75rem;
}

.sp-ch-title {
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: clamp(1.5rem, 5vw, 2.75rem);
  line-height: 1.1;
  letter-spacing: -0.025em;
  margin-bottom: 0.6rem;
}
.sp-ch-title em {
  font-style: italic;
  color: #f0185a;
}

.sp-company {
  display: inline-block;
  align-self: flex-start;
  font-size: 0.65rem;
  font-weight: 500;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--fg-muted, #6b6a82);
  border: 1px solid var(--border, rgba(255, 255, 255, 0.07));
  padding: 0.25rem 0.6rem;
  margin-bottom: 1.25rem;
}

.sp-text {
  display: flex;
  flex-direction: column;
  gap: 0.85rem;
  margin-bottom: 1.5rem;
}
.sp-text p {
  font-size: clamp(0.875rem, 2vw, 1rem);
  font-weight: 300;
  line-height: 1.9;
  color: var(--fg-muted, #6b6a82);
  max-width: 65ch;
}
.sp-text p strong {
  font-weight: 500;
  color: var(--fg, #f0eff8);
}
.theme-light .sp-text p strong {
  color: #0d0c1a;
}

/* Highlights */
.sp-highlights {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
  margin-bottom: 1.5rem;
}
.sp-highlight {
  display: flex;
  flex-direction: column;
  gap: 0.2rem;
  border-left: 2px solid #f0185a;
  padding-left: 0.75rem;
}
.sp-hl-num {
  font-family: "Clash Display", sans-serif;
  font-weight: 700;
  font-size: clamp(1.5rem, 4vw, 2rem);
  color: #f0185a;
  line-height: 1;
}
.sp-hl-label {
  font-size: 0.6rem;
  font-weight: 500;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--fg-muted, #6b6a82);
}

/* Tags */
.sp-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 0.35rem;
}
.sp-tag {
  font-size: 0.58rem;
  font-weight: 500;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--fg-muted, #6b6a82);
  border: 1px solid var(--border, rgba(255, 255, 255, 0.07));
  padding: 0.25rem 0.6rem;
  transition:
    color 0.2s,
    border-color 0.2s;
}
.sp-tag:hover {
  color: #f0185a;
  border-color: rgba(240, 24, 90, 0.35);
}

/* ── Slide 7: CTA ───────────────────────────────────── */
.sp-slide--cta {
  padding: 0;
  transform: translateY(5%) scale(1.04);
  opacity: 0;
  transition:
    transform 1.1s cubic-bezier(0.16, 1, 0.3, 1) 0.06s,
    opacity 0.95s ease 0.06s;
}
.sp-slide--cta.sp-slide--active {
  transform: translateY(0) scale(1);
  opacity: 1;
  z-index: 3;
}

.sp-cta-cover {
  position: absolute;
  inset: 0;
}

.sp-cta-cover-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center top;
  display: block;
}

.sp-cta-overlay {
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%) translateY(24px);
  width: min(806px, 90vw);
  padding: 3.5rem 4rem 5rem;
  border-top: 1px solid rgba(255, 255, 255, 0.18);
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 2rem;
  text-align: center;
  opacity: 0;
  transition:
    opacity 0.9s ease 0.3s,
    transform 1s cubic-bezier(0.16, 1, 0.3, 1) 0.3s;
}
.sp-cta-overlay--in {
  opacity: 1;
  transform: translateX(-50%) translateY(0);
}

.sp-cta-headline {
  font-family: "Clash Display", sans-serif;
  font-weight: 600;
  font-size: clamp(1.35rem, 3.5vw, 2rem);
  line-height: 1.25;
  letter-spacing: -0.02em;
  color: #ffffff;
  text-shadow:
    0 2px 12px rgba(0, 0, 0, 0.45),
    0 1px 3px rgba(0, 0, 0, 0.6);
  max-width: 36ch;
}

/* ── Camera flash overlay ───────────────────────────── */
.sp-flash {
  position: fixed;
  inset: 0;
  z-index: 200;
  background: #ffffff;
  opacity: 0;
  pointer-events: none;
}
.sp-flash--active {
  animation: sp-camera-flash 0.75s ease-out forwards;
}

/* ── Slide 8: Epilogue ──────────────────────────────── */
.sp-slide--epilogue {
  background: #ffffff;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  opacity: 0;
  transition: opacity 0.6s ease 0.42s;
}
.sp-slide--epilogue.sp-slide--active {
  opacity: 1;
  transform: none;
  z-index: 3;
}

.sp-ep-inner {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 2.5rem;
  text-align: center;
  padding: 2rem;
  opacity: 0;
  transform: translateY(20px);
  transition:
    opacity 0.8s var(--ease-expo, cubic-bezier(0.16, 1, 0.3, 1)) 0.1s,
    transform 0.9s var(--ease-expo, cubic-bezier(0.16, 1, 0.3, 1)) 0.1s;
}
.sp-ep-inner--in {
  opacity: 1;
  transform: translateY(0);
}

.sp-ep-headline {
  font-family: "Clash Display", sans-serif;
  font-weight: 600;
  font-size: clamp(1.75rem, 5vw, 3rem);
  line-height: 1.1;
  letter-spacing: -0.03em;
  color: #0d0c1a;
}

.sp-ep-btns {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
  align-items: center;
  justify-content: center;
}

/* ── Keyframes ──────────────────────────────────────── */
@keyframes sp-camera-flash {
  0% {
    opacity: 0;
  }
  10% {
    opacity: 1;
  } /* first flash peak */
  24% {
    opacity: 0.08;
  } /* brief dim between flashes */
  38% {
    opacity: 1;
  } /* second flash peak */
  62% {
    opacity: 0.75;
  } /* hold white, letting slide 8 appear beneath */
  100% {
    opacity: 0;
  } /* fade out revealing the epilogue */
}

@keyframes sp-pulse {
  0%,
  100% {
    opacity: 1;
    transform: scale(1);
  }
  50% {
    opacity: 0.3;
    transform: scale(0.7);
  }
}
@keyframes sp-ring {
  0% {
    transform: scale(1);
    opacity: 0.8;
  }
  60% {
    transform: scale(2.8);
    opacity: 0;
  }
  100% {
    transform: scale(2.8);
    opacity: 0;
  }
}
@keyframes sp-blink {
  0%,
  100% {
    opacity: 1;
  }
  50% {
    opacity: 0;
  }
}
@keyframes sp-scroll-bounce {
  0%,
  100% {
    transform: translateY(0);
    opacity: 1;
  }
  65% {
    transform: translateY(10px);
    opacity: 0.15;
  }
}

/* ── Mobile ─────────────────────────────────────────── */
@media (max-width: 767px) {
  .sp-highlights {
    gap: 0.6rem;
    flex-wrap: nowrap;
  }
  .sp-hl-num {
    font-size: 1.25rem;
  }
  .sp-hl-label {
    font-size: 0.55rem;
  }

  .sp-slide--hero {
    flex-direction: column;
    align-items: stretch;
    gap: 32px;
  }
  .sp-hero-text {
    flex: none;
    width: 100%;
    padding: 3rem 1.5rem 0;
  }
  .sp-hero-avatar {
    flex: 1;
    width: 100%;
    min-height: 0;
    overflow: hidden;
    justify-content: center;
    align-items: flex-end;
  }
  .sp-avatar-img {
    width: 100%;
    height: 100%;
    max-height: none;
    max-width: none;
  }

  .sp-slide--ch1 {
    flex-direction: column;
    padding: 1.5rem;
    gap: 1.5rem;
    overflow-y: auto;
    align-items: flex-start;
  }
  .sp-ch1-images {
    flex: none;
    width: 100%;
    height: 320px;
    align-self: center;
  }
  .sp-ch1-body {
    padding: 0 0 2rem;
  }

  .sp-slide--ch2 {
    flex-direction: column;
    padding: 1.5rem;
    gap: 1rem;
    overflow-y: auto;
    align-items: flex-start;
  }
  .sp-ch2-body {
    flex: none;
    width: 100%;
    padding: 0 0 0.5rem;
  }
  .sp-ch2-image {
    flex: 1;
    width: 100%;
    min-height: 200px;
  }

  .sp-slide--ch3 {
    flex-direction: column;
    padding: 1.5rem;
    gap: 1rem;
    overflow-y: auto;
    align-items: flex-start;
  }
  .sp-ch3-body {
    flex: none;
    width: 100%;
    padding: 0 0 0.5rem;
    justify-content: flex-start;
  }
  .sp-ch3-image {
    flex: 0 0 200px;
    width: 100%;
    align-self: center;
  }

  .sp-slide--ch4 {
    flex-direction: column;
    padding: 0;
    gap: 0;
    overflow-y: auto;
    align-items: flex-start;
  }
  .sp-ch4-image {
    flex: 0 0 240px;
    width: 100%;
  }
  .sp-ch4-body {
    flex: none;
    width: 100%;
    padding: 1.5rem 1.5rem 2rem;
    justify-content: flex-start;
  }

  .sp-slide--ch5 {
    flex-direction: column;
    padding: 0;
    gap: 0;
    overflow-y: auto;
    align-items: flex-start;
  }
  .sp-ch5-body {
    flex: none;
    width: 100%;
    padding: 1.5rem 1.5rem 1rem;
    justify-content: flex-start;
  }
  .sp-ch5-image {
    flex: 1;
    width: 100%;
    min-height: 220px;
  }

  .sp-scroll-hint {
    bottom: 1.5rem;
  }

  .sp-ep-btns {
    flex-direction: column;
  }

  .sp-cta-overlay {
    padding: 2.5rem 1.5rem 3.5rem;
    width: 95vw;
  }
}

/* ── Tablet ─────────────────────────────────────────── */
@media (min-width: 640px) and (max-width: 1023px) {
  .sp-hero-text {
    padding: 4rem 2rem 3rem 4rem;
  }
  .sp-timeline {
    padding: 4rem 3rem;
  }
}

/* ── Desktop ────────────────────────────────────────── */
@media (min-width: 1024px) {
  .sp-hero-text {
    padding: 0 3rem 0 max(4rem, 5vw);
  }
}

@media (min-width: 1400px) {
  .sp-hero-text {
    padding: 0 3rem 0 max(5rem, 8vw);
  }
}
</style>
