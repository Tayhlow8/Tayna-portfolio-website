<template>
  <div :class="['pf-root', `theme-${theme}`]">

    <!-- ── Projetos (listing) ────────────────────────────── -->
    <ProjectsPage
      v-if="route.path === '/projetos'"
      :lang="lang"
      :theme="theme"
    />

    <!-- ── História / Story page ──────────────────────────── -->
    <StoryPage
      v-else-if="route.path === '/historia'"
      :lang="lang"
      :theme="theme"
    />

    <!-- ── CV ────────────────────────────────────────────── -->
    <CVPage
      v-else-if="route.path === '/cv'"
      :lang="lang"
      :theme="theme"
    />

    <!-- ── Case: NV8 ────────────────────────────────────────── -->
    <NV8Case
      v-else-if="route.params.slug === 'nv8'"
      :lang="lang"
      :theme="theme"
    />

    <!-- ── Case: Rodobens ─────────────────────────────────── -->
    <RodobensCase
      v-else-if="route.params.slug === 'rodobens'"
      :lang="lang"
      :theme="theme"
    />

    <!-- ── Case: Master Globo ────────────────────────────── -->
    <MasterGloboCase
      v-else-if="route.params.slug === 'master-globo'"
      :lang="lang"
      :theme="theme"
    />

    <!-- ── Case: Lancôme ─────────────────────────────────── -->
    <LancomeCase
      v-else-if="route.params.slug === 'lancome-brazil'"
      :lang="lang"
      :theme="theme"
    />

    <!-- ── Case: YSL ──────────────────────────────────────── -->
    <YSLCase
      v-else-if="route.params.slug === 'yves-saint-laurent'"
      :lang="lang"
      :theme="theme"
    />

    <!-- ── Portfolio principal ────────────────────────────── -->
    <template v-else>
      <NavBar v-model:lang="lang" v-model:theme="theme" />

      <div class="pf-glow"  aria-hidden="true"></div>
      <div class="pf-grain" aria-hidden="true"></div>

      <HeroSection
        :theme="theme"
        :lang="lang"
      />

      <BrandsSection   :theme="theme" :lang="lang" />
      <ProjectsSection :theme="theme" :lang="lang" />

      <AboutSection
        :theme="theme"
        :lang="lang"
      />

      <ProcessSection      :theme="theme" :lang="lang" />
      <TestimonialsSection :theme="theme" :lang="lang" />
      <ContactSection      :theme="theme" :lang="lang" />

      <!-- Back to top -->
      <button
        class="btt-btn"
        :class="{ 'btt-btn--visible': showBtt }"
        @click="scrollToTop"
        aria-label="Voltar ao topo"
      >
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <polyline points="18 15 12 9 6 15"/>
        </svg>
      </button>
    </template>

    <!-- Chat widget — global, all routes -->
    <ChatWidget :photo="photo" />

  </div>
</template>

<script setup>
import { ref, watch, onMounted, onUnmounted } from 'vue'
import { useRoute }   from 'vue-router'

import NavBar             from '../seções/NavBar.vue'
import ProjectsPage       from '../seções/ProjectsPage.vue'
import HeroSection        from './components/HeroSection.vue'
import BrandsSection      from './components/BrandsSection.vue'
import ProjectsSection    from './components/ProjectsSection.vue'
import AboutSection       from './components/AboutSection.vue'
import ProcessSection     from './components/ProcessSection.vue'
import TestimonialsSection from '../seções/TestimonialsSection.vue'
import ContactSection     from '../seções/ContactSection.vue'
import StoryPage          from '../seções/StoryPage.vue'
import RodobensCase       from '../seções/RodobensCase.vue'
import MasterGloboCase    from '../seções/MasterGloboCase.vue'
import LancomeCase        from '../seções/LancomeCase.vue'
import YSLCase            from '../seções/YSLCase.vue'
import CVPage             from '../seções/CVPage.vue'
import NV8Case           from '../seções/NV8Case.vue'
import ChatWidget         from '../seções/ChatWidget.vue'
import photo              from './assets/photo.png'

const route = useRoute()

// ── Estado global de tema e idioma ──────────────────────────
const theme = ref('dark')
const lang  = ref('EN')

// ── Back to top ─────────────────────────────────────────────
const showBtt = ref(false)

function onScroll () {
  const scrolled = window.scrollY / (document.documentElement.scrollHeight - window.innerHeight)
  const threshold = window.innerWidth < 768 ? 0.30 : 0.65
  showBtt.value = scrolled >= threshold
}

function scrollToTop () {
  window.scrollTo({ top: 0, behavior: 'smooth' })
}

onMounted(()   => window.addEventListener('scroll', onScroll, { passive: true }))
onUnmounted(() => window.removeEventListener('scroll', onScroll))

// Lê lang da query string se o usuário acessar /historia diretamente
watch(
  () => route.query.lang,
  (val) => { if (val) lang.value = val },
  { immediate: true }
)

</script>

<style>
.pf-root {
  background   : var(--bg);
  color        : var(--fg);
  font-family  : var(--font-body);
  min-height   : 100svh;
  position     : relative;
  overflow-x   : hidden;
  transition   : background 0.5s ease, color 0.5s ease;
}

/* ── Back to top ────────────────────────────────────────────── */
.btt-btn {
  position  : fixed;
  bottom    : 2rem;
  right     : 2rem;
  z-index   : 999;
  width     : 44px;
  height    : 44px;
  border    : 1px solid rgba(255, 255, 255, 0.12);
  background: rgba(7, 7, 17, 0.7);
  color     : #F0EFF8;
  cursor    : pointer;
  display   : flex;
  align-items    : center;
  justify-content: center;
  backdrop-filter: blur(10px);
  -webkit-backdrop-filter: blur(10px);
  opacity        : 0;
  transform      : translateY(12px);
  pointer-events : none;
  transition     : opacity .3s ease, transform .3s ease, border-color .2s ease, background .2s ease;
}
.btt-btn--visible {
  opacity       : 1;
  transform     : translateY(0);
  pointer-events: auto;
}
.btt-btn:hover {
  border-color: rgba(255, 255, 255, 0.35);
  background  : rgba(20, 20, 35, 0.85);
}
.theme-light .btt-btn {
  background: rgba(245, 243, 255, 0.75);
  border-color: rgba(0, 0, 0, 0.12);
  color: #0D0C1A;
}
.theme-light .btt-btn:hover {
  border-color: rgba(0, 0, 0, 0.3);
  background  : rgba(230, 228, 245, 0.9);
}

/* Respiro intencional entre seções */
.brands-root,
.projects-root,
.ab-root,
.ps-root {
  margin-top: var(--sp-24);
}
</style>
