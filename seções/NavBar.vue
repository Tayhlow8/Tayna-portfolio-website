<template>
  <header :class="['nb-root', { 'nb-root--scrolled': scrolled, 'nb-root--open': menuOpen }]">

    <!-- ── Logo (esquerda) ───────────────────────── -->
    <a href="/" class="nb-logo" aria-label="Tayná Schultz — Portfólio">
      <!-- Logo branco no dark mode, preto no light -->
      <img
        v-if="theme === 'dark'"
        src="/assets/logo_white.svg"
        alt="Tayná Schultz"
        class="nb-logo-img"
        width="88"
        height="59"
      />
      <img
        v-else
        src="/assets/Logo_black.svg"
        alt="Tayná Schultz"
        class="nb-logo-img"
        width="88"
        height="59"
      />
    </a>

    <!-- ── Language selector (centro, sempre visível) ─ -->
    <div class="nb-langs" role="group" :aria-label="'Idioma / Language'">
      <button
        v-for="l in langs"
        :key="l.code"
        :class="['nb-lang', { 'nb-lang--on': lang === l.code }]"
        :aria-pressed="lang === l.code"
        @click="$emit('update:lang', l.code)"
      >{{ l.label }}</button>
    </div>

    <!-- ── Direita: tema + hamburger ─────────────── -->
    <div class="nb-right">

      <!-- Toggle de tema -->
      <button
        class="nb-icon-btn"
        @click="$emit('update:theme', theme === 'dark' ? 'light' : 'dark')"
        :aria-label="theme === 'dark' ? 'Ativar modo claro' : 'Ativar modo escuro'"
      >
        <svg v-if="theme === 'dark'" width="14" height="14" viewBox="0 0 24 24"
          fill="none" stroke="currentColor" stroke-width="1.5"
          stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
          <circle cx="12" cy="12" r="4"/>
          <path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41 1.41"/>
        </svg>
        <svg v-else width="14" height="14" viewBox="0 0 24 24"
          fill="none" stroke="currentColor" stroke-width="1.5"
          stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
          <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/>
        </svg>
      </button>

      <!-- Hamburger -->
      <button
        class="nb-burger"
        :class="{ 'nb-burger--open': menuOpen }"
        @click="menuOpen = !menuOpen"
        :aria-expanded="menuOpen"
        :aria-label="menuOpen ? 'Fechar menu' : 'Abrir menu'"
        aria-controls="nb-menu"
      >
        <span class="nb-burger-line"></span>
        <span class="nb-burger-line"></span>
      </button>

    </div>

    <!-- ── Menu mobile (drawer) ───────────────────── -->
    <Transition name="nb-menu">
      <nav
        v-if="menuOpen"
        id="nb-menu"
        class="nb-drawer"
        aria-label="Navegação principal"
      >
        <ul class="nb-nav" role="list">
          <li v-for="(item, i) in t.nav" :key="item.href" role="listitem"
            :style="{ '--ni': i }">
            <a
              class="nb-nav-link"
              :href="item.href"
              @click="menuOpen = false"
            >
              <span class="nb-nav-num">0{{ i + 1 }}</span>
              <span class="nb-nav-label">{{ item.label }}</span>
              <svg class="nb-nav-arrow" width="12" height="12" viewBox="0 0 24 24"
                fill="none" stroke="currentColor" stroke-width="2"
                stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                <path d="M5 12h14M12 5l7 7-7 7"/>
              </svg>
            </a>
          </li>
        </ul>

        <!-- CTA no fundo do drawer -->
        <a
          class="nb-drawer-cta"
          :href="`mailto:tayna.schultz@gmail.com?subject=${encodeURIComponent(t.mailSubject)}`"
          @click="menuOpen = false"
        >
          <span class="nb-drawer-cta-ring" aria-hidden="true"></span>
          <span class="nb-drawer-cta-veil" aria-hidden="true"></span>
          <span class="nb-drawer-cta-core" aria-hidden="true"></span>
          <span class="nb-drawer-cta-lbl">{{ t.cta }}</span>
        </a>

      </nav>
    </Transition>

    <!-- Overlay (fecha menu ao clicar fora) -->
    <Transition name="nb-overlay">
      <div
        v-if="menuOpen"
        class="nb-overlay"
        @click="menuOpen = false"
        aria-hidden="true"
      ></div>
    </Transition>

  </header>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'

const props = defineProps({
  lang  : { type: String, default: 'PT' },
  theme : { type: String, default: 'dark' },
})

defineEmits(['update:lang', 'update:theme'])

// ── State ────────────────────────────────────────────────
const menuOpen = ref(false)
const scrolled = ref(false)

const langs = [
  { code: 'PT', label: 'PT' },
  { code: 'EN', label: 'EN' },
  { code: 'ES', label: 'ES' },
  { code: 'DE', label: 'DE' },
]

// ── Scroll listener ───────────────────────────────────────
const onScroll = () => { scrolled.value = window.scrollY > 24 }
onMounted(()  => window.addEventListener('scroll', onScroll, { passive: true }))
onUnmounted(() => window.removeEventListener('scroll', onScroll))

// ── Fechar com Escape ─────────────────────────────────────
const onKey = (e) => { if (e.key === 'Escape') menuOpen.value = false }
onMounted(()  => window.addEventListener('keydown', onKey))
onUnmounted(() => window.removeEventListener('keydown', onKey))

// ── Copies ────────────────────────────────────────────────
const copy = {
  PT: {
    nav: [
      { label: 'Sobre mim',    href: '#sobre'     },
      { label: 'Como trabalho', href: '#processo'  },
      { label: 'Projetos',      href: '#projetos'  },
      { label: 'Recomendações', href: '#recomendacoes' },
      { label: 'Minha história', href: '/historia' },
      { label: 'Contato',       href: '#contato'   },
    ],
    cta         : 'Falar comigo',
    mailSubject : 'Olá, Tayná — vi seu portfólio',
  },
  EN: {
    nav: [
      { label: 'About me',      href: '#sobre'     },
      { label: 'How I work',    href: '#processo'  },
      { label: 'Projects',      href: '#projetos'  },
      { label: 'Recommendations', href: '#recomendacoes' },
      { label: 'My story',      href: '/historia'  },
      { label: 'Contact',       href: '#contato'   },
    ],
    cta         : 'Get in touch',
    mailSubject : 'Hi Tayná — I saw your portfolio',
  },
  ES: {
    nav: [
      { label: 'Sobre mí',      href: '#sobre'     },
      { label: 'Cómo trabajo',  href: '#processo'  },
      { label: 'Proyectos',     href: '#projetos'  },
      { label: 'Recomendaciones', href: '#recomendacoes' },
      { label: 'Mi historia',   href: '/historia'  },
      { label: 'Contacto',      href: '#contato'   },
    ],
    cta         : 'Escribirme',
    mailSubject : 'Hola Tayná — vi tu portfolio',
  },
  DE: {
    nav: [
      { label: 'Über mich',     href: '#sobre'     },
      { label: 'Wie ich arbeite', href: '#processo' },
      { label: 'Projekte',      href: '#projetos'  },
      { label: 'Empfehlungen',  href: '#recomendacoes' },
      { label: 'Meine Geschichte', href: '/historia' },
      { label: 'Kontakt',       href: '#contato'   },
    ],
    cta         : 'Kontakt aufnehmen',
    mailSubject : 'Hallo Tayná — ich habe dein Portfolio gesehen',
  },
}

const t = computed(() => copy[props.lang])
</script>

<style scoped>
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500&display=swap');

/* ── Root ───────────────────────────────────────────────── */
.nb-root {
  position         : fixed;
  top              : 0;
  left             : 0;
  right            : 0;
  z-index          : 200;
  display          : flex;
  align-items      : center;
  justify-content  : space-between;
  padding          : 0.9rem 1.25rem;
  font-family      : 'DM Sans', sans-serif;

  /* Glass base */
  background       : transparent;
  backdrop-filter  : blur(0px);
  -webkit-backdrop-filter: blur(0px);
  border-bottom    : 1px solid transparent;
  transition       : background 0.4s ease, backdrop-filter 0.4s ease,
                     border-color 0.4s ease, padding 0.3s ease;
}

/* Scrolled — ativa o glass */
.nb-root--scrolled {
  background            : rgba(7, 7, 17, 0.55);
  backdrop-filter       : blur(18px) saturate(180%);
  -webkit-backdrop-filter: blur(18px) saturate(180%);
  border-bottom-color   : rgba(255, 255, 255, 0.06);
}

/* Light mode glass */
:global(.theme-light) .nb-root--scrolled {
  background            : rgba(245, 243, 255, 0.65);
  border-bottom-color   : rgba(0, 0, 0, 0.06);
}

/* ── Logo ────────────────────────────────────────────────── */
.nb-logo {
  display         : flex;
  align-items     : center;
  text-decoration : none;
  flex-shrink     : 0;
  z-index         : 210;
}
.nb-logo-img {
  height    : 28px;
  width     : auto;
  display   : block;
  transition: opacity 0.2s ease;
}
.nb-logo:hover .nb-logo-img { opacity: 0.75; }

/* ── Seletor de idioma (centro) ─────────────────────────── */
.nb-langs {
  display          : flex;
  align-items      : center;
  position         : absolute;
  left             : 50%;
  transform        : translateX(-50%);
  z-index          : 210;
  background       : rgba(255, 255, 255, 0.04);
  border           : 1px solid rgba(255, 255, 255, 0.08);
  padding          : 0.15rem;
  gap              : 0;
  border-radius    : 2px;
}

:global(.theme-light) .nb-langs {
  background  : rgba(0, 0, 0, 0.04);
  border-color: rgba(0, 0, 0, 0.08);
}

.nb-lang {
  font-size      : 0.6rem;
  font-weight    : 500;
  letter-spacing : 0.12em;
  text-transform : uppercase;
  color          : var(--fg-muted, #6B6A82);
  padding        : 0.3rem 0.5rem;
  background     : none;
  border         : none;
  cursor         : pointer;
  font-family    : 'DM Sans', sans-serif;
  transition     : color 0.2s ease, background 0.2s ease;
  border-radius  : 1px;
  line-height    : 1;
}
.nb-lang:hover  { color: var(--fg, #F0EFF8); }
.nb-lang--on {
  color      : var(--accent, #F0185A);
  background : rgba(240, 24, 90, 0.1);
}

/* ── Direita ─────────────────────────────────────────────── */
.nb-right {
  display     : flex;
  align-items : center;
  gap         : 0.5rem;
  z-index     : 210;
}

/* Botão de ícone genérico */
.nb-icon-btn {
  width            : 32px;
  height           : 32px;
  display          : flex;
  align-items      : center;
  justify-content  : center;
  color            : var(--fg-muted, #6B6A82);
  background       : none;
  border           : 1px solid rgba(255, 255, 255, 0.07);
  cursor           : pointer;
  transition       : color 0.2s ease, border-color 0.2s ease;
  border-radius    : 0;
  flex-shrink      : 0;
}
.nb-icon-btn:hover {
  color        : var(--accent, #F0185A);
  border-color : rgba(240, 24, 90, 0.35);
}

:global(.theme-light) .nb-icon-btn {
  border-color : rgba(0, 0, 0, 0.1);
  color        : #62607A;
}

/* ── Hamburger ───────────────────────────────────────────── */
.nb-burger {
  width           : 32px;
  height          : 32px;
  display         : flex;
  flex-direction  : column;
  align-items     : center;
  justify-content : center;
  gap             : 5px;
  background      : none;
  border          : 1px solid rgba(255, 255, 255, 0.07);
  cursor          : pointer;
  padding         : 0;
  border-radius   : 0;
  flex-shrink     : 0;
  transition      : border-color 0.2s ease;
}
.nb-burger:hover { border-color: rgba(240, 24, 90, 0.35); }

.nb-burger-line {
  display          : block;
  width            : 14px;
  height           : 1px;
  background       : var(--fg-muted, #6B6A82);
  transition       : transform 0.3s cubic-bezier(.16,1,.3,1),
                     opacity 0.3s ease,
                     width 0.3s ease;
  transform-origin : center;
}

.nb-burger--open .nb-burger-line:nth-child(1) {
  transform : translateY(3px) rotate(45deg);
  width     : 16px;
  background: #F0185A;
}
.nb-burger--open .nb-burger-line:nth-child(2) {
  transform : translateY(-3px) rotate(-45deg);
  width     : 16px;
  background: #F0185A;
}

/* ── Drawer (menu mobile) ───────────────────────────────── */
.nb-drawer {
  position         : fixed;
  top              : 0;
  right            : 0;
  bottom           : 0;
  width            : min(320px, 85vw);
  background       : rgba(7, 7, 17, 0.96);
  backdrop-filter  : blur(24px) saturate(180%);
  -webkit-backdrop-filter: blur(24px) saturate(180%);
  border-left      : 1px solid rgba(255, 255, 255, 0.06);
  display          : flex;
  flex-direction   : column;
  padding          : 5rem 1.75rem 2rem;
  gap              : 0;
  z-index          : 205;
  overflow-y       : auto;
}

:global(.theme-light) .nb-drawer {
  background    : rgba(245, 243, 255, 0.97);
  border-left   : 1px solid rgba(0, 0, 0, 0.06);
}

/* ── Nav links ───────────────────────────────────────────── */
.nb-nav {
  list-style    : none;
  display       : flex;
  flex-direction: column;
  flex          : 1;
}

.nb-nav-link {
  display          : flex;
  align-items      : center;
  gap              : 0.75rem;
  padding          : 1.1rem 0;
  text-decoration  : none;
  border-bottom    : 1px solid rgba(255, 255, 255, 0.05);
  color            : var(--fg, #F0EFF8);
  transition       : color 0.2s ease, padding-left 0.3s ease;
  position         : relative;
  overflow         : hidden;

  /* Entrada escalonada */
  opacity          : 0;
  transform        : translateX(16px);
  animation        : nb-slide-in 0.45s cubic-bezier(.16,1,.3,1) forwards;
  animation-delay  : calc(var(--ni, 0) * 0.06s + 0.15s);
}

:global(.theme-light) .nb-nav-link {
  border-bottom-color : rgba(0, 0, 0, 0.06);
  color               : #0D0C1A;
}

.nb-nav-link:hover {
  color        : #F0185A;
  padding-left : 0.5rem;
}

.nb-nav-num {
  font-size      : 0.55rem;
  font-weight    : 500;
  letter-spacing : 0.12em;
  color          : #F0185A;
  opacity        : 0.5;
  flex-shrink    : 0;
  font-family    : 'DM Sans', sans-serif;
  transition     : opacity 0.2s;
}
.nb-nav-link:hover .nb-nav-num { opacity: 1; }

.nb-nav-label {
  font-family    : 'Clash Display', sans-serif;
  font-weight    : 500;
  font-size      : clamp(1.1rem, 4vw, 1.3rem);
  letter-spacing : -0.015em;
  flex           : 1;
}

.nb-nav-arrow {
  color      : rgba(240, 24, 90, 0);
  transition : color 0.2s, transform 0.25s cubic-bezier(.16,1,.3,1);
  flex-shrink: 0;
}
.nb-nav-link:hover .nb-nav-arrow {
  color     : #F0185A;
  transform : translateX(4px);
}

/* ── CTA no drawer ───────────────────────────────────────── */
.nb-drawer-cta {
  position         : relative;
  display          : flex;
  align-items      : center;
  justify-content  : center;
  height           : 50px;
  overflow         : hidden;
  text-decoration  : none;
  cursor           : pointer;
  margin-top       : 2rem;
  transition       : transform 0.15s ease;
  flex-shrink      : 0;
}
.nb-drawer-cta:active { transform: scale(0.97); }

.nb-drawer-cta-ring {
  position   : absolute;
  inset      : -100%;
  animation  : nb-spin 3s linear infinite;
  opacity    : 0;
  transition : opacity 0.4s ease;
  background : conic-gradient(from 90deg at 50% 50%, transparent 0%, transparent 75%, rgba(255,255,255,.9) 100%);
  pointer-events: none;
}
.nb-drawer-cta:hover .nb-drawer-cta-ring { opacity: 1; }

.nb-drawer-cta-veil {
  position       : absolute;
  inset          : 0;
  background     : #F0185A;
  pointer-events : none;
}
.nb-drawer-cta-core {
  position       : absolute;
  inset          : 1px;
  z-index        : 1;
  background     : #F0185A;
  pointer-events : none;
  transition     : background 0.3s ease;
}
.nb-drawer-cta:hover .nb-drawer-cta-core { background: #f5326d; }

.nb-drawer-cta-lbl {
  position       : relative;
  z-index        : 2;
  font-size      : 0.65rem;
  font-weight    : 500;
  letter-spacing : 0.14em;
  text-transform : uppercase;
  color          : #fff;
  font-family    : 'DM Sans', sans-serif;
}

/* ── Overlay ─────────────────────────────────────────────── */
.nb-overlay {
  position   : fixed;
  inset      : 0;
  background : rgba(0, 0, 0, 0.5);
  z-index    : 204;
  backdrop-filter: blur(2px);
}

/* ── Transições do Vue ───────────────────────────────────── */
.nb-menu-enter-active { transition: transform 0.4s cubic-bezier(.16,1,.3,1); }
.nb-menu-leave-active { transition: transform 0.3s ease-in; }
.nb-menu-enter-from  { transform: translateX(100%); }
.nb-menu-leave-to    { transform: translateX(100%); }

.nb-overlay-enter-active { transition: opacity 0.3s ease; }
.nb-overlay-leave-active { transition: opacity 0.25s ease; }
.nb-overlay-enter-from   { opacity: 0; }
.nb-overlay-leave-to     { opacity: 0; }

/* ── Keyframes ───────────────────────────────────────────── */
@keyframes nb-slide-in {
  to { opacity: 1; transform: translateX(0); }
}
@keyframes nb-spin {
  to { transform: rotate(360deg); }
}

/* ── Desktop: drawer vira nav horizontal ─────────────────── */
@media (min-width: 1024px) {
  .nb-root   { padding: 1rem 5rem; }
  .nb-burger { display: none; }

  /* Drawer sempre visível e horizontal */
  .nb-drawer {
    position         : static;
    width            : auto;
    background       : none;
    backdrop-filter  : none;
    border           : none;
    flex-direction   : row;
    align-items      : center;
    padding          : 0;
    gap              : 0;
    overflow         : visible;
  }
  .nb-nav {
    flex-direction : row;
    align-items    : center;
    gap            : 0;
  }
  .nb-nav-link {
    padding      : 0.4rem 0.75rem;
    border-bottom: none;
    opacity      : 1;
    transform    : none;
    animation    : none;
  }
  .nb-nav-link:hover { padding-left: 0.75rem; }

  .nb-nav-num   { display: none; }
  .nb-nav-arrow { display: none; }

  .nb-nav-label {
    font-family    : 'DM Sans', sans-serif;
    font-weight    : 400;
    font-size      : 0.78rem;
    letter-spacing : 0.06em;
    text-transform : uppercase;
  }

  .nb-drawer-cta { margin-top: 0; min-width: 140px; height: 36px; }
}

@media (min-width: 1280px) {
  .nb-root { padding: 1rem 7rem; }
}
@media (min-width: 1400px) {
  .nb-root { padding: 1rem 10rem; }
}
</style>
