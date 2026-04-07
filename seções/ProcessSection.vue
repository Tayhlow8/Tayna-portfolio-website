<template>
  <section class="ps-root" ref="sectionRef">

    <!-- Label de seção -->
    <div class="ps-top-rule">
      <span class="ps-top-label">{{ t.sectionLabel }}</span>
      <span class="ps-top-line"></span>
    </div>

    <!-- Título editorial -->
    <h2 class="ps-title" v-html="t.title"></h2>

    <!-- Grid de etapas -->
    <div class="ps-track">

      <!-- Linha de conexão animada (desktop) -->
      <div class="ps-line" aria-hidden="true">
        <span class="ps-line-base"></span>
        <span class="ps-line-pulse"></span>
      </div>

      <!-- Etapas -->
      <div
        v-for="(step, i) in t.steps"
        :key="step.num"
        :class="['ps-step', { 'ps-step--visible': visible }]"
        :style="{ '--delay': `${i * 0.15}s` }"
      >
        <!-- Número fantasma de fundo -->
        <span class="ps-ghost" aria-hidden="true">{{ step.num }}</span>

        <!-- Nó da linha + label do número -->
        <div class="ps-node-row">
          <div class="ps-node" aria-hidden="true">
            <span class="ps-node-dot"></span>
            <span class="ps-node-ring"></span>
          </div>
          <span class="ps-num">{{ step.num }}</span>
        </div>

        <!-- Conteúdo -->
        <h3 class="ps-step-title">{{ step.title }}</h3>
        <p  class="ps-step-desc">{{ step.desc }}</p>

        <!-- Tags da etapa -->
        <div class="ps-tags" role="list">
          <span v-for="tag in step.tags" :key="tag" class="ps-tag" role="listitem">
            {{ tag }}
          </span>
        </div>
      </div>

    </div>

  </section>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'

const props = defineProps({
  lang:  { type: String, default: 'PT' },
  theme: { type: String, default: 'dark' },
})

const sectionRef = ref(null)
const visible    = ref(false)

let observer = null
onMounted(() => {
  observer = new IntersectionObserver(
    ([entry]) => { if (entry.isIntersecting) visible.value = true },
    { threshold: 0.15 }
  )
  if (sectionRef.value) observer.observe(sectionRef.value)
})
onUnmounted(() => observer?.disconnect())

// ── Copies ────────────────────────────────────────────
const copy = {
  PT: {
    sectionLabel : 'Como trabalho',
    title        : 'Do <em>caos</em> à clareza.',
    steps: [
      {
        num   : '01',
        title : 'Descoberta',
        desc  : 'Mergulho no contexto antes de abrir o Figma. Entrevistas, dados, benchmarking e muito silêncio para ouvir o que ninguém está dizendo.',
        tags  : ['Entrevistas', 'Desk Research', 'Benchmarking'],
      },
      {
        num   : '02',
        title : 'Definição',
        desc  : 'Transformo ambiguidade em foco. Mapas de jornada, HMWs e enquadramento do problema real — não do que o cliente acha que é o problema.',
        tags  : ['Jobs To Be Done', 'Fluxos', 'HMW'],
      },
      {
        num   : '03',
        title : 'Design',
        desc  : 'Do lo-fi ao hi-fi sem pular etapas. Itero rápido, teste cedo, questiono minhas próprias escolhas antes que o usuário precise fazer isso.',
        tags  : ['Wireframes', 'Protótipo', 'Testes'],
      },
      {
        num   : '04',
        title : 'Entrega',
        desc  : 'Handoff não é o fim — é onde design vira produto. Especificações, design tokens, acompanhamento dev e métricas pós-lançamento.',
        tags  : ['Design System', 'Handoff', 'Métricas'],
      },
    ],
  },
  EN: {
    sectionLabel : 'How I work',
    title        : 'From <em>chaos</em> to clarity.',
    steps: [
      {
        num   : '01',
        title : 'Discovery',
        desc  : 'I dive into context before opening Figma. Interviews, data, benchmarking, and a lot of silence to hear what no one is saying.',
        tags  : ['Interviews', 'Desk Research', 'Benchmarking'],
      },
      {
        num   : '02',
        title : 'Definition',
        desc  : 'I turn ambiguity into focus. Journey maps, HMWs, and framing the real problem — not what the client thinks the problem is.',
        tags  : ['Jobs To Be Done', 'Flows', 'HMW'],
      },
      {
        num   : '03',
        title : 'Design',
        desc  : 'From lo-fi to hi-fi without skipping steps. I iterate fast, test early, and question my own choices before the user has to.',
        tags  : ['Wireframes', 'Prototype', 'Testing'],
      },
      {
        num   : '04',
        title : 'Delivery',
        desc  : 'Handoff isn\'t the end — it\'s where design becomes product. Specs, design tokens, dev support, and post-launch metrics.',
        tags  : ['Design System', 'Handoff', 'Metrics'],
      },
    ],
  },
  ES: {
    sectionLabel : 'Cómo trabajo',
    title        : 'Del <em>caos</em> a la claridad.',
    steps: [
      {
        num   : '01',
        title : 'Descubrimiento',
        desc  : 'Me sumerjo en el contexto antes de abrir Figma. Entrevistas, datos, benchmarking y mucho silencio para escuchar lo que nadie está diciendo.',
        tags  : ['Entrevistas', 'Desk Research', 'Benchmarking'],
      },
      {
        num   : '02',
        title : 'Definición',
        desc  : 'Transformo la ambigüedad en foco. Mapas de viaje, HMWs y encuadre del problema real — no lo que el cliente cree que es el problema.',
        tags  : ['Jobs To Be Done', 'Flujos', 'HMW'],
      },
      {
        num   : '03',
        title : 'Diseño',
        desc  : 'De lo-fi a hi-fi sin saltarse pasos. Itero rápido, testeo temprano y cuestiono mis propias decisiones antes de que el usuario lo haga.',
        tags  : ['Wireframes', 'Prototipo', 'Pruebas'],
      },
      {
        num   : '04',
        title : 'Entrega',
        desc  : 'El handoff no es el fin — es donde el diseño se convierte en producto. Especificaciones, tokens, soporte dev y métricas post-lanzamiento.',
        tags  : ['Design System', 'Handoff', 'Métricas'],
      },
    ],
  },
  DE: {
    sectionLabel : 'Wie ich arbeite',
    title        : 'Vom <em>Chaos</em> zur Klarheit.',
    steps: [
      {
        num   : '01',
        title : 'Entdeckung',
        desc  : 'Ich tauche in den Kontext ein, bevor ich Figma öffne. Interviews, Daten, Benchmarking und viel Stille, um zu hören, was niemand sagt.',
        tags  : ['Interviews', 'Desk Research', 'Benchmarking'],
      },
      {
        num   : '02',
        title : 'Definition',
        desc  : 'Ich verwandle Ambiguität in Fokus. Journey Maps, HMWs und die Rahmung des echten Problems — nicht des vermeintlichen.',
        tags  : ['Jobs To Be Done', 'Flows', 'HMW'],
      },
      {
        num   : '03',
        title : 'Design',
        desc  : 'Von Lo-fi zu Hi-fi ohne Schritte zu überspringen. Ich iteriere schnell, teste früh und hinterfrage meine eigenen Entscheidungen.',
        tags  : ['Wireframes', 'Prototyp', 'Tests'],
      },
      {
        num   : '04',
        title : 'Übergabe',
        desc  : 'Handoff ist nicht das Ende — es ist der Moment, wo Design zum Produkt wird. Specs, Tokens, Dev-Begleitung und Metriken nach dem Launch.',
        tags  : ['Design System', 'Handoff', 'Metriken'],
      },
    ],
  },
}

const t = computed(() => copy[props.lang])
</script>

<style scoped>
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500&display=swap');

/* ── Root ─────────────────────────────────────────────── */
.ps-root {
  font-family : 'DM Sans', sans-serif;
  padding     : 6rem 1.5rem;
  position    : relative;
  overflow    : hidden;
}

/* ── Label de seção ───────────────────────────────────── */
.ps-top-rule {
  display       : flex;
  align-items   : center;
  gap           : 1rem;
  margin-bottom : 2rem;
}
.ps-top-label {
  font-size      : 0.58rem;
  font-weight    : 500;
  letter-spacing : 0.18em;
  text-transform : uppercase;
  color          : var(--accent);
  white-space    : nowrap;
  flex-shrink    : 0;
}
.ps-top-line {
  flex       : 1;
  height     : 1px;
  background : linear-gradient(90deg, rgba(240,24,90,.4) 0%, transparent 70%);
}

/* ── Título ───────────────────────────────────────────── */
.ps-title {
  font-family    : 'Clash Display', sans-serif;
  font-weight    : 700;
  font-size      : clamp(2.25rem, 9vw, 5rem);
  line-height    : 1.0;
  letter-spacing : -0.03em;
  color          : var(--fg);
  margin-bottom  : 4rem;
}
.ps-title :deep(em) {
  font-style : italic;
  color      : var(--accent);
}

/* ── Track (container dos steps) ─────────────────────── */
.ps-track {
  position : relative;
  display  : flex;
  flex-direction: column;
  gap      : 3rem;
}

/* ── Linha de conexão (só desktop) ───────────────────── */
.ps-line {
  display : none; /* ativada no breakpoint */
}

/* ── Step ─────────────────────────────────────────────── */
.ps-step {
  position   : relative;
  opacity    : 0;
  transform  : translateY(28px);
  transition : opacity 0.6s ease var(--delay, 0s),
               transform 0.6s cubic-bezier(.16,1,.3,1) var(--delay, 0s);
}
.ps-step--visible {
  opacity   : 1;
  transform : translateY(0);
}

/* Número gigante de fundo */
.ps-ghost {
  position       : absolute;
  top            : -1.5rem;
  left           : -0.5rem;
  font-family    : 'Clash Display', sans-serif;
  font-weight    : 700;
  font-size      : clamp(5rem, 18vw, 9rem);
  line-height    : 1;
  color          : transparent;
  -webkit-text-stroke: 1px rgba(240,24,90,.12);
  pointer-events : none;
  user-select    : none;
  z-index        : 0;
}

/* Linha de nó mobile (vertical) */
.ps-node-row {
  display     : flex;
  align-items : center;
  gap         : 0.75rem;
  margin-bottom: 0.75rem;
  position    : relative;
  z-index     : 1;
}

/* Ponto + anel pulsante */
.ps-node {
  position    : relative;
  width       : 10px;
  height      : 10px;
  flex-shrink : 0;
}
.ps-node-dot {
  position      : absolute;
  inset         : 2px;
  border-radius : 50%;
  background    : var(--accent);
  display       : block;
}
.ps-node-ring {
  position      : absolute;
  inset         : 0;
  border-radius : 50%;
  border        : 1px solid var(--accent);
  opacity       : 0;
  animation     : ps-ring-pulse 2.4s ease-in-out infinite;
}
/* Escalonar pulsos entre steps */
.ps-step:nth-child(2) .ps-node-ring { animation-delay: 0.6s; }
.ps-step:nth-child(3) .ps-node-ring { animation-delay: 1.2s; }
.ps-step:nth-child(4) .ps-node-ring { animation-delay: 1.8s; }

.ps-num {
  font-family    : 'Clash Display', sans-serif;
  font-size      : 0.65rem;
  font-weight    : 700;
  letter-spacing : 0.12em;
  color          : var(--accent);
  opacity        : 0.7;
}

/* Título da etapa */
.ps-step-title {
  font-family    : 'Clash Display', sans-serif;
  font-weight    : 600;
  font-size      : clamp(1.1rem, 3vw, 1.4rem);
  letter-spacing : -0.015em;
  color          : var(--fg);
  margin-bottom  : 0.6rem;
  position       : relative;
  z-index        : 1;
}

/* Descrição */
.ps-step-desc {
  font-size     : clamp(0.8rem, 2vw, 0.875rem);
  font-weight   : 300;
  line-height   : 1.85;
  color         : var(--fg-muted);
  margin-bottom : 1rem;
  position      : relative;
  z-index       : 1;
  max-width     : 30ch;
}

/* Tags */
.ps-tags {
  display   : flex;
  flex-wrap : wrap;
  gap       : 0.35rem;
  position  : relative;
  z-index   : 1;
}
.ps-tag {
  font-size      : 0.55rem;
  font-weight    : 500;
  letter-spacing : 0.1em;
  text-transform : uppercase;
  color          : var(--fg-muted);
  border         : 1px solid var(--border);
  padding        : 0.25rem 0.55rem;
  transition     : color 0.2s, border-color 0.2s;
}
.ps-step:hover .ps-tag {
  color         : var(--accent);
  border-color  : rgba(240,24,90,.3);
}

/* ── Keyframes ─────────────────────────────────────────── */
@keyframes ps-ring-pulse {
  0%   { transform: scale(1);   opacity: 0.8; }
  60%  { transform: scale(2.8); opacity: 0;   }
  100% { transform: scale(2.8); opacity: 0;   }
}
@keyframes ps-line-travel {
  0%   { transform: translateX(-100%); }
  100% { transform: translateX(400%);  }
}

/* ── Desktop: layout horizontal ───────────────────────── */
@media (min-width: 640px) {
  .ps-root  { padding: 7rem 3rem; }
}

@media (min-width: 1024px) {
  .ps-root  { padding: 8rem 7rem; }

  .ps-track {
    flex-direction : row;
    align-items    : flex-start;
    gap            : 0;
  }

  /* Linha horizontal de conexão */
  .ps-line {
    display  : block;
    position : absolute;
    top      : 5px; /* alinha com o centro dos nós */
    left     : calc(12.5% + 5px);
    right    : calc(12.5% + 5px);
    height   : 1px;
    overflow : hidden;
  }
  .ps-line-base {
    display    : block;
    width      : 100%;
    height     : 100%;
    background : var(--border);
  }
  .ps-line-pulse {
    display    : block;
    position   : absolute;
    top        : 0;
    left       : 0;
    width      : 30%;
    height     : 100%;
    background : linear-gradient(90deg, transparent, var(--accent), transparent);
    animation  : ps-line-travel 3s ease-in-out infinite;
  }

  .ps-step {
    flex        : 1;
    padding-top : 0;
  }

  /* Números fantasmas reposicionados */
  .ps-ghost {
    top  : -2rem;
    left : -0.75rem;
  }

  /* Descrição sem max-width forçado */
  .ps-step-desc { max-width : none; }

  /* Linha divisória vertical entre steps (exceto último) */
  .ps-step:not(:last-child) {
    border-right : 1px solid var(--border);
    padding-right : 2.5rem;
    margin-right  : 0;
  }
  .ps-step:not(:first-child) {
    padding-left  : 2.5rem;
  }

  /* Nó fica no topo alinhado com a linha */
  .ps-node-row {
    flex-direction : column;
    align-items    : flex-start;
    gap            : 0.5rem;
    margin-bottom  : 1.25rem;
  }
}

@media (min-width: 1400px) {
  .ps-root { padding: 9rem 10rem; }
}
</style>
