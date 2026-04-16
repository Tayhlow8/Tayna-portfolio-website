<template>
  <section id="contato" class="ct-root">

    <!-- Grain decorativo -->
    <div class="ct-grain" aria-hidden="true"></div>

    <!-- Glow de fundo -->
    <div class="ct-glow" aria-hidden="true"></div>

    <!-- Label de seção -->
    <div class="ct-top-rule">
      <span class="ct-top-line"></span>
      <span class="ct-top-label">{{ t.sectionLabel }}</span>
      <span class="ct-top-line"></span>
    </div>

    <!-- Conteúdo central -->
    <div class="ct-body">

      <!-- Status de disponibilidade -->
      <div class="ct-status">
        <span class="ct-status-dot" aria-hidden="true"></span>
        <span class="ct-status-txt">{{ t.status }}</span>
      </div>

      <!-- Título principal -->
      <h2 class="ct-title" v-html="t.title"></h2>

      <!-- Subtítulo -->
      <p class="ct-sub">{{ t.sub }}</p>

      <!-- Chips de modalidade -->
      <div class="ct-modes" role="list" :aria-label="t.modesLabel">
        <span v-for="mode in t.modes" :key="mode" class="ct-mode" role="listitem">
          {{ mode }}
        </span>
      </div>

      <!-- CTA principal -->
      <PfButton
        variant="solid"
        :href="`mailto:tayna.schultz@gmail.com?subject=${encodeURIComponent(t.mailSubject)}`"
        :aria-label="t.btnLabel"
      >
        {{ t.btn }}
        <svg width="13" height="13" viewBox="0 0 24 24" fill="none"
          stroke="currentColor" stroke-width="2"
          stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"
          style="margin-left: 0.45rem">
          <path d="M5 12h14M12 5l7 7-7 7"/>
        </svg>
      </PfButton>

      <!-- E-mail visível -->
      <a class="ct-email" href="mailto:tayna.schultz@gmail.com">
        tayna.schultz@gmail.com
      </a>

      <!-- Links sociais -->
      <div class="ct-socials">
        <a
          class="ct-social"
          href="https://www.linkedin.com/in/taynaschultz/"
          target="_blank"
          rel="noopener noreferrer"
          :aria-label="t.liLabel"
        >
          <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
            <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 0 1-2.063-2.065 2.064 2.064 0 1 1 2.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
          </svg>
          LinkedIn
        </a>
      </div>

    </div>

    <!-- Footer mínimo -->
    <div class="ct-footer">
      <span class="ct-footer-copy">© {{ year }} Tayná Schultz</span>
      <span class="ct-footer-made">{{ t.madeWith }}</span>
    </div>

  </section>
</template>

<script setup>
import { computed } from 'vue'
import PfButton from '../src/components/PfButton.vue'

const props = defineProps({
  lang  : { type: String, default: 'PT' },
  theme : { type: String, default: 'light' },
})

const year = new Date().getFullYear()

const copy = {
  PT: {
    sectionLabel : 'Contato',
    status       : 'Disponível para novos desafios',
    title        : 'Vamos construir<br>algo <em>que importa.</em>',
    sub          : 'Aberta a posições CLT, PJ e projetos pontuais — globalmente.',
    modesLabel   : 'Modalidades de contratação',
    modes        : ['CLT', 'PJ', 'Freela', 'Projetos Pontuais', 'Remoto', 'Internacional'],
    btn          : 'Entrar em contato',
    btnLabel     : 'Enviar e-mail para Tayná Schultz',
    mailSubject  : 'Olá, Tayná — vi seu portfólio',
    liLabel      : 'Perfil no LinkedIn',
    madeWith     : 'Feito com Figma, Vue & vibe.',
  },
  EN: {
    sectionLabel : 'Contact',
    status       : 'Available for new opportunities',
    title        : 'Let\'s build<br>something <em>that matters.</em>',
    sub          : 'Open to full-time, freelance, and project-based work — globally.',
    modesLabel   : 'Work arrangements',
    modes        : ['Full-time', 'Freelance', 'Contract', 'One-off Projects', 'Remote', 'International'],
    btn          : 'Get in touch',
    btnLabel     : 'Send email to Tayná Schultz',
    mailSubject  : 'Hi Tayná — I saw your portfolio',
    liLabel      : 'LinkedIn profile',
    madeWith     : 'Made with Figma, Vue & vibe.',
  },
  ES: {
    sectionLabel : 'Contacto',
    status       : 'Disponible para nuevos desafíos',
    title        : 'Construyamos<br>algo <em>que importe.</em>',
    sub          : 'Abierta a posiciones CLT, PJ y proyectos puntuales — globalmente.',
    modesLabel   : 'Modalidades de contratación',
    modes        : ['Tiempo completo', 'Freelance', 'Contrato', 'Proyectos', 'Remoto', 'Internacional'],
    btn          : 'Ponerse en contacto',
    btnLabel     : 'Enviar correo a Tayná Schultz',
    mailSubject  : 'Hola Tayná — vi tu portfolio',
    liLabel      : 'Perfil en LinkedIn',
    madeWith     : 'Hecho con Figma, Vue & vibe.',
  },
  DE: {
    sectionLabel : 'Kontakt',
    status       : 'Offen für neue Möglichkeiten',
    title        : 'Lass uns etwas<br><em>Bedeutsames</em> bauen.',
    sub          : 'Offen für Festanstellung, Freelance und Projektarbeit — global.',
    modesLabel   : 'Beschäftigungsarten',
    modes        : ['Festanstellung', 'Freelance', 'Projektarbeit', 'Remote', 'International'],
    btn          : 'Kontakt aufnehmen',
    btnLabel     : 'E-Mail an Tayná Schultz senden',
    mailSubject  : 'Hallo Tayná — ich habe dein Portfolio gesehen',
    liLabel      : 'LinkedIn-Profil',
    madeWith     : 'Gemacht mit Figma, Vue & Vibe.',
  },
}

const t = computed(() => copy[props.lang])
</script>

<style scoped>
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500&display=swap');

/* ── Root ─────────────────────────────────────────────────── */
.ct-root {
  font-family     : 'DM Sans', sans-serif;
  position        : relative;
  overflow        : hidden;
  padding         : 6rem 1.5rem 3rem;
  display         : flex;
  flex-direction  : column;
  align-items     : center;
  text-align      : center;
  min-height      : 100svh;
  justify-content : center;
}

/* ── Decorações ───────────────────────────────────────────── */
.ct-grain {
  position         : fixed;
  inset            : 0;
  z-index          : 0;
  pointer-events   : none;
  opacity          : var(--grain-opacity, 0.04);
  background-image : url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");
  background-size  : 180px;
}

.ct-glow {
  position       : absolute;
  bottom         : -20%;
  left           : 50%;
  transform      : translateX(-50%);
  width          : 80vw;
  height         : 80vw;
  max-width      : 800px;
  max-height     : 800px;
  background     : radial-gradient(ellipse at 50% 80%, rgba(240,24,90,.1) 0%, transparent 65%);
  pointer-events : none;
  z-index        : 0;
}

/* ── Linha central de seção ───────────────────────────────── */
.ct-top-rule {
  display       : flex;
  align-items   : center;
  gap           : 1rem;
  width         : 100%;
  max-width     : 500px;
  margin-bottom : 3rem;
  position      : relative;
  z-index       : 1;
}
.ct-top-line {
  flex       : 1;
  height     : 1px;
  background : linear-gradient(90deg, transparent, rgba(240,24,90,.35), transparent);
}
.ct-top-label {
  font-size      : 0.58rem;
  font-weight    : 500;
  letter-spacing : 0.18em;
  text-transform : uppercase;
  color          : var(--accent);
  white-space    : nowrap;
}

/* ── Body ─────────────────────────────────────────────────── */
.ct-body {
  display        : flex;
  flex-direction : column;
  align-items    : center;
  gap            : 1.5rem;
  position       : relative;
  z-index        : 1;
  width          : 100%;
}

/* ── Status ───────────────────────────────────────────────── */
.ct-status {
  display       : inline-flex;
  align-items   : center;
  gap           : 0.5rem;
  border        : 1px solid rgba(240,24,90,.25);
  background    : rgba(240,24,90,.07);
  padding       : 0.45rem 1rem;
  border-radius : 999px;
}
.ct-status-dot {
  width         : 6px;
  height        : 6px;
  border-radius : 50%;
  background    : #2ECC71;
  display       : block;
  flex-shrink   : 0;
  box-shadow    : 0 0 0 0 rgba(46,204,113,.5);
  animation     : ct-status-pulse 2s ease-in-out infinite;
}
.ct-status-txt {
  font-size      : 0.65rem;
  font-weight    : 500;
  letter-spacing : 0.1em;
  text-transform : uppercase;
  color          : var(--fg);
}

/* ── Título ───────────────────────────────────────────────── */
.ct-title {
  font-family    : 'Clash Display', sans-serif;
  font-weight    : 700;
  font-size      : clamp(2.25rem, 9vw, 5.5rem);
  line-height    : 1.05;
  letter-spacing : -0.03em;
  color          : var(--fg);
  max-width      : 14ch;
}
.ct-title :deep(em) {
  font-style : italic;
  color      : var(--accent);
}

/* ── Sub ──────────────────────────────────────────────────── */
.ct-sub {
  font-size   : clamp(1.125rem, 2vw, 1.25rem);
  font-weight : 300;
  line-height : 1.75;
  color       : var(--fg-muted);
  max-width   : 44ch;
}

/* ── Chips de modalidade ──────────────────────────────────── */
.ct-modes {
  display   : flex;
  flex-wrap : wrap;
  gap       : 0.4rem;
  justify-content: center;
  max-width : 420px;
}
.ct-mode {
  font-size      : 0.58rem;
  font-weight    : 500;
  letter-spacing : 0.1em;
  text-transform : uppercase;
  color          : var(--fg-muted);
  border         : 1px solid var(--border);
  padding        : 0.3rem 0.65rem;
  transition     : color 0.2s, border-color 0.2s;
  cursor         : default;
}
.ct-mode:hover {
  color        : var(--accent);
  border-color : rgba(240,24,90,.35);
}


/* ── E-mail visível ───────────────────────────────────────── */
.ct-email {
  font-size      : clamp(0.75rem, 2vw, 0.875rem);
  font-weight    : 300;
  color          : var(--fg-muted);
  text-decoration: none;
  letter-spacing : 0.02em;
  transition     : color 0.2s ease;
  border-bottom  : 1px solid transparent;
  padding-bottom : 1px;
}
.ct-email:hover {
  color        : var(--fg);
  border-color : rgba(240,24,90,.4);
}

/* ── Sociais ──────────────────────────────────────────────── */
.ct-socials {
  display    : flex;
  gap        : 0.75rem;
  margin-top : 0.25rem;
}
.ct-social {
  display         : inline-flex;
  align-items     : center;
  gap             : 0.4rem;
  font-size       : 0.6rem;
  font-weight     : 500;
  letter-spacing  : 0.1em;
  text-transform  : uppercase;
  color           : var(--fg-muted);
  text-decoration : none;
  border          : 1px solid var(--border);
  padding         : 0.4rem 0.75rem;
  transition      : color 0.2s, border-color 0.2s;
}
.ct-social:hover {
  color        : var(--accent);
  border-color : rgba(240,24,90,.35);
}

/* ── Footer ───────────────────────────────────────────────── */
.ct-footer {
  position    : relative;
  z-index     : 1;
  margin-top  : auto;
  padding-top : 4rem;
  display     : flex;
  flex-direction: column;
  align-items : center;
  gap         : 0.4rem;
}
.ct-footer-copy,
.ct-footer-made {
  font-size      : 0.58rem;
  font-weight    : 400;
  letter-spacing : 0.1em;
  color          : var(--fg-muted);
  opacity        : 0.5;
}
.ct-footer-made { opacity: 0.3; }

/* ── Keyframes ────────────────────────────────────────────── */
@keyframes ct-status-pulse {
  0%, 100% { box-shadow: 0 0 0 0 rgba(46,204,113,.5); }
  50%      { box-shadow: 0 0 0 6px rgba(46,204,113,0); }
}

/* ── Responsivo ───────────────────────────────────────────── */
@media (min-width: 640px) {
  .ct-root { padding: 7rem 3rem 3rem; }
}
@media (min-width: 1024px) {
  .ct-root { padding: 9rem 7rem 4rem; }
}
@media (min-width: 1400px) {
  .ct-root { padding: 10rem 10rem 4rem; }
}
</style>
