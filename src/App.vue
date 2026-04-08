<template>
  <div :class="['pf-root', `theme-${theme}`]">

    <!-- ── História / Story page ──────────────────────────── -->
    <StoryPage
      v-if="route.path === '/historia'"
      :lang="lang"
      :theme="theme"
    />

    <!-- ── Case: Rodobens ─────────────────────────────────── -->
    <RodobensCase
      v-else-if="route.params.slug === 'rodobens'"
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
    </template>

  </div>
</template>

<script setup>
import { ref, watch } from 'vue'
import { useRoute }   from 'vue-router'

import NavBar             from '../seções/NavBar.vue'
import HeroSection        from './components/HeroSection.vue'
import BrandsSection      from './components/BrandsSection.vue'
import ProjectsSection    from './components/ProjectsSection.vue'
import AboutSection       from './components/AboutSection.vue'
import ProcessSection     from './components/ProcessSection.vue'
import TestimonialsSection from '../seções/TestimonialsSection.vue'
import ContactSection     from '../seções/ContactSection.vue'
import StoryPage          from '../seções/StoryPage.vue'
import RodobensCase       from '../seções/RodobensCase.vue'

const route = useRoute()

// ── Estado global de tema e idioma ──────────────────────────
const theme = ref('dark')
const lang  = ref('PT')

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

/* Respiro intencional entre seções */
.brands-root,
.projects-root,
.ab-root,
.ps-root {
  margin-top: var(--sp-24);
}
</style>
