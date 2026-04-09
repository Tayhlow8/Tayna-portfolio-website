<template>
  <section id="sobre" class="ab-root">

    <!-- Linha decorativa superior -->
    <div class="ab-top-rule" aria-hidden="true">
      <span class="ab-top-label">{{ t.sectionLabel }}</span>
      <span class="ab-top-line"></span>
    </div>

    <div class="ab-inner">

      <!-- ── Coluna esquerda: texto ──────────────────────── -->
      <div class="ab-left">

        <h2 class="ab-title" v-html="t.title"></h2>

        <!-- Texto principal -->
        <div class="ab-bio">
          <p v-html="t.bio1"></p>
          <p v-html="t.bio2"></p>
        </div>

        <!-- Destaque / quote pessoal -->
        <blockquote class="ab-quote">
          <span class="ab-quote-mark" aria-hidden="true">"</span>
          <span v-html="t.quote"></span>
        </blockquote>

        <!-- CTA → página da história -->
        <button class="ab-btn">
          <span class="ab-btn-ring"  aria-hidden="true"></span>
          <span class="ab-btn-veil"  aria-hidden="true"></span>
          <span class="ab-btn-core"  aria-hidden="true"></span>
          <span class="ab-btn-lbl">
            {{ t.cta }}
            <svg class="ab-btn-arrow" width="12" height="12" viewBox="0 0 24 24"
              fill="none" stroke="currentColor" stroke-width="2"
              stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
              <path d="M5 12h14M12 5l7 7-7 7"/>
            </svg>
          </span>
        </button>

      </div>

      <!-- ── Coluna direita: foto + badges ─────────────── -->
      <div class="ab-right">

        <!-- Container da foto -->
        <div class="ab-photo-wrap">

          <!-- Substituir o src abaixo pela sua foto -->
          <img
            class="ab-photo"
            src="https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?w=600&q=80"
            alt="Tayná — UX Designer"
            loading="lazy"
          />

          <!-- Borda decorativa rosa (canto inferior direito) -->
          <div class="ab-photo-frame" aria-hidden="true"></div>

          <!-- Número flutuante: anos de xp -->
          <div class="ab-xp-chip" aria-label="5+ anos de experiência">
            <b class="ab-xp-n">5+</b>
            <span class="ab-xp-t">{{ t.years }}</span>
          </div>

        </div>

        <!-- Grid de badges de skills -->
        <div class="ab-badges" role="list" :aria-label="t.skillsLabel">
          <span
            v-for="skill in skills"
            :key="skill.key"
            class="ab-badge"
            role="listitem"
          >
            <span class="ab-badge-dot" aria-hidden="true"></span>
            {{ t.skills[skill.key] }}
          </span>
        </div>

      </div>

    </div>

  </section>
</template>

<script setup>
import { computed } from 'vue'

// ── Props: recebe o lang e theme do componente pai ─────
const props = defineProps({
  lang:  { type: String, default: 'PT' },
  theme: { type: String, default: 'dark' },
})

// ── Skills ─────────────────────────────────────────────
const skills = [
  { key: 'businessDesign' },
  { key: 'vibeCoding' },
  { key: 'uxResearch' },
  { key: 'productThinking' },
  { key: 'aiDesign' },
  { key: 'interaction' },
]

// ── Copies ─────────────────────────────────────────────
const copy = {
  PT: {
    sectionLabel : 'Sobre mim',
    title        : 'Design como <em>ponte,</em><br>não como peça.',
    bio1         : 'Para mim, design começa muito antes do pixel. Passei 5 anos imersa em e-commerce — do funil de conversão ao checkout, da pesquisa de usuário ao design system — e aprendi que <strong>ser generalista não é falta de foco: é capacidade de enxergar o produto inteiro</strong>. Meu trabalho conecta o que o negócio precisa, o que o usuário sente e o que a tecnologia consegue entregar.',
    bio2         : 'Hoje, minha aposta é no <strong>vibe coding</strong>. Não quero só especificar — quero construir. Acredito que a próxima geração de designers será definida por quem consegue <strong>transformar intenção em produto real</strong>, sem intermediários. É nisso que estou me tornando.',
    quote        : 'Design é a arte de fazer a tecnologia parecer inevitável.',
    cta          : 'Minha história completa',
    years        : 'anos de UX',
    skillsLabel  : 'Principais habilidades',
    skills: {
      businessDesign : 'Business Design',
      vibeCoding     : 'Vibe Coding',
      uxResearch     : 'UX Research',
      productThinking: 'Product Thinking',
      aiDesign       : 'AI-assisted Design',
      interaction    : 'Interaction Design',
    },
  },
  EN: {
    sectionLabel : 'About me',
    title        : 'Design as a <em>bridge,</em><br>not a deliverable.',
    bio1         : 'For me, design starts long before the pixel. I spent 5 years deep in e-commerce — from conversion funnels to checkout flows, from user research to design systems — and learned that <strong>being a generalist isn\'t a lack of focus: it\'s the ability to see the whole product</strong>. My work connects what the business needs, what the user feels, and what technology can actually deliver.',
    bio2         : 'Today, my bet is on <strong>vibe coding</strong>. I don\'t want to just specify — I want to build. I believe the next generation of designers will be defined by those who can <strong>turn intention into real product</strong>, without intermediaries. That\'s what I\'m becoming.',
    quote        : 'Design is the art of making technology feel inevitable.',
    cta          : 'My full story',
    years        : 'years in UX',
    skillsLabel  : 'Core skills',
    skills: {
      businessDesign : 'Business Design',
      vibeCoding     : 'Vibe Coding',
      uxResearch     : 'UX Research',
      productThinking: 'Product Thinking',
      aiDesign       : 'AI-assisted Design',
      interaction    : 'Interaction Design',
    },
  },
  ES: {
    sectionLabel : 'Sobre mí',
    title        : 'Diseño como <em>puente,</em><br>no como pieza.',
    bio1         : 'Para mí, el diseño empieza mucho antes del píxel. Pasé 5 años inmersa en e-commerce — del funnel de conversión al checkout, de la investigación de usuario al design system — y aprendí que <strong>ser generalista no es falta de foco: es la capacidad de ver el producto completo</strong>. Mi trabajo conecta lo que el negocio necesita, lo que el usuario siente y lo que la tecnología puede entregar.',
    bio2         : 'Hoy, mi apuesta es el <strong>vibe coding</strong>. No quiero solo especificar — quiero construir. Creo que la próxima generación de diseñadoras estará definida por quienes logren <strong>transformar intención en producto real</strong>, sin intermediarios. En eso me estoy convirtiendo.',
    quote        : 'El diseño es el arte de hacer que la tecnología parezca inevitable.',
    cta          : 'Mi historia completa',
    years        : 'años de UX',
    skillsLabel  : 'Habilidades principales',
    skills: {
      businessDesign : 'Business Design',
      vibeCoding     : 'Vibe Coding',
      uxResearch     : 'UX Research',
      productThinking: 'Product Thinking',
      aiDesign       : 'Diseño con IA',
      interaction    : 'Interaction Design',
    },
  },
  DE: {
    sectionLabel : 'Über mich',
    title        : 'Design als <em>Brücke,</em><br>nicht als Lieferung.',
    bio1         : 'Für mich beginnt Design weit vor dem Pixel. Fünf Jahre lang war ich tief im E-Commerce — von Conversion-Funneln bis zum Checkout, von User Research bis zum Design System — und habe gelernt: <strong>Generalistin zu sein bedeutet nicht fehlenden Fokus, sondern die Fähigkeit, das ganze Produkt zu sehen</strong>. Meine Arbeit verbindet, was das Business braucht, was der Nutzer fühlt und was die Technologie liefern kann.',
    bio2         : 'Heute setze ich auf <strong>Vibe Coding</strong>. Ich möchte nicht nur spezifizieren — ich möchte bauen. Ich glaube, die nächste Generation von Designerinnen wird durch jene definiert, die <strong>Absicht in echtes Produkt verwandeln</strong> können, ohne Umwege. Genau das werde ich.',
    quote        : 'Design ist die Kunst, Technologie unvermeidlich wirken zu lassen.',
    cta          : 'Meine ganze Geschichte',
    years        : 'Jahre UX',
    skillsLabel  : 'Kernkompetenzen',
    skills: {
      businessDesign : 'Business Design',
      vibeCoding     : 'Vibe Coding',
      uxResearch     : 'UX-Forschung',
      productThinking: 'Product Thinking',
      aiDesign       : 'KI-gestütztes Design',
      interaction    : 'Interaction Design',
    },
  },
}

const t = computed(() => copy[props.lang])
</script>

<style scoped>
/* ── Fontes (mesmas do hero) ──────────────────────────────── */
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500&display=swap');

/* ── Tokens locais (herdam do pai via CSS vars globais) ─────── */
.ab-root {
  font-family     : 'DM Sans', sans-serif;
  padding         : 6rem 1.5rem;
  position        : relative;
  overflow        : hidden;
}

/* ── Linha superior de seção ────────────────────────────────── */
.ab-top-rule {
  display       : flex;
  align-items   : center;
  gap           : 1rem;
  margin-bottom : 4rem;
}
.ab-top-label {
  font-size      : 0.58rem;
  font-weight    : 500;
  letter-spacing : 0.18em;
  text-transform : uppercase;
  color          : var(--accent);
  white-space    : nowrap;
  flex-shrink    : 0;
}
.ab-top-line {
  flex        : 1;
  height      : 1px;
  background  : linear-gradient(90deg, rgba(240,24,90,.4) 0%, transparent 70%);
  display     : block;
}

/* ── Layout interno ────────────────────────────────────────── */
.ab-inner {
  display        : flex;
  flex-direction : column;
  gap            : 3.5rem;
}

/* ── Coluna esquerda ────────────────────────────────────────── */
.ab-left {
  display        : flex;
  flex-direction : column;
  gap            : 1.5rem;
}

.ab-title {
  font-family    : 'Clash Display', sans-serif;
  font-weight    : 700;
  font-size      : clamp(2rem, 8vw, 3.75rem);
  line-height    : 1.05;
  letter-spacing : -0.025em;
  color          : var(--fg);
  white-space    : pre-line;
}

.ab-bio {
  display : flex;
  flex-direction : column;
  gap     : 1rem;
}
.ab-bio p {
  font-size   : clamp(1.125rem, 2vw, 1.25rem);
  font-weight : 300;
  line-height : 1.9;
  color       : var(--fg-muted);
  max-width   : 52ch;
}
.ab-bio p strong {
  font-weight : 500;
  color       : var(--fg);
}
.ab-title em {
  font-style  : italic;
  color       : var(--accent);
  font-weight : 600;
}

/* Quote pessoal */
.ab-quote {
  position     : relative;
  padding-left : 1.25rem;
  border-left  : 2px solid var(--accent);
  margin       : 0.5rem 0;
}
.ab-quote-mark {
  font-family : 'Clash Display', sans-serif;
  font-size   : 3rem;
  line-height : 0;
  color       : rgba(240,24,90,.2);
  position    : absolute;
  top         : 0.4rem;
  left        : -0.1rem;
  user-select : none;
}
.ab-quote {
  font-family    : 'Clash Display', sans-serif;
  font-weight    : 500;
  font-size      : clamp(1rem, 3vw, 1.25rem);
  line-height    : 1.4;
  letter-spacing : -0.01em;
  color          : var(--fg);
  font-style     : italic;
  padding-top    : 0.25rem;
}

/* ── CTA ─────────────────────────────────────────────────────── */
.ab-btn {
  position         : relative;
  display          : inline-flex;
  align-items      : center;
  justify-content  : center;
  height           : 50px;
  padding          : 0 1.75rem;
  overflow         : hidden;
  outline          : none;
  cursor           : pointer;
  border           : none;
  transition       : transform 0.15s ease;
  align-self       : flex-start;
  min-width        : 220px;
  border-radius    : 0;
}
.ab-btn:active { transform: scale(0.97); }

.ab-btn-ring {
  position   : absolute;
  inset      : -100%;
  animation  : ab-spin 3s linear infinite;
  opacity    : 0;
  transition : opacity 0.4s ease;
  background : conic-gradient(from 90deg at 50% 50%, transparent 0%, transparent 75%, var(--accent) 100%);
  pointer-events: none;
}
.ab-btn:hover .ab-btn-ring { opacity: 1; }

.ab-btn-veil {
  position   : absolute;
  inset      : 0;
  background : var(--ghost-border);
  transition : opacity 0.4s ease;
  pointer-events: none;
}
.ab-btn:hover .ab-btn-veil { opacity: 0; }

.ab-btn-core {
  position : absolute;
  inset    : 1px;
  z-index  : 1;
  background: var(--btn-fill);
  pointer-events: none;
}

.ab-btn-lbl {
  position       : relative;
  z-index        : 2;
  font-size      : 0.62rem;
  font-weight    : 500;
  letter-spacing : 0.14em;
  text-transform : uppercase;
  color          : var(--fg);
  display        : flex;
  align-items    : center;
  gap            : 0.5rem;
}

.ab-btn-arrow {
  transition: transform 0.25s var(--ease-expo, cubic-bezier(.16,1,.3,1));
}
.ab-btn:hover .ab-btn-arrow { transform: translateX(4px); }

/* ── Coluna direita ─────────────────────────────────────────── */
.ab-right {
  display        : flex;
  flex-direction : column;
  gap            : 1.5rem;
}

/* Foto */
.ab-photo-wrap {
  position : relative;
  width    : 100%;
  max-width: 400px;
}

.ab-photo {
  width        : 100%;
  aspect-ratio : 3 / 4;
  object-fit   : cover;
  object-position: center top;
  display      : block;
  filter       : grayscale(15%);
  transition   : filter 0.4s ease;
}
.ab-photo-wrap:hover .ab-photo { filter: grayscale(0%); }

/* Moldura decorativa rosa no canto inferior direito */
.ab-photo-frame {
  position       : absolute;
  bottom         : -10px;
  right          : -10px;
  width          : 55%;
  height         : 55%;
  border-right   : 2px solid var(--accent);
  border-bottom  : 2px solid var(--accent);
  pointer-events : none;
  opacity        : 0.5;
  transition     : opacity 0.4s ease;
}
.ab-photo-wrap:hover .ab-photo-frame { opacity: 1; }

/* Chip de anos */
.ab-xp-chip {
  position       : absolute;
  top            : 1.25rem;
  left           : -1rem;
  background     : var(--bg, #070711);
  border         : 1px solid rgba(240,24,90,.3);
  padding        : 0.6rem 0.85rem;
  display        : flex;
  flex-direction : column;
  gap            : 0.1rem;
}
.ab-xp-n {
  font-family : 'Clash Display', sans-serif;
  font-size   : 1.5rem;
  font-weight : 700;
  color       : var(--accent);
  line-height : 1;
}
.ab-xp-t {
  font-size      : 0.5rem;
  font-weight    : 500;
  letter-spacing : 0.14em;
  text-transform : uppercase;
  color          : var(--fg-muted);
  white-space    : nowrap;
}

/* ── Badges de skills ────────────────────────────────────────── */
.ab-badges {
  display   : flex;
  flex-wrap : wrap;
  gap       : 0.5rem;
}

.ab-badge {
  display        : inline-flex;
  align-items    : center;
  gap            : 0.4rem;
  font-size      : 0.58rem;
  font-weight    : 500;
  letter-spacing : 0.1em;
  text-transform : uppercase;
  color          : var(--fg-muted);
  border         : 1px solid var(--border);
  padding        : 0.4rem 0.7rem;
  transition     : color 0.2s ease, border-color 0.2s ease;
  cursor         : default;
  border-radius  : 0;
}
.ab-badge:hover {
  color         : var(--accent);
  border-color  : rgba(240,24,90,.35);
}

.ab-badge-dot {
  width         : 4px;
  height        : 4px;
  border-radius : 50%;
  background    : var(--accent);
  opacity       : 0.5;
  flex-shrink   : 0;
  transition    : opacity 0.2s;
}
.ab-badge:hover .ab-badge-dot { opacity: 1; }

/* ── Keyframes ───────────────────────────────────────────────── */
@keyframes ab-spin { to { transform: rotate(360deg); } }

/* ── Responsivo ─────────────────────────────────────────────── */
@media (min-width: 640px) {
  .ab-root  { padding: 7rem 3rem; }
}

@media (min-width: 1024px) {
  .ab-root  { padding: 8rem 7rem; }

  .ab-inner {
    flex-direction : row;
    align-items    : flex-start;
    gap            : 6rem;
  }

  .ab-left  { flex: 1.2; }
  .ab-right { flex: 1; }

  .ab-photo-wrap { max-width: none; }
}

@media (min-width: 1400px) {
  .ab-root { padding: 9rem 10rem; }
}
</style>
