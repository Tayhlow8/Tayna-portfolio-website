<template>
  <section
    id="sobre"
    class="ab-root"
    ref="sectionEl"
    aria-labelledby="sobre-heading"
  >
    <!-- Eyebrow -->
    <div class="ab-eyebrow" aria-hidden="true">
      <span class="ab-eyebrow__line"></span>
      <span class="ab-eyebrow__label">{{ t.label }}</span>
      <span class="ab-eyebrow__line"></span>
    </div>

    <!-- Sentences -->
    <h2 id="sobre-heading" class="ab-headline">
      <span
        v-for="(sentence, i) in t.sentences"
        :key="i"
        class="ab-sentence"
        :class="{ 'ab-sentence--visible': visible }"
        :style="{ transitionDelay: visible ? `${i * 0.22}s` : '0s' }"
      >
        <template v-for="(chunk, j) in sentence" :key="j">
          <span v-if="chunk.hl" class="ab-hl">{{ chunk.text }}</span>
          <template v-else>{{ chunk.text }}</template>
        </template>
      </span>
    </h2>

    <!-- Quote -->
    <blockquote
      class="ab-quote"
      :class="{ 'ab-quote--visible': visible }"
      :style="{
        transitionDelay: visible ? `${t.sentences.length * 0.22}s` : '0s',
      }"
    >
      {{ t.quote }}
    </blockquote>
  </section>
</template>

<script setup>
import { computed, ref, onMounted, onUnmounted } from "vue";

const props = defineProps({
  lang: { type: String, default: "PT" },
  theme: { type: String, default: "light" },
});

// ── Copy ──────────────────────────────────────────────────
const copy = {
  PT: {
    label: "Sobre mim",
    sentences: [
      [
        { text: "Design começa muito " },
        { text: "antes", hl: true },
        { text: " do pixel." },
      ],
      [
        { text: "Passei 5 anos imersa em e-commerce — dos " },
        { text: "funis de conversão", hl: true },
        { text: " ao " },
        { text: "checkout,", hl: true },
      ],
      [
        { text: "da " },
        { text: "pesquisa de usuário", hl: true },
        { text: " ao " },
        { text: "design system,", hl: true },
      ],
      [
        { text: "conectando o que o " },
        { text: "negócio precisa,", hl: true },
        { text: " o que o " },
        { text: "usuário sente,", hl: true },
      ],
      [
        { text: "e expandindo os limites do que a tecnologia consegue " },
        { text: "entregar.", hl: true },
      ],
    ],
    quote: "Design é a arte de fazer a tecnologia parecer inevitável.",
  },
  EN: {
    label: "About me",
    sentences: [
      [
        { text: "Design starts long " },
        { text: "before", hl: true },
        { text: " the pixel." },
      ],
      [
        { text: "I spent 5 years deep in e-commerce — from " },
        { text: "conversion funnels", hl: true },
        { text: " to " },
        { text: "checkout flows,", hl: true },
      ],
      [
        { text: "from " },
        { text: "user research", hl: true },
        { text: " to " },
        { text: "design systems,", hl: true },
      ],
      [
        { text: "connecting business " },
        { text: "needs,", hl: true },
        { text: " " },
        { text: "user feels,", hl: true },
      ],
      [
        { text: "and pushing boundaries on what technology can " },
        { text: "deliver.", hl: true },
      ],
    ],
    quote: "Design is the art of making technology feel inevitable.",
  },
  ES: {
    label: "Sobre mí",
    sentences: [
      [
        { text: "El diseño empieza mucho " },
        { text: "antes", hl: true },
        { text: " del píxel." },
      ],
      [
        { text: "Pasé 5 años en e-commerce — del " },
        { text: "funnel de conversión", hl: true },
        { text: " al " },
        { text: "checkout,", hl: true },
      ],
      [
        { text: "de la " },
        { text: "investigación de usuario", hl: true },
        { text: " al " },
        { text: "design system,", hl: true },
      ],
      [
        { text: "conectando lo que el " },
        { text: "negocio necesita,", hl: true },
        { text: " lo que el " },
        { text: "usuario siente,", hl: true },
      ],
      [
        { text: "y empujando los límites de lo que la tecnología puede " },
        { text: "entregar.", hl: true },
      ],
    ],
    quote:
      "El diseño es el arte de hacer que la tecnología parezca inevitable.",
  },
  DE: {
    label: "Über mich",
    sentences: [
      [
        { text: "Design beginnt lange " },
        { text: "vor", hl: true },
        { text: " dem Pixel." },
      ],
      [
        { text: "Fünf Jahre im E-Commerce — von " },
        { text: "Conversion-Funneln", hl: true },
        { text: " bis zum " },
        { text: "Checkout,", hl: true },
      ],
      [
        { text: "von " },
        { text: "User Research", hl: true },
        { text: " bis zum " },
        { text: "Design System,", hl: true },
      ],
      [
        { text: "verbinde ich, was das " },
        { text: "Business braucht,", hl: true },
        { text: " was der " },
        { text: "Nutzer fühlt,", hl: true },
      ],
      [
        { text: "und was Technologie wirklich " },
        { text: "leisten kann.", hl: true },
      ],
    ],
    quote: "Design ist die Kunst, Technologie unvermeidlich wirken zu lassen.",
  },
};

const t = computed(() => copy[props.lang] ?? copy.EN);

// ── Visibility trigger ────────────────────────────────────
const sectionEl = ref(null);
const visible = ref(false);

let observer = null;

onMounted(() => {
  observer = new IntersectionObserver(
    ([entry]) => {
      if (entry.isIntersecting) visible.value = true;
    },
    {
      // Negative bottom margin shrinks the detection zone upward.
      // Section must scroll past the bottom 40% of the viewport before triggering —
      // equivalent to the user having scrolled ~60% into the section view.
      rootMargin: "0px 0px -40% 0px",
      threshold: 0,
    },
  );
  if (sectionEl.value) observer.observe(sectionEl.value);
});

onUnmounted(() => {
  observer?.disconnect();
});
</script>

<style scoped>
/* ════════════════════════════════════════════════════════
   Section
   ════════════════════════════════════════════════════════ */
.ab-root {
  padding: clamp(5rem, 12vh, 9rem) clamp(2rem, 12vw, 14rem);
  background: var(--bg);
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  gap: clamp(1rem, 2vh, 1.75rem);
}

/* ════════════════════════════════════════════════════════
   Eyebrow
   ════════════════════════════════════════════════════════ */
.ab-eyebrow {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 1rem;
  width: 100%;
  margin-bottom: 0.5rem;
}
.ab-eyebrow__label {
  font-family: var(--font-body, "DM Sans", sans-serif);
  font-size: 0.58rem;
  font-weight: 500;
  letter-spacing: 0.18em;
  text-transform: uppercase;
  color: var(--accent, #db1552);
  white-space: nowrap;
  flex-shrink: 0;
}
.ab-eyebrow__line {
  width: 3rem;
  height: 1px;
  flex-shrink: 0;
  background: linear-gradient(
    90deg,
    transparent,
    rgba(219, 21, 82, 0.4),
    transparent
  );
}

/* ════════════════════════════════════════════════════════
   Headline
   ════════════════════════════════════════════════════════ */
.ab-headline {
  font-family: var(--font-display, "Clash Display", sans-serif);
  font-weight: 700;
  font-size: clamp(1.5rem, 3.2vw, 2.75rem);
  line-height: 1.12;
  letter-spacing: -0.025em;
  color: var(--fg);
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.1em;
  margin: 0;
  max-width: 72ch;
}
.ab-hl {
  color: var(--accent, #db1552);
}

/* ════════════════════════════════════════════════════════
   Sentence fade-in
   ════════════════════════════════════════════════════════ */
.ab-sentence {
  display: block;
  opacity: 0.08;
  transform: translateY(6px);
  transition:
    opacity 0.7s cubic-bezier(0.16, 1, 0.3, 1),
    transform 0.7s cubic-bezier(0.16, 1, 0.3, 1);
}
.ab-sentence--visible {
  opacity: 1;
  transform: translateY(0);
}

/* ════════════════════════════════════════════════════════
   Quote
   ════════════════════════════════════════════════════════ */
.ab-quote {
  font-family: var(--font-display, "Clash Display", sans-serif);
  font-weight: 200;
  font-style: italic;
  font-size: clamp(0.85rem, 1.4vw, 1.1rem);
  line-height: 1.6;
  color: var(--fg-muted, rgba(13, 12, 26, 0.5));
  border: none;
  padding: 0;
  margin-top: 0.5rem;
  max-width: 48ch;
  opacity: 0.08;
  transform: translateY(6px);
  transition:
    opacity 0.7s cubic-bezier(0.16, 1, 0.3, 1),
    transform 0.7s cubic-bezier(0.16, 1, 0.3, 1);
}
.ab-quote--visible {
  opacity: 1;
  transform: translateY(0);
}

/* ════════════════════════════════════════════════════════
   Reduced motion
   ════════════════════════════════════════════════════════ */
@media (prefers-reduced-motion: reduce) {
  .ab-sentence,
  .ab-quote {
    transition: none;
    opacity: 1;
    transform: none;
  }
}
</style>
