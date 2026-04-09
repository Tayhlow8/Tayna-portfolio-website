<template>
  <nav class="pf-nav" role="navigation" aria-label="Main navigation">

    <!-- LOGO SLOT -->
    <div class="nav-logo">
      <div class="nav-logo-mark" aria-label="Logo">
        <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
          <path d="M21 12.79A9 9 0 1111.21 3a7 7 0 009.79 9.79z"/>
        </svg>
      </div>
      <span class="nav-logo-label">Tayná</span>
    </div>

    <!-- NAV LINKS -->
    <div class="nav-links" role="list">
      <router-link
        v-for="link in navLinks"
        :key="link.to"
        :to="link.to"
        class="nav-link"
        :class="{ active: route.path === link.to || (link.to !== '/' && route.path.startsWith(link.to)) }"
        role="listitem"
      >
        {{ link.label[lang] || link.label['PT'] }}
      </router-link>
    </div>

    <!-- RIGHT CONTROLS -->
    <div class="nav-controls">

      <!-- LANGUAGE SELECTOR -->
      <div class="nav-lang" ref="langContainer">
        <button
          class="nav-lang-btn"
          :class="{ open: langOpen }"
          aria-haspopup="listbox"
          :aria-expanded="langOpen"
          @click="toggleLang"
        >
          <svg class="globe" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="12" cy="12" r="10"/>
            <path d="M2 12h20M12 2a15.3 15.3 0 014 10 15.3 15.3 0 01-4 10 15.3 15.3 0 01-4-10 15.3 15.3 0 014-10z"/>
          </svg>
          <span>{{ lang }}</span>
          <svg class="chevron" width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
            <polyline points="6 9 12 15 18 9"/>
          </svg>
        </button>

        <div
          class="nav-lang-dropdown"
          :class="{ open: langOpen }"
          role="listbox"
          aria-label="Selecionar idioma"
        >
          <button
            v-for="opt in langOptions"
            :key="opt.code"
            class="lang-option"
            :class="{ selected: lang === opt.code }"
            @click="selectLang(opt.code)"
          >
            <span class="lang-flag">{{ opt.flag }}</span>
            {{ opt.label }}
          </button>
        </div>
      </div>

      <!-- THEME TOGGLE -->
      <button
        class="nav-theme-btn"
        @click="toggleTheme"
        :aria-label="theme === 'dark' ? 'Ativar modo claro' : 'Ativar modo escuro'"
      >
        <!-- Sun icon (light mode) -->
        <svg v-if="theme === 'light'" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
          <circle cx="12" cy="12" r="4"/>
          <path d="M12 2v2M12 20v2M4.93 4.93l1.41 1.41M17.66 17.66l1.41 1.41M2 12h2M20 12h2M6.34 17.66l-1.41 1.41M19.07 4.93l-1.41 1.41"/>
        </svg>
        <!-- Moon icon (dark mode) -->
        <svg v-else width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
          <path d="M21 12.79A9 9 0 1111.21 3a7 7 0 009.79 9.79z"/>
        </svg>
      </button>

      <!-- CTA -->
      <button class="pf-btn pf-btn--cta" @click="goToContact" aria-label="Enviar mensagem">
        <span class="pf-ring"></span>
        <span class="pf-veil"></span>
        <span class="pf-core"></span>
        <span class="pf-btn-lbl">{{ ctaLabel }} <span class="pf-arr">→</span></span>
      </button>

    </div>
  </nav>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'

const props = defineProps({
  lang:  { type: String, default: 'PT' },
  theme: { type: String, default: 'dark' },
})

const emit = defineEmits(['update:lang', 'update:theme'])

const route  = useRoute()
const router = useRouter()

// ── Nav links ──────────────────────────────────────────────
const navLinks = [
  { to: '/',        label: { PT: 'Início',         EN: 'Home',         ES: 'Inicio',      DE: 'Start' } },
  { to: '/projetos',label: { PT: 'Projetos',        EN: 'Projects',     ES: 'Proyectos',   DE: 'Projekte' } },
  { to: '/historia',label: { PT: 'Minha história',  EN: 'My story',     ES: 'Mi historia', DE: 'Meine Geschichte' } },
  { to: '/cv',      label: { PT: 'CV',              EN: 'CV',           ES: 'CV',          DE: 'CV' } },
]

// ── Language ───────────────────────────────────────────────
const langOpen      = ref(false)
const langContainer = ref(null)

const langOptions = [
  { code: 'PT', flag: '🇧🇷', label: 'Português' },
  { code: 'EN', flag: '🇺🇸', label: 'English'   },
  { code: 'ES', flag: '🇪🇸', label: 'Español'   },
  { code: 'DE', flag: '🇩🇪', label: 'Deutsch'   },
]

function toggleLang () { langOpen.value = !langOpen.value }

function selectLang (code) {
  emit('update:lang', code)
  langOpen.value = false
}

function onClickOutside (e) {
  if (langContainer.value && !langContainer.value.contains(e.target)) {
    langOpen.value = false
  }
}

onMounted(()   => document.addEventListener('click', onClickOutside))
onUnmounted(() => document.removeEventListener('click', onClickOutside))

// ── Theme ──────────────────────────────────────────────────
function toggleTheme () {
  emit('update:theme', props.theme === 'dark' ? 'light' : 'dark')
}

// ── CTA ───────────────────────────────────────────────────
const ctaLabel = computed(() => ({
  PT: 'Fale comigo',
  EN: 'Send a message',
  ES: 'Contáctame',
  DE: 'Schreib mir',
}[props.lang] || 'Fale comigo'))

function goToContact () {
  // se já estiver na home, rola até o contact
  if (route.path === '/') {
    document.getElementById('contato')?.scrollIntoView({ behavior: 'smooth' })
  } else {
    router.push('/#contact')
  }
}
</script>

<style scoped>
/* ── NAVBAR ─────────────────────────────────────────────── */
.pf-nav {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 100;
  width: 100%;

  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1rem;

  height: 56px;
  padding: 0 clamp(1rem, 5vw, 4rem);

  background: var(--glass-bg);
  border-bottom: 1px solid var(--glass-border);
  backdrop-filter: blur(20px) saturate(160%);
  -webkit-backdrop-filter: blur(20px) saturate(160%);

  box-shadow:
    inset 0 -1px 0 var(--glass-border),
    0 8px 32px var(--glass-shadow),
    0 2px 8px rgba(0,0,0,.08);

  animation: nav-in .8s cubic-bezier(.16,1,.3,1) both;
}

@keyframes nav-in {
  from { opacity:0; transform:translateY(-16px); filter:blur(8px); }
  to   { opacity:1; transform:translateY(0);     filter:blur(0);   }
}

.pf-nav::before {
  content:'';
  position:absolute;
  top:0; left:0; right:0;
  height:1px;
  background: linear-gradient(90deg, transparent 0%, var(--glass-highlight) 40%, rgba(240,24,90,.18) 65%, transparent 100%);
  pointer-events:none;
}

/* ── LOGO ── */
.nav-logo {
  display: flex;
  align-items: center;
  gap: .5rem;
  flex-shrink: 0;
  min-width: 120px;
}

.nav-logo-mark {
  width: 28px;
  height: 28px;
  border: 1px solid var(--ghost-border);
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  transition: border-color .3s;
  color: var(--accent);
}
.nav-logo-mark::after {
  content:'';
  position:absolute;
  inset:4px;
  background: var(--accent);
  opacity:.18;
  transition: opacity .3s;
}
.nav-logo-mark:hover { border-color: rgba(240,24,90,.4); }
.nav-logo-mark:hover::after { opacity:.35; }
.nav-logo-mark svg { position:relative; z-index:1; }

.nav-logo-label {
  font-family: var(--font-display);
  font-size: .55rem;
  font-weight: 600;
  letter-spacing: .14em;
  text-transform: uppercase;
  color: var(--fg-muted);
}

/* ── NAV LINKS ── */
.nav-links {
  display: flex;
  align-items: center;
  gap: 0;
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
}

.nav-link {
  position: relative;
  display: inline-flex;
  align-items: center;
  height: 56px;
  padding: 0 1.25rem;
  font-size: .58rem;
  font-weight: 500;
  letter-spacing: .13em;
  text-transform: uppercase;
  color: var(--fg-muted);
  cursor: pointer;
  transition: color .25s cubic-bezier(.16,1,.3,1);
  text-decoration: none;
  white-space: nowrap;
}

.nav-link::after {
  content:'';
  position:absolute;
  bottom:0; left:50%; right:50%;
  height:1px;
  background: var(--accent);
  transition: left .3s cubic-bezier(.16,1,.3,1), right .3s cubic-bezier(.16,1,.3,1);
}

.nav-link:hover { color: var(--fg); }
.nav-link:hover::after { left: 1.25rem; right: 1.25rem; }

.nav-link.active { color: var(--accent); }
.nav-link.active::after { left: 1.25rem; right: 1.25rem; }

/* ── RIGHT CONTROLS ── */
.nav-controls {
  display: flex;
  align-items: center;
  gap: .75rem;
  flex-shrink: 0;
  min-width: 120px;
  justify-content: flex-end;
}

/* ── LANGUAGE ── */
.nav-lang { position: relative; }

.nav-lang-btn {
  display: inline-flex;
  align-items: center;
  gap: .5rem;
  height: 32px;
  padding: 0 .75rem;
  font-size: .55rem;
  font-weight: 500;
  letter-spacing: .12em;
  text-transform: uppercase;
  color: var(--fg-muted);
  border: 1px solid var(--ghost-border);
  background: transparent;
  cursor: pointer;
  transition: color .2s, border-color .2s;
  white-space: nowrap;
  font-family: var(--font-body);
}
.nav-lang-btn:hover { color: var(--fg); border-color: rgba(240,24,90,.4); }

.nav-lang-btn .chevron {
  transition: transform .3s cubic-bezier(.16,1,.3,1);
  flex-shrink: 0;
}
.nav-lang-btn.open .chevron { transform: rotate(180deg); }

.nav-lang-dropdown {
  position: absolute;
  top: calc(100% + .5rem);
  right: 0;
  min-width: 130px;
  background: var(--glass-bg);
  border: 1px solid var(--glass-border);
  backdrop-filter: blur(20px);
  -webkit-backdrop-filter: blur(20px);
  box-shadow: 0 12px 32px var(--glass-shadow);
  overflow: hidden;
  opacity: 0;
  transform: translateY(-8px);
  pointer-events: none;
  transition: opacity .25s cubic-bezier(.16,1,.3,1), transform .25s cubic-bezier(.16,1,.3,1);
  z-index: 200;
}
.nav-lang-dropdown.open {
  opacity: 1;
  transform: translateY(0);
  pointer-events: all;
}

.lang-option {
  display: flex;
  align-items: center;
  gap: .75rem;
  width: 100%;
  padding: .75rem 1rem;
  font-size: .55rem;
  font-weight: 500;
  letter-spacing: .11em;
  text-transform: uppercase;
  color: var(--fg-muted);
  border: none;
  background: none;
  cursor: pointer;
  text-align: left;
  transition: color .2s, background .2s;
  font-family: var(--font-body);
}
.lang-option:hover { color: var(--fg); background: var(--glass-highlight); }
.lang-option.selected { color: var(--accent); }

.lang-flag { font-size: .85rem; line-height: 1; }

/* ── THEME TOGGLE ── */
.nav-theme-btn {
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--fg-muted);
  border: 1px solid var(--ghost-border);
  background: transparent;
  cursor: pointer;
  transition: color .2s, border-color .2s;
  flex-shrink: 0;
}
.nav-theme-btn:hover { color: var(--accent); border-color: rgba(240,24,90,.4); }

/* ── CTA BUTTON ── */
.pf-btn {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  height: 38px;
  padding: 0 1.25rem;
  overflow: hidden;
  outline: none;
  transition: transform .15s ease;
  flex-shrink: 0;
  border-radius: 0;
  border: none;
  cursor: pointer;
  min-width: 140px;
}
.pf-btn:active { transform: scale(.97); }

.pf-ring {
  position: absolute;
  inset: -100%;
  animation: pf-spin-ring 3s linear infinite;
  opacity: 0;
  transition: opacity .4s ease;
  pointer-events: none;
}
.pf-btn:hover .pf-ring { opacity: 1; }

.pf-veil {
  position: absolute;
  inset: 0;
  transition: opacity .4s ease;
  pointer-events: none;
}
.pf-btn:hover .pf-veil { opacity: 0; }

.pf-core {
  position: absolute;
  inset: 1px;
  z-index: 1;
  pointer-events: none;
  transition: background .4s ease;
}

.pf-btn-lbl {
  position: relative;
  z-index: 2;
  font-size: .55rem;
  font-weight: 500;
  letter-spacing: .14em;
  text-transform: uppercase;
  transition: color .2s;
  font-family: var(--font-body);
}

.pf-arr {
  display: inline-block;
  transition: transform .2s ease;
}
.pf-btn:hover .pf-arr { transform: translateX(4px); }

@keyframes pf-spin-ring { to { transform: rotate(360deg); } }

/* ── CTA — accent pink (igual ao pf-btn--solid do design system) ── */
.pf-btn--cta .pf-ring {
  background: conic-gradient(from 90deg at 50% 50%, transparent 0%, transparent 75%, rgba(255,255,255,.85) 100%);
}
.pf-btn--cta .pf-veil  { background: var(--accent); }
.pf-btn--cta .pf-core  { background: var(--accent); }
.pf-btn--cta .pf-btn-lbl { color: #fff; }

/* Hover: clareia o fundo e escurece o label */
.pf-btn--cta:hover .pf-core    { background: var(--fg); }
.pf-btn--cta:hover .pf-btn-lbl { color: var(--bg); }

/* ── MOBILE ── */
@media (max-width: 768px) {
  .nav-links { display: none; }
  .pf-btn--cta { min-width: unset; padding: 0 1rem; }
  .pf-btn--cta .pf-btn-lbl { font-size: .5rem; }
}
</style>
