<template>
  <section id="recomendacoes" class="tm-root">

    <!-- Label de seção -->
    <div class="tm-top-rule">
      <span class="tm-top-label">{{ t.sectionLabel }}</span>
      <span class="tm-top-line"></span>
      <a
        class="tm-li-link"
        href="https://www.linkedin.com/in/taynaschultz/"
        target="_blank"
        rel="noopener noreferrer"
        :aria-label="t.liLabel"
      >
        <svg class="tm-li-icon" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
          <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 0 1-2.063-2.065 2.064 2.064 0 1 1 2.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
        </svg>
        <span class="tm-li-txt">{{ t.liCta }}</span>
      </a>
    </div>

    <!-- Título -->
    <h2 class="tm-title" v-html="t.title"></h2>

    <!-- Marquee wrapper (fade nas bordas) -->
    <div class="tm-stage" :aria-label="t.sectionLabel">
      <div class="tm-track">
        <!-- Duplicamos os cards pra o loop ser seamless -->
        <template v-for="pass in 2" :key="pass">
          <article
            v-for="(rec, i) in recs"
            :key="`${pass}-${i}`"
            class="tm-card"
            :aria-label="`${rec.name}, ${rec.role}`"
          >
            <!-- Cabeçalho do card -->
            <div class="tm-card-head">
              <div class="tm-avatar" :aria-hidden="true">
                {{ initials(rec.name) }}
              </div>
              <div class="tm-meta">
                <span class="tm-name">{{ rec.name }}</span>
                <span class="tm-role">{{ rec.role }}</span>
                <span class="tm-rel">{{ t.rel[rec.relKey] }}</span>
              </div>
            </div>

            <!-- Separador -->
            <div class="tm-divider" aria-hidden="true"></div>

            <!-- Label -->
            <span class="tm-badge-label">{{ t.praised }}</span>

            <!-- Badges do que foi elogiado -->
            <div class="tm-badges" role="list">
              <span
                v-for="badge in rec.badges"
                :key="badge"
                class="tm-badge"
                role="listitem"
              >{{ badge }}</span>
            </div>

          </article>
        </template>
      </div>
    </div>

  </section>
</template>

<script setup>
import { computed } from 'vue'

const props = defineProps({
  lang:  { type: String, default: 'PT' },
  theme: { type: String, default: 'light' },
})

// ── Helpers ──────────────────────────────────────────────────
const initials = (name) =>
  name.split(' ').slice(0, 2).map(w => w[0]).join('').toUpperCase()

// ── Recomendações (dados estáticos sem badges) ──────────────────
const recsBase = [
  { name: 'Camily Rodrigues',  role: 'Product Designer',          relKey: 'reportedTo' },
  { name: 'Ilson Júnior',      role: 'Product Designer Sr.',       relKey: 'managed'    },
  { name: 'Taciana Serafim',   role: 'Especialista Growth & CRO',  relKey: 'sameTeam'   },
]

// ── Badges traduzidos por idioma ──────────────────────────────
const recs = computed(() => {
  const badges = t.value.badges
  return recsBase.map((r, i) => ({ ...r, badges: badges[i] }))
})

// ── Copies i18n ───────────────────────────────────────────────
const copy = {
  PT: {
    sectionLabel : 'Recomendações',
    title        : 'O que dizem<br>quem <em>trabalhou</em> comigo.',
    liLabel      : 'Ver recomendações completas no LinkedIn',
    liCta        : 'Ver completo',
    praised      : 'elogiou por',
    rel: {
      reportedTo : 'Reportava diretamente a Tayná',
      managed    : 'Liderou Tayná diretamente',
      sameTeam   : 'Mesma equipe',
    },
    badges: [
      ['UI Design', 'Empatia', 'Comunicação', 'Formação de Talentos'],
      ['Parceria Estratégica', 'Articulação', 'Stakeholders', 'Documentação Técnica', 'Soluções de Design', 'Autoridade'],
      ['5 marcas L\'Oréal', 'Testes A/B', 'Landing Pages', 'Estratégia de UI', 'Alinhamento a Negócios'],
    ],
  },
  EN: {
    sectionLabel : 'Recommendations',
    title        : 'What people say<br>who <em>worked</em> with me.',
    liLabel      : 'See full recommendations on LinkedIn',
    liCta        : 'See full',
    praised      : 'praised for',
    rel: {
      reportedTo : 'Reported directly to Tayná',
      managed    : 'Managed Tayná directly',
      sameTeam   : 'Same team',
    },
    badges: [
      ['UI Design', 'Empathy', 'Communication', 'Talent Development'],
      ['Strategic Partnership', 'Articulation', 'Stakeholder Management', 'Technical Documentation', 'Design Solutions', 'Authority'],
      ['5 L\'Oréal brands', 'A/B Testing', 'Landing Pages', 'UI Strategy', 'Business Alignment'],
    ],
  },
  ES: {
    sectionLabel : 'Recomendaciones',
    title        : 'Lo que dicen<br>quienes <em>trabajaron</em> conmigo.',
    liLabel      : 'Ver recomendaciones completas en LinkedIn',
    liCta        : 'Ver completo',
    praised      : 'destacó por',
    rel: {
      reportedTo : 'Reportaba directamente a Tayná',
      managed    : 'Lideró a Tayná directamente',
      sameTeam   : 'Mismo equipo',
    },
    badges: [
      ['UI Design', 'Empatía', 'Comunicación', 'Formación de Talentos'],
      ['Alianza Estratégica', 'Articulación', 'Stakeholders', 'Documentación Técnica', 'Soluciones de Diseño', 'Autoridad'],
      ['5 marcas L\'Oréal', 'Pruebas A/B', 'Landing Pages', 'Estrategia de UI', 'Alineación con Negocio'],
    ],
  },
  DE: {
    sectionLabel : 'Empfehlungen',
    title        : 'Was andere sagen,<br>die mit mir <em>gearbeitet</em> haben.',
    liLabel      : 'Vollständige Empfehlungen auf LinkedIn',
    liCta        : 'Vollständig lesen',
    praised      : 'gelobt für',
    rel: {
      reportedTo : 'Berichtete direkt an Tayná',
      managed    : 'Leitete Tayná direkt',
      sameTeam   : 'Gleiches Team',
    },
    badges: [
      ['UI Design', 'Empathie', 'Kommunikation', 'Talentförderung'],
      ['Strategische Partnerschaft', 'Kommunikationsstärke', 'Stakeholder-Management', 'Technische Dokumentation', 'Design-Lösungen', 'Autorität'],
      ['5 L\'Oréal Marken', 'A/B-Tests', 'Landing Pages', 'UI-Strategie', 'Business-Ausrichtung'],
    ],
  },
}

const t = computed(() => copy[props.lang])
</script>

<style scoped>
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500&display=swap');

/* ── Root ────────────────────────────────────────────────────── */
.tm-root {
  font-family : 'DM Sans', sans-serif;
  padding     : 6rem 0;
  overflow    : hidden;
  position    : relative;
}

/* ── Header (label + link LinkedIn) ─────────────────────────── */
.tm-top-rule {
  display       : flex;
  align-items   : center;
  gap           : 1rem;
  margin-bottom : 2rem;
  padding       : 0 1.5rem;
}
.tm-top-label {
  font-size      : 0.58rem;
  font-weight    : 500;
  letter-spacing : 0.18em;
  text-transform : uppercase;
  color          : var(--accent);
  white-space    : nowrap;
  flex-shrink    : 0;
}
.tm-top-line {
  flex       : 1;
  height     : 1px;
  background : linear-gradient(90deg, rgba(240,24,90,.4) 0%, transparent 70%);
}

/* Link LinkedIn no header */
.tm-li-link {
  display         : inline-flex;
  align-items     : center;
  gap             : 0.4rem;
  text-decoration : none;
  color           : var(--fg-muted);
  border          : 1px solid var(--border);
  padding         : 0.35rem 0.65rem;
  flex-shrink     : 0;
  transition      : color 0.2s ease, border-color 0.2s ease;
}
.tm-li-link:hover {
  color        : var(--accent);
  border-color : rgba(240,24,90,.4);
}
.tm-li-icon {
  width      : 11px;
  height     : 11px;
  flex-shrink: 0;
}
.tm-li-txt {
  font-size      : 0.58rem;
  font-weight    : 500;
  letter-spacing : 0.1em;
  text-transform : uppercase;
  white-space    : nowrap;
}

/* ── Título ──────────────────────────────────────────────────── */
.tm-title {
  font-family    : 'Clash Display', sans-serif;
  font-weight    : 700;
  font-size      : clamp(1.75rem, 6vw, 3.5rem);
  line-height    : 1.1;
  letter-spacing : -0.025em;
  color          : var(--fg);
  margin-bottom  : 3rem;
  padding        : 0 1.5rem;
}
.tm-title :deep(em) {
  font-style : italic;
  color      : var(--accent);
}

/* ── Stage (fade nas bordas laterais) ───────────────────────── */
.tm-stage {
  position : relative;
  width    : 100%;
  /* Máscara de fade nas bordas */
  -webkit-mask-image : linear-gradient(
    to right,
    transparent 0%,
    black 8%,
    black 92%,
    transparent 100%
  );
  mask-image : linear-gradient(
    to right,
    transparent 0%,
    black 8%,
    black 92%,
    transparent 100%
  );
}

/* ── Track animado ───────────────────────────────────────────── */
.tm-track {
  display    : flex;
  gap        : 1.25rem;
  width      : max-content;
  animation  : tm-scroll 28s linear infinite;
  padding    : 0.5rem 0 1.5rem; /* espaço pro box-shadow dos cards */
}
.tm-track:hover { animation-play-state: paused; }

/* ── Card ────────────────────────────────────────────────────── */
.tm-card {
  width         : 320px;
  flex-shrink   : 0;
  background    : var(--bg);
  border        : 1px solid var(--border);
  padding       : 1.5rem;
  display       : flex;
  flex-direction: column;
  gap           : 0.9rem;
  transition    : border-color 0.3s ease;
  position      : relative;
}
.tm-card::before {
  content    : '';
  position   : absolute;
  top        : 0;
  left       : 0;
  right      : 0;
  height     : 2px;
  background : var(--accent);
  opacity    : 0;
  transition : opacity 0.3s ease;
}
.tm-card:hover {
  border-color : rgba(240,24,90,.3);
}
.tm-card:hover::before { opacity: 1; }

/* Cabeçalho: avatar + meta */
.tm-card-head {
  display     : flex;
  align-items : flex-start;
  gap         : 0.85rem;
}

/* Avatar com iniciais */
.tm-avatar {
  width           : 38px;
  height          : 38px;
  border-radius   : 50%;
  background      : rgba(240,24,90,.12);
  border          : 1px solid rgba(240,24,90,.25);
  display         : flex;
  align-items     : center;
  justify-content : center;
  font-family     : 'Clash Display', sans-serif;
  font-weight     : 700;
  font-size       : 0.72rem;
  color           : var(--accent);
  flex-shrink     : 0;
  letter-spacing  : 0.05em;
}

.tm-meta {
  display        : flex;
  flex-direction : column;
  gap            : 0.2rem;
  min-width      : 0;
}
.tm-name {
  font-family    : 'Clash Display', sans-serif;
  font-weight    : 600;
  font-size      : 0.9rem;
  letter-spacing : -0.01em;
  color          : var(--fg);
  white-space    : nowrap;
  overflow       : hidden;
  text-overflow  : ellipsis;
}
.tm-role {
  font-size   : 0.7rem;
  font-weight : 400;
  color       : var(--fg-muted);
  white-space : nowrap;
  overflow    : hidden;
  text-overflow: ellipsis;
}
.tm-rel {
  font-size      : 0.58rem;
  font-weight    : 500;
  letter-spacing : 0.08em;
  text-transform : uppercase;
  color          : var(--accent);
  opacity        : 0.7;
  white-space    : nowrap;
  overflow       : hidden;
  text-overflow  : ellipsis;
}

/* Divider */
.tm-divider {
  height     : 1px;
  background : var(--border);
  width      : 100%;
}

/* Label "elogiou por" */
.tm-badge-label {
  font-size      : 0.55rem;
  font-weight    : 500;
  letter-spacing : 0.14em;
  text-transform : uppercase;
  color          : var(--fg-muted);
}

/* Badges */
.tm-badges {
  display   : flex;
  flex-wrap : wrap;
  gap       : 0.35rem;
}
.tm-badge {
  font-size      : 0.58rem;
  font-weight    : 500;
  letter-spacing : 0.08em;
  text-transform : uppercase;
  color          : var(--fg);
  background     : rgba(240,24,90,.07);
  border         : 1px solid rgba(240,24,90,.18);
  padding        : 0.28rem 0.6rem;
  white-space    : nowrap;
  transition     : background 0.2s, border-color 0.2s;
}
.tm-card:hover .tm-badge {
  background   : rgba(240,24,90,.13);
  border-color : rgba(240,24,90,.35);
}

/* ── Animação ────────────────────────────────────────────────── */
@keyframes tm-scroll {
  0%   { transform: translateX(0); }
  100% { transform: translateX(-50%); } /* 50% porque o conteúdo é duplicado */
}

/* ── Responsivo ──────────────────────────────────────────────── */
@media (min-width: 640px) {
  .tm-root      { padding: 7rem 0; }
  .tm-top-rule  { padding: 0 3rem; }
  .tm-title     { padding: 0 3rem; }
  .tm-card      { width: 360px; }
}

@media (min-width: 1024px) {
  .tm-root      { padding: 8rem 0; }
  .tm-top-rule  { padding: 0 7rem; }
  .tm-title     { padding: 0 7rem; }
}

@media (min-width: 1400px) {
  .tm-top-rule  { padding: 0 10rem; }
  .tm-title     { padding: 0 10rem; }
}

/* Respeita preferência de movimento reduzido */
@media (prefers-reduced-motion: reduce) {
  .tm-track { animation: none; }
}
</style>
