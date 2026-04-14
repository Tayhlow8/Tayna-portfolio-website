# CLAUDE.md — Portfólio Tayná Schultz

> Documento de contexto para o Claude Code / Antigravity.
> Leia este arquivo antes de criar ou editar qualquer componente.

---

## 1. Objetivo do Projeto

Portfólio pessoal de **Tayná Schultz** — UX Designer Pleno com 5+ anos de experiência, posicionada para o **mercado internacional** (nômade digital, inglês fluente desde os 13 anos).

**Stack:** Vue 3 SFC via framework **Antigravity** (componentes Vue que compilam para HTML estático).

**Meta principal:** Ser contratada internacionalmente (CLT, PJ, freela, projetos pontuais). O portfólio deve transmitir **autoridade, personalidade e sofisticação** — não um portfólio genérico de UX.

---

## 2. Design System

### Paleta de Cores

```css
/* Accent principal — rosa de poder, não pastel */
--accent:        #F0185A;
--accent-glow:   rgba(240, 24, 90, 0.12);

/* Backgrounds */
--bg-dark:       #070711;   /* dark mode default */
--bg-light:      #F5F3FF;   /* light mode — branco levemente lilás */

/* Texto */
--fg-dark:       #F0EFF8;
--fg-light:      #0D0C1A;
--fg-muted:      #6B6A82;   /* secundário em ambos os modos */
--fg-faint:      #22213A;   /* decorativo dark */

/* Bordas */
--border-dark:   rgba(255, 255, 255, 0.07);
--border-light:  rgba(0, 0, 0, 0.08);
```

### Tipografia

```css
/* Display — títulos, headlines, números grandes */
--font-display: 'Clash Display', sans-serif;
/* Pesos usados: 400, 500, 600, 700 */

/* Body — parágrafos, labels, tags */
--font-body: 'DM Sans', sans-serif;
/* Pesos usados: 300 (light), 400 (regular), 500 (medium) */
```

**Imports de fonte (sempre no topo do `<style>`):**
```css
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,300;0,9..40,400;0,9..40,500&display=swap');
```

### Grain Texture (decorativo, sempre presente)
```css
.grain {
  position: fixed; inset: 0; z-index: 0;
  pointer-events: none;
  opacity: 0.035; /* dark */ /* 0.025 light */
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");
  background-size: 180px;
}
```

### Ambient Glow
```css
.glow {
  position: absolute;
  top: -18%; right: -12%;
  width: 75vw; height: 75vw;
  max-width: 900px; max-height: 900px;
  background: radial-gradient(ellipse at 65% 25%, rgba(240,24,90,.12) 0%, transparent 62%);
  pointer-events: none; z-index: 0;
}
```

### Border-radius
```
Sharp (0px) — botões, tags, badges, cards
8px — chips de status, pequenos elementos pill-like (border-radius: 999px só para badges de status tipo "Aprovado")
```

---

## 3. Componentes Criados

| Arquivo | Descrição |
|---|---|
| `HeroSection.vue` | Hero com título, seletor de idioma, dark/light toggle, 2 CTAs com borda animada |
| `AboutSection.vue` | Sobre mim com copy real em 4 idiomas, foto, badges de skills |
| `ProcessSection.vue` | "Como trabalho" — 4 etapas, linha pulsante, números fantasmas |
| `TestimonialsSection.vue` | Marquee infinito com 3 recomendações LinkedIn |
| `ContactSection.vue` | Contato + disponibilidade + footer |
| `NavBar.vue` | Glass effect, hamburger mobile, seletor de idioma centralizado, logo |
| `StoryPage.vue` | Página "Minha história" — timeline vertical scroll narrativo em 4 idiomas |
| `RodobensCase.vue` | Case study completo Rodobens — 4 partes importadas do Figma via MCP |

---

## 4. Convenções de Código

### Props padrão de todo componente

```vue
<script setup>
const props = defineProps({
  lang  : { type: String, default: 'PT' },  // 'PT' | 'EN' | 'ES' | 'DE'
  theme : { type: String, default: 'dark' }, // 'dark' | 'light'
})
</script>
```

### Integração no App.vue

```vue
<!-- Estado global — única fonte da verdade -->
<NavBar v-model:lang="lang" v-model:theme="theme" />
<HeroSection :lang="lang" :theme="theme" />
<AboutSection :lang="lang" :theme="theme" />
<!-- ... demais seções -->
```

### Estrutura de copies i18n

```js
const copy = {
  PT: { title: '...', sub: '...', cta: '...' },
  EN: { title: '...', sub: '...', cta: '...' },
  ES: { title: '...', sub: '...', cta: '...' },
  DE: { title: '...', sub: '...', cta: '...' },
}
const t = computed(() => copy[props.lang])
```

### Transição de idioma

```vue
<Transition name="t-soft" mode="out-in">
  <div :key="lang">{{ t.algumTexto }}</div>
</Transition>

<style>
.t-soft-enter-active,
.t-soft-leave-active { transition: opacity 0.18s ease, transform 0.18s ease; }
.t-soft-enter-from   { opacity: 0; transform: translateY(6px); }
.t-soft-leave-to     { opacity: 0; transform: translateY(-6px); }
</style>
```

### Scroll Reveal com IntersectionObserver

```vue
<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const visible = ref(false)
const sectionRef = ref(null)
let observer = null

onMounted(() => {
  observer = new IntersectionObserver(
    ([entry]) => { if (entry.isIntersecting) visible.value = true },
    { threshold: 0.15 }
  )
  if (sectionRef.value) observer.observe(sectionRef.value)
})
onUnmounted(() => observer?.disconnect())
</script>

<!-- No template -->
<div ref="sectionRef" :class="['item', { 'item--visible': visible }]"></div>
```

```css
.item {
  opacity: 0;
  transform: translateY(24px);
  transition: opacity 0.6s ease, transform 0.6s cubic-bezier(.16,1,.3,1);
}
.item--visible { opacity: 1; transform: translateY(0); }
/* Escalonar com CSS custom property: */
.item:nth-child(2) { transition-delay: 0.15s; }
/* ou via style binding: :style="{ '--delay': `${i * 0.15}s` }" */
```

### Efeito de borda girando nos CTAs (conic-gradient)

```vue
<!-- Template -->
<button class="btn">
  <span class="btn-ring"  aria-hidden="true"></span>
  <span class="btn-veil"  aria-hidden="true"></span>
  <span class="btn-core"  aria-hidden="true"></span>
  <span class="btn-lbl">Texto do botão</span>
</button>
```

```css
.btn { position: relative; overflow: hidden; height: 50px; padding: 0 1.75rem; border: none; cursor: pointer; }
.btn:active { transform: scale(0.97); }

/* Anel girando — fica invisível, aparece no hover */
.btn-ring {
  position: absolute; inset: -100%;
  animation: spin 3s linear infinite;
  opacity: 0; transition: opacity 0.4s;
  pointer-events: none;
}
.btn:hover .btn-ring { opacity: 1; }

/* Cor de borda padrão (some no hover) */
.btn-veil { position: absolute; inset: 0; transition: opacity 0.4s; }
.btn:hover .btn-veil { opacity: 0; }

/* Recorte de 1px que simula a borda */
.btn-core { position: absolute; inset: 1px; z-index: 1; }

/* Label acima de tudo */
.btn-lbl { position: relative; z-index: 2; font-size: 0.63rem; font-weight: 500; letter-spacing: 0.14em; text-transform: uppercase; }

@keyframes spin { to { transform: rotate(360deg); } }

/* GHOST (borda rosa girando) */
.btn--ghost .btn-ring { background: conic-gradient(from 90deg at 50% 50%, transparent 0%, transparent 75%, #F0185A 100%); }
.btn--ghost .btn-veil { background: rgba(255,255,255,.09); }
.btn--ghost .btn-core { background: #070711; }
.btn--ghost .btn-lbl  { color: #F0EFF8; }

/* SOLID (borda branca girando sobre fundo rosa) */
.btn--solid .btn-ring { background: conic-gradient(from 90deg at 50% 50%, transparent 0%, transparent 75%, rgba(255,255,255,.9) 100%); }
.btn--solid .btn-veil { background: #F0185A; }
.btn--solid .btn-core { background: #F0185A; }
.btn--solid .btn-lbl  { color: #fff; }
```

### Marquee infinito (Testimonials)

```css
.track {
  display: flex; gap: 1.25rem; width: max-content;
  animation: scroll 28s linear infinite;
}
.track:hover { animation-play-state: paused; }

/* IMPORTANTE: duplicar o array no template para loop seamless */
/* O translateX vai até -50% porque o conteúdo é 2x */
@keyframes scroll {
  0%   { transform: translateX(0); }
  100% { transform: translateX(-50%); }
}

/* Fade nas bordas */
.stage {
  -webkit-mask-image: linear-gradient(to right, transparent 0%, black 8%, black 92%, transparent 100%);
  mask-image: linear-gradient(to right, transparent 0%, black 8%, black 92%, transparent 100%);
}

/* Respeitar preferência do usuário */
@media (prefers-reduced-motion: reduce) {
  .track { animation: none; }
}
```

### Números fantasmas (Process Section)

```css
.ghost {
  position: absolute;
  top: -1.5rem; left: -0.5rem;
  font-family: 'Clash Display', sans-serif;
  font-weight: 700;
  font-size: clamp(5rem, 18vw, 9rem);
  color: transparent;
  -webkit-text-stroke: 1px rgba(240, 24, 90, 0.12);
  pointer-events: none;
  user-select: none;
  z-index: 0;
}
```

### Nó pulsante (timelines e process)

```css
.node { position: relative; width: 10px; height: 10px; }
.node-dot { position: absolute; inset: 2px; border-radius: 50%; background: #F0185A; }
.node-ring {
  position: absolute; inset: 0; border-radius: 50%;
  border: 1px solid #F0185A; opacity: 0;
  animation: ring-pulse 2.4s ease-in-out infinite;
}
/* Escalonar entre itens: */
.item:nth-child(2) .node-ring { animation-delay: 0.6s; }
.item:nth-child(3) .node-ring { animation-delay: 1.2s; }

@keyframes ring-pulse {
  0%   { transform: scale(1);   opacity: 0.8; }
  60%  { transform: scale(2.8); opacity: 0;   }
  100% { transform: scale(2.8); opacity: 0;   }
}
```

### Glass Morphism (NavBar)

```css
.navbar {
  background: transparent;
  backdrop-filter: blur(0px);
  border-bottom: 1px solid transparent;
  transition: background 0.4s ease, backdrop-filter 0.4s ease;
}
.navbar--scrolled {
  background: rgba(7, 7, 17, 0.55);
  backdrop-filter: blur(18px) saturate(180%);
  -webkit-backdrop-filter: blur(18px) saturate(180%);
  border-bottom-color: rgba(255, 255, 255, 0.06);
}
```

### Mobile-first breakpoints

```css
/* Base: mobile */
/* sm: */ @media (min-width: 640px)  { ... }
/* md: */ @media (min-width: 1024px) { ... }
/* lg: */ @media (min-width: 1400px) { ... }
```

### Padding padrão das seções

```css
/* mobile  */ padding: 6rem 1.5rem;
/* 640px   */ padding: 7rem 3rem;
/* 1024px  */ padding: 8rem 7rem;
/* 1400px  */ padding: 9rem 10rem;
```

### Regra decorativa de seção

```vue
<div class="section-rule">
  <span class="section-label">Nome da Seção</span>
  <span class="section-line"></span>
</div>
```

```css
.section-rule { display: flex; align-items: center; gap: 1rem; margin-bottom: 2.5rem; }
.section-label { font-size: 0.58rem; font-weight: 500; letter-spacing: 0.18em; text-transform: uppercase; color: #F0185A; white-space: nowrap; flex-shrink: 0; }
.section-line { flex: 1; height: 1px; background: linear-gradient(90deg, rgba(240,24,90,.4) 0%, transparent 70%); }
```

---

## 5. Informações de Contato (usar nos componentes)

```js
const contact = {
  email    : 'tayna.schultz@gmail.com',
  linkedin : 'https://www.linkedin.com/in/taynaschultz/',
  mailPT   : 'mailto:tayna.schultz@gmail.com?subject=Olá%2C%20Tayná%20—%20vi%20seu%20portfólio',
  mailEN   : 'mailto:tayna.schultz@gmail.com?subject=Hi%20Tayná%20—%20I%20saw%20your%20portfolio',
  mailES   : 'mailto:tayna.schultz@gmail.com?subject=Hola%20Tayná%20—%20vi%20tu%20portfolio',
  mailDE   : 'mailto:tayna.schultz@gmail.com?subject=Hallo%20Tayná%20—%20ich%20habe%20dein%20Portfolio%20gesehen',
}
```

### Assets de logo

```
/assets/logo_white.svg   → dark mode
/assets/Logo_black.svg   → light mode
/assets/favicon_pink.svg → favicon (marca do T cursivo)
/assets/favicon_black.svg
```

---

## 6. Âncoras de navegação

```html
#sobre          → AboutSection
#processo       → ProcessSection
#projetos       → ProjectsSection
#recomendacoes  → TestimonialsSection
#contato        → ContactSection
/historia       → StoryPage (página separada)
/cases/rodobens → RodobensCase (página separada)
```

---

## 7. Idiomas suportados

```
PT — Português (default)
EN — English
ES — Español
DE — Deutsch
```

O estado de idioma vive no `App.vue` e desce via prop `:lang` para todos os componentes.

---

## 8. Copy real já definido

### Hero
```
PT headline: "Design que conecta / negócio, usuário / e tecnologia."
EN headline: "Design that bridges / business, user, / and technology."
```

### About
```
Título PT: "Design como ponte, não como peça."
Título EN: "Design as a bridge, not a deliverable."

Bio 1 (PT): e-commerce → L'Oréal → generalista → 5 anos
Bio 2 (PT): aposta no vibe coding → independência de dev
Quote (PT): "Design é a arte de fazer a tecnologia parecer inevitável."
```

### Skills/Badges
```
Business Design · Vibe Coding · UX Research
Product Thinking · AI-assisted Design · Interaction Design
```

### Recomendações LinkedIn
```
Camily Rodrigues   — Product Designer         — UI Design, Empatia, Comunicação, Formação de Talentos
Ilson Júnior       — Product Designer Sr.     — Parceria Estratégica, Articulação, Stakeholders, Documentação Técnica, Soluções de Design, Autoridade
Taciana Serafim    — Especialista Growth & CRO — 5 marcas L'Oréal, Testes A/B, Landing Pages, Estratégia de UI, Alinhamento a Negócios
```

### Disponibilidade
```
CLT · PJ · Freela · Projetos Pontuais · Remoto · Internacional
Status: "Disponível para novos desafios" (dot verde pulsante)
```

---

## 9. Casos de Estudo

### Rodobens (concluído)
```
Arquivo: RodobensCase.vue
Imagens: URLs do Figma MCP (expiram em 7 dias — migrar para /assets)
Seções: Hero → Queixas → Overview → Design (4 telas) → DS Moderno → Entregáveis → Reflexões
```

### Próximos cases (a construir)
```
- L'Oréal / YSL Beauty (e-commerce, landing pages, testes A/B)
- NV8 Tecnologia (site institucional, vibe coding)
```

---

## 10. O que NUNCA fazer

```
❌ Usar Inter, Roboto, Arial ou system-ui como fonte principal
❌ Gradientes roxos em fundo branco (padrão genérico de IA)
❌ border-radius grande (>8px) em botões, cards ou tags — o sistema é sharp
❌ Criar novo estado de lang/theme fora do App.vue — prop drilling intencional
❌ Usar localStorage ou sessionStorage em artefatos
❌ Colocar texto explicativo dentro do HTML do componente (vai no copy object)
❌ Omitir os 4 idiomas — PT, EN, ES e DE sempre juntos
❌ Esquecer o aria-hidden="true" nos elementos puramente decorativos
❌ Usar position: fixed dentro de artefatos visualizados no Claude
❌ Duplicar estado de tema/idioma — um único ref no pai, props nos filhos
```

---

## 11. Lembrete de Easing

```css
/* Expo out — usado em todos os reveals e transições principais */
--ease-expo: cubic-bezier(0.16, 1, 0.3, 1);
```

---

*Atualizado durante sessão de build do portfólio — Abril 2025.*
