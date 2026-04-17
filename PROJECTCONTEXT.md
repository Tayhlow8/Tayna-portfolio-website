# PROJECTCONTEXT — Portfolio Tayná

Contexto consolidado do projeto para onboarding, referência de arquitetura e trabalho assistido por IA. Mantenha este documento atualizado quando a estrutura ou o stack mudar.

---

## 1. Visão geral

Portfolio pessoal da **Tayná Schultz** (UX Designer). Single Page Application com páginas de apresentação, cases detalhados, currículo online e chat widget. Deploy via Vercel.

- **Idioma do conteúdo:** PT/EN (i18n manual via prop `lang`, valores `'PT'` e `'EN'`)
- **Tema:** claro (default) e escuro, alternáveis via prop `theme` e classe `theme-light` / `theme-dark` no root
- **Accent cor única:** `#F0185A` (pink)
- **Tipografia:** Clash Display (display) + DM Sans (body), carregadas de Fontshare e Google Fonts no `index.html`

---

## 2. Stack

| Camada | Escolha |
|---|---|
| Framework | Vue 3.5 (Composition API, `<script setup>`) |
| Bundler | Vite 8 |
| Roteamento | vue-router 4 (em modo "switch manual" — ver §5) |
| Estilos | CSS puro com CSS custom properties (sem Tailwind, sem pré-processador) |
| Linguagem | JavaScript (sem TypeScript) |
| Testes | **Nenhum** |
| Lint / Format | **Nenhum configurado** |
| Hospedagem | Vercel (ver `vercel.json`) |

### Scripts (`package.json`)
- `npm run dev` — Vite dev server
- `npm run build` — build para `dist/`
- `npm run preview` — serve o build

---

## 3. Estrutura de pastas

```
WEBSITE TAYNA 2.0/
├── index.html                  ← entry Vite (title, fontes, #app)
├── package.json
├── vite.config.js              ← minimal: só plugin-vue
├── vercel.json
├── robots.txt · sitemap (1).xml
├── design-system.html          ← referência estática visual do DS
├── add-lazy-loading.ps1/.sh    ← scripts utilitários (⚠️ caminhos quebrados, ver §8)
├── clientes/                   ← assets visuais de clientes (PNG/JPG)
├── imagens cases/              ← screenshots dos cases
├── public/                     ← assets servidos como estáticos (favicon, icons.svg)
├── dist/                       ← build output (gerado)
├── secoes/                     ← "pages" + seções globais + cases (ver §4)
│   ├── NavBar.vue · ChatWidget.vue
│   ├── ContactSection.vue · TestimonialsSection.vue
│   ├── ProjectsPage.vue · StoryPage.vue · CVPage.vue
│   ├── NV8Case.vue · RodobensCase.vue · MasterGloboCase.vue
│   ├── LancomeCase.vue · YSLCase.vue
│   ├── markdowns website/      ← notas/CLAUDE.md interno (não publicado)
│   └── *.html                  ← previews estáticos dos componentes
└── src/
    ├── App.vue                 ← root + "roteador" manual
    ├── main.js                 ← bootstrap (createApp + router)
    ├── assets/
    │   ├── main.css            ← ÚNICA fonte de tokens + reset + keyframes
    │   ├── hero.png · photo.png
    │   └── vite.svg · vue.svg
    ├── components/             ← blocos reutilizáveis da home
    │   ├── HeroSection.vue
    │   ├── BrandsSection.vue
    │   ├── ProjectsSection.vue
    │   ├── AboutSection.vue
    │   ├── ProcessSection.vue
    │   ├── PfButton.vue
    │   └── FigmaMockup.vue
    └── router/
        └── index.js            ← rotas (todas apontam para App.vue)
```

### Convenção importante
- **`src/components/`**: blocos da home (reutilizáveis, genéricos)
- **`secoes/`**: páginas inteiras, cases, NavBar, ChatWidget, Contact, Testimonials (componentes top-level ligados à estrutura do site)

---

## 4. Componentes e páginas

### `src/components/` — blocos da home

| Componente | Descrição |
|---|---|
| `HeroSection.vue` | Hero principal: dot-grid, cursor-glow (desktop), design-tokens "flutuantes", eyebrow com localização animada, título, CTAs. |
| `AboutSection.vue` | Seção "Sobre" (#sobre) em 2 colunas: bio em PT/EN à esquerda, elementos visuais à direita. |
| `BrandsSection.vue` | Faixa de marcas/clientes com grain overlay. |
| `ProjectsSection.vue` | Grid de projetos em destaque (#projetos). |
| `ProcessSection.vue` | Etapas do método de design (#processo). |
| `PfButton.vue` | Botão do design system. Props: `variant` (`'solid'` \| `'ghost'`), `href`, `target`. Renderiza `<a>` se `href` presente. |
| `FigmaMockup.vue` | Mockup decorativo da janela do Figma (chrome + dots + tool icons), `aria-hidden`. |

Todos recebem `theme` e `lang` como props (padrão do projeto).

### `secoes/` — páginas, navbar, cases

| Arquivo | Descrição |
|---|---|
| `NavBar.vue` | Navbar global com logo, links i18n e controles de tema/idioma (`v-model:lang`, `v-model:theme`). |
| `ChatWidget.vue` | FAB flutuante com foto + chat panel. Renderizado em TODAS as rotas pelo App.vue. |
| `ContactSection.vue` | Seção de contato (#contato). Importa `PfButton` de `src/components/`. |
| `TestimonialsSection.vue` | Seção de recomendações (#recomendacoes) com link externo para LinkedIn. |
| `ProjectsPage.vue` | Página `/projetos` — lista completa de cases com cover images. |
| `StoryPage.vue` | Página `/historia` — narrativa pessoal. Importa `PfButton`. |
| `CVPage.vue` | Página `/cv` — currículo online. |
| `NV8Case.vue` | Case NV8 — slug `/projetos/nv8` |
| `RodobensCase.vue` | Case Rodobens — slug `/projetos/rodobens` |
| `MasterGloboCase.vue` | Case Master Globo — slug `/projetos/master-globo` |
| `LancomeCase.vue` | Case Lancôme — slug `/projetos/lancome-brazil` |
| `YSLCase.vue` | Case YSL — slug `/projetos/yves-saint-laurent` |

---

## 5. Roteamento e estado global

### Arquitetura de roteamento (⚠️ peculiar)

`src/router/index.js` registra 5 rotas, **todas apontando para `App.vue`**:

```js
{ path: '/',               component: () => import('../App.vue') },
{ path: '/historia',       component: () => import('../App.vue') },
{ path: '/projetos',       component: () => import('../App.vue') },
{ path: '/projetos/:slug', component: () => import('../App.vue') },
{ path: '/cv',             component: () => import('../App.vue') },
```

`App.vue` faz **switch manual** por `v-if`/`v-else-if` sobre `route.path` e `route.params.slug` para renderizar a página certa.

**Implicação:** os `() => import(...)` NÃO geram code-splitting efetivo porque todas as rotas carregam o mesmo componente. O bundle inclui todas as páginas e cases. Listado como dívida técnica (§8).

### Estado global (em `App.vue`)
- `theme` — ref, default `'light'`
- `lang` — ref, default `'EN'` (sobrescrito por `?lang=` na URL)
- `showBtt` — ref, controla botão back-to-top (aparece a 30% de scroll no mobile, 65% no desktop)

Esses valores são passados como props/`v-model` para NavBar, páginas, seções e cases.

### i18n
Manual: cada componente tem um objeto `locales = { PT: {...}, EN: {...} }` e um `computed` que seleciona pela prop `lang`. **Não há biblioteca de i18n** (sem vue-i18n, sem extração de chaves).

---

## 6. Design System

### Fonte canônica
**`src/assets/main.css`** — único arquivo CSS global, importado em `src/main.js`. Contém tokens, reset, keyframes e decorações.

### Tokens

**Accent (único):**
```
--accent          : #F0185A
--accent-glow     : rgba(240, 24, 90, 0.12)
--accent-soft     : rgba(240, 24, 90, 0.4)
```

**Typography:**
```
--font-display    : 'Clash Display', sans-serif
--font-body       : 'DM Sans', sans-serif
```

**Easing:**
```
--ease-expo       : cubic-bezier(0.16, 1, 0.3, 1)
```

**Spacing scale (base 4px):**
`--sp-1` 4 · `--sp-2` 8 · `--sp-3` 12 · `--sp-4` 16 · `--sp-5` 20 · `--sp-6` 24 · `--sp-8` 32 · `--sp-10` 40 · `--sp-12` 48 · `--sp-16` 64 · `--sp-20` 80 · `--sp-24` 96

**Radius:** `--radius-none: 0` · `--radius-sm: 4px` · `--radius-full: 9999px`

### Temas

| Token | `.theme-dark` | `.theme-light` (default) |
|---|---|---|
| `--bg` | `#070711` | `#F5F3FF` |
| `--fg` | `#F0EFF8` | `#0D0C1A` |
| `--fg-muted` | `#6B6A82` | `#62607A` |
| `--fg-faint` | `#22213A` | `#D2CFEA` |
| `--border` | `rgba(255,255,255,0.07)` | `rgba(0,0,0,0.08)` |
| `--ghost-border` | `rgba(255,255,255,0.11)` | `rgba(13,12,26,0.12)` |
| `--btn-fill` | `#070711` | `#F5F3FF` |
| `--grain-opacity` | `0.04` | `0.025` |
| `--glass-bg` | `rgba(7,7,17,0.55)` | `rgba(245,243,255,0.72)` |
| `--glass-border` | `rgba(255,255,255,0.08)` | `rgba(13,12,26,0.1)` |
| `--glass-shadow` | `rgba(0,0,0,0.4)` | `rgba(13,12,26,0.1)` |
| `--glass-highlight` | `rgba(255,255,255,0.05)` | `rgba(255,255,255,0.6)` |

### Keyframes globais
- `pf-up` — entrada com fade + translate + blur→clean
- `pf-spin-ring` — rotação contínua (botões)
- `pf-pulse` — dot pulse
- `pf-scroll-pulse` — scroll indicator

### Decorações globais
- `.pf-grain` — overlay de ruído SVG fractal (opacity via `--grain-opacity`)
- `.pf-glow` — radial gradient com `--accent-glow` no canto superior direito
- `::selection` — pink accent 25%

### Referência visual
`design-system.html` na raiz — página HTML estática com showcase dos tokens, botões e componentes. Não é parte do build.

---

## 7. Convenções de código

- **Composition API com `<script setup>`** em todos os `.vue`
- **Props padrão** para componentes do site: `theme: 'light'|'dark'`, `lang: 'PT'|'EN'`
- **i18n inline** por componente (objeto `locales` + `computed`)
- **CSS** dentro do `.vue` (não-scoped no App.vue, scoped nos demais)
- **Namespacing de classes** por prefixo curto por componente (ex.: `.pf-`, `.ab-`, `.ps-`, `.ct-`, `.tm-`, `.nv-`, `.pp-`, `.sp-`, `.cw-`, `.fm-`, `.brands-`, `.projects-`)
- **Comentários em PT** são aceitos e comuns
- **Respiro entre seções**: `margin-top: var(--sp-24)` em `.brands-root`, `.projects-root`, `.ab-root`, `.ps-root` (definido no App.vue)

---

## 8. Dívida técnica conhecida

Itens catalogados durante auditoria (2026-04-17). Não resolvidos nesta passada.

1. **Roteamento "fake"** — todas as rotas do `vue-router` resolvem para `App.vue`, que faz switch por `v-if`. Não há code-splitting real. Migrar para `<router-view>` com rotas declarativas por componente desbloqueia lazy-loading por rota e simplifica o `App.vue`.

2. **`add-lazy-loading.ps1` e `.sh` quebrados** — referenciam `src\seções\...` (caminho que nunca existiu; os arquivos estavam em `seções/` na raiz e agora em `secoes/`). São scripts de única execução que já rodaram. Decidir: apagar ou atualizar.

3. **`secoes/` contém HTML previews estáticos** (`navbar.html`, `cv.html`, `projects.html`, `*-preview.html`, `case-master-globo.html`, `lancome-case.html`, `ysl-case.html`) que não fazem parte do build. Provavelmente prototipação antes de virar `.vue`. Considerar mover para `design-refs/` ou `.prototypes/` fora de `secoes/` para reduzir ruído.

4. **`secoes/markdowns website/`** — notas internas incluindo `CLAUDE.md`. OK manter, mas fora do pattern do resto da pasta.

5. **Assets de alto peso na raiz** — `LOGO grande.png` (~5KB ok) e `LinkedIn cover - 1.jpg` (220KB) e `favicon.png` (138KB — muito grande para favicon, reduzir ou usar apenas `public/favicon.svg` que já existe).

6. **Sem testes, sem lint, sem formatter**. Adicionar ESLint + Prettier ajudaria consistência (comentário de style.css removido sugere que já houve limpeza prévia).

7. **i18n caseiro duplicado** — cada componente repete o padrão `locales = { PT, EN }`. Um `useI18n()` composable centralizado com `lang` injetado (via `provide`/`inject` ou Pinia) reduziria boilerplate e evitaria prop-drilling.

8. **Pasta com acento já corrigida** (era `seções/`, agora `secoes/`) — confirmar que o deploy Vercel reflete isso. Ver §10.

---

## 9. Fluxo de trabalho

### Rodando local
```bash
npm install
npm run dev       # http://localhost:5173 (default Vite)
```

### Build e preview
```bash
npm run build
npm run preview
```

### Deploy
Automático via Vercel no push para `main` (branch principal). `vercel.json` define fallback SPA (para que rotas como `/historia` funcionem no refresh).

### Estrutura de commits
Ver `git log`. Padrão recente usa prefixos tipo `feat:`, `fix:`, `site updates:`. Não há conventional-commits estrito.

---

## 10. Decisões e limpezas recentes (2026-04-17)

Durante auditoria desta data foi feita uma limpeza estrutural:

- **Pasta `seções/` renomeada para `secoes/`** (sem acento) — evita problemas em ambientes case-sensitive / non-UTF8 (CI, alguns servidores). Commit preserva histórico via `git mv`.
- **Removidos duplicados** — `secoes/AboutSection.vue`, `secoes/BrandsSection.vue`, `secoes/ProjectsSection.vue`, `secoes/ProcessSection.vue` (versões canônicas ficaram em `src/components/`, que é o que o `App.vue` já importava).
- **Removidos arquivos órfãos:**
  - `src/style.css` (vazio, só comentário)
  - `src/assets/tokens.css` (tokens duplicados de `main.css`, não importado)
  - `src/assets/base.css` (reset duplicado de `main.css`, não importado)
  - `src/components/HelloWorld.vue` (boilerplate original do Vite)
- **Imports atualizados em `src/App.vue`** para apontar para `secoes/`.

Verificação pós-limpeza: `grep` por referências a arquivos removidos retornou apenas texto em português ("seções" = "sections") e o script `.ps1` já quebrado listado em §8.

---

## 11. Links úteis

- **LinkedIn:** https://www.linkedin.com/in/taynaschultz/
- **Cases** no site: `/projetos/{nv8,rodobens,master-globo,lancome-brazil,yves-saint-laurent}`
- **Fonts:**
  - Clash Display — https://www.fontshare.com/fonts/clash-display
  - DM Sans — Google Fonts
