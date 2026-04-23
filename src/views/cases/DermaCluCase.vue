<template>
  <article class="case-page" :class="theme === 'light' ? 'theme-light' : 'theme-dark'">

    <!-- Grain overlay -->
    <div class="grain" aria-hidden="true"></div>

    <!-- ── HERO ──────────────────────────────────────────────── -->
    <header class="case-hero">
      <div class="case-wrap">
        <div class="case-eyebrow">
          <span class="pf-dot" aria-hidden="true"></span>
          <span>L'Oréal Group · DermaClub · VTEX</span>
        </div>

        <h1 class="case-title">
          Checkout<br />
          <em>A/B Test</em>
        </h1>

        <p class="case-subtitle">
          Redesigning a broken checkout experience through heatmap-driven insights —
          and shipping a variant that lifted revenue by&nbsp;+7.1%.
        </p>

        <div class="case-meta-row">
          <div class="case-meta-item">
            <span class="case-meta-label">Role</span>
            <span class="case-meta-value">UX Designer</span>
          </div>
          <div class="case-meta-divider" aria-hidden="true"></div>
          <div class="case-meta-item">
            <span class="case-meta-label">Platform</span>
            <span class="case-meta-value">VTEX Commerce</span>
          </div>
          <div class="case-meta-divider" aria-hidden="true"></div>
          <div class="case-meta-item">
            <span class="case-meta-label">Scope</span>
            <span class="case-meta-value">Research · UX · UI</span>
          </div>
        </div>
      </div>
    </header>

    <!-- ── RESULTS BANNER ────────────────────────────────────── -->
    <section class="results-band" aria-label="Key results">
      <div class="case-wrap">
        <div class="results-grid">
          <div class="result-item">
            <span class="result-num">+7.10%</span>
            <span class="result-label">Revenue</span>
          </div>
          <div class="result-divider" aria-hidden="true"></div>
          <div class="result-item">
            <span class="result-num">+5.71%</span>
            <span class="result-label">Conversion Rate</span>
          </div>
          <div class="result-divider" aria-hidden="true"></div>
          <div class="result-item">
            <span class="result-num">+3.93%</span>
            <span class="result-label">Checkout CTR</span>
          </div>
        </div>
      </div>
    </section>

    <!-- ── CONTEXT ────────────────────────────────────────────── -->
    <section class="case-section">
      <div class="case-wrap case-wrap--narrow">
        <div class="section-label" aria-hidden="true">01 · Context</div>
        <h2 class="section-heading">The&nbsp;problem with&nbsp;VTEX checkout</h2>
        <p class="section-body">
          DermaClub is L'Oréal Group's dermocosmetics loyalty brand in Brazil, operating on VTEX — a
          platform that gives designers limited control over the checkout flow. Despite that constraint,
          heatmap and clickmap data made it undeniable: the existing checkout was fragmenting users'
          attention at exactly the wrong moment, causing drop-off before the final purchase confirmation.
        </p>
        <p class="section-body">
          The hypothesis was straightforward — fix the broken elements, reorganize the information
          hierarchy, and align the visual language with the brand guide. Then let the test decide.
        </p>
      </div>
    </section>

    <!-- ── BEFORE / AFTER ────────────────────────────────────── -->
    <section class="case-section">
      <div class="case-wrap">
        <div class="section-label" aria-hidden="true">02 · Before &amp; After</div>
        <h2 class="section-heading case-wrap--narrow" style="max-width:none">
          Side by side
        </h2>

        <div class="ba-grid">
          <!-- BEFORE -->
          <div class="ba-col">
            <div class="ba-badge ba-badge--before">Before</div>
            <div class="ba-image-wrap">
              <img
                :src="imgBefore"
                alt="DermaClub checkout before the redesign: broken layout, low contrast, loyalty points and order summary scattered at the bottom of the page"
                class="ba-image"
                loading="lazy"
              />
            </div>
            <ul class="ba-issues" aria-label="Issues identified">
              <li>Broken layout elements across desktop &amp; mobile</li>
              <li>Poor contrast between brand pink and orange tones</li>
              <li>Loyalty point info grouped at completion step — wrong moment</li>
              <li>Coupon, discount, and total scattered at page bottom</li>
              <li>On mobile: elements overflowed the grid, CTA buried below fold, non-clickable breadcrumb receiving significant tap traffic</li>
            </ul>
          </div>

          <!-- AFTER -->
          <div class="ba-col">
            <div class="ba-badge ba-badge--after">After</div>
            <div class="ba-image-wrap">
              <img
                :src="imgAfter"
                alt="DermaClub checkout after the redesign: light background, reorganized order summary, rounded boxes with brand-compliant contrast colors, free shipping highlighted"
                class="ba-image"
                loading="lazy"
              />
            </div>
            <ul class="ba-issues ba-issues--after" aria-label="Improvements shipped">
              <li>Light background improves readability at a high-stakes decision moment</li>
              <li>Loyalty info simplified and repositioned — progressive disclosure in action</li>
              <li>Rounded edges &amp; brand-correct contrast colors restore visual hierarchy</li>
              <li>Consistent styling across cart items despite platform grouping constraints</li>
              <li>Free shipping surfaced prominently — a proven conversion lever</li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <!-- ── DESIGN DECISIONS ──────────────────────────────────── -->
    <section class="case-section case-section--alt">
      <div class="case-wrap">
        <div class="section-label" aria-hidden="true">03 · Design Decisions</div>
        <h2 class="section-heading case-wrap--narrow" style="max-width:none">
          Every change had a reason
        </h2>

        <div class="decisions-grid">
          <div
            v-for="(d, i) in decisions"
            :key="i"
            class="decision-card"
            :style="`--anim-delay: ${i * 0.07}s`"
          >
            <div class="decision-num" aria-hidden="true">{{ String(i + 1).padStart(2, '0') }}</div>
            <h3 class="decision-title">{{ d.title }}</h3>
            <p class="decision-body">{{ d.body }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- ── MOBILE PROBLEMS ───────────────────────────────────── -->
    <section class="case-section">
      <div class="case-wrap case-wrap--narrow">
        <div class="section-label" aria-hidden="true">04 · Mobile-Specific Issues</div>
        <h2 class="section-heading">Mobile was a different beast</h2>
        <p class="section-body">
          The desktop issues were significant, but mobile had its own layer of problems that heatmap
          analysis made impossible to ignore.
        </p>
        <div class="mobile-issues-list">
          <div v-for="(m, i) in mobileIssues" :key="i" class="mobile-issue">
            <span class="mobile-issue-marker" aria-hidden="true"></span>
            <p>{{ m }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- ── RESULTS ───────────────────────────────────────────── -->
    <section class="case-section case-section--alt">
      <div class="case-wrap case-wrap--narrow">
        <div class="section-label" aria-hidden="true">05 · Results</div>
        <h2 class="section-heading">The test won</h2>
        <p class="section-body">
          The redesigned variant was tested against the original in a controlled A/B experiment.
          All three primary metrics improved — validating the hypothesis that clarity, hierarchy, and
          brand consistency directly drive conversion in high-stakes checkout flows.
        </p>

        <div class="results-cards">
          <div v-for="(r, i) in results" :key="i" class="result-card">
            <span class="result-card-num">{{ r.num }}</span>
            <span class="result-card-label">{{ r.label }}</span>
            <p class="result-card-desc">{{ r.desc }}</p>
          </div>
        </div>

        <p class="section-body" style="margin-top: 2.5rem;">
          Within the constraints of the VTEX platform — which limits the degree of checkout
          customisation available to designers — these gains demonstrate that well-reasoned
          UX improvements, grounded in real behavioral data, move the needle even when you
          can't fully control the canvas.
        </p>
      </div>
    </section>

    <!-- ── LEARNINGS ─────────────────────────────────────────── -->
    <section class="case-section">
      <div class="case-wrap case-wrap--narrow">
        <div class="section-label" aria-hidden="true">06 · Learnings</div>
        <h2 class="section-heading">What I took from this</h2>
        <p class="section-body">
          Platform constraints are not an excuse — they're a design brief. Working within VTEX's
          limited checkout customization options forced me to be precise: every change had to count,
          and every decision needed to be justifiable by data, not aesthetics alone. The discipline
          of working with heatmaps and clickmaps as primary research artifacts also reinforced how
          much behavioral evidence already exists in running products — before you run a single
          interview or write a single survey.
        </p>
      </div>
    </section>

    <!-- ── NAV FOOTER ────────────────────────────────────────── -->
    <nav class="case-footer-nav" aria-label="Case study navigation">
      <div class="case-wrap">
        <div class="case-footer-nav-inner">
          <router-link to="/work" class="case-nav-link case-nav-link--back">
            <span class="case-nav-arr" aria-hidden="true">←</span>
            All work
          </router-link>
          <router-link to="/work/lancome" class="case-nav-link case-nav-link--next">
            Next case
            <span class="case-nav-arr" aria-hidden="true">→</span>
          </router-link>
        </div>
      </div>
    </nav>

  </article>
</template>

<script setup>
import imgBefore from '../../../imagens cases/dermaclub/checkout before.avif'
import imgAfter  from '../../../imagens cases/dermaclub/checkout after.avif'

const props = defineProps({
  lang:  { type: String, default: 'en' },
  theme: { type: String, default: 'dark' }
})

const decisions = [
  {
    title: 'Light background for a cleaner reading environment',
    body: 'A lighter surface reduces eye strain and strips away visual noise at the most critical decision-making step. Users need focus, not stimulation, right before they commit to a purchase.'
  },
  {
    title: 'Progressive disclosure for loyalty points',
    body: "Centering and minimizing the scoring block respects a core UX principle: show information when it's contextually useful, not just because it exists. Loyalty data during order confirmation competes with the CTA for attention it shouldn't have."
  },
  {
    title: 'Rounded edges and brand-correct contrast colors',
    body: 'Aligning with the official brand guide resolved both accessibility and identity issues simultaneously. Softer box edges reduced perceived interaction cost; corrected contrast values ensured WCAG compliance and clearer visual hierarchy.'
  },
  {
    title: 'Visual unity despite platform grouping constraints',
    body: "VTEX prevented us from grouping product samples into a single container. We compensated through consistent styling — matching spacing, backgrounds, typography, and interaction states — so the interface felt intentional, not fragmented."
  },
  {
    title: 'Free shipping made unmissable',
    body: "Free shipping is one of the strongest known drivers of checkout completion. We elevated its visual prominence so it delivers its positive reinforcement precisely where cart abandonment risk peaks."
  },
  {
    title: 'ZIP code editing after selection',
    body: "Removing the need to restart the checkout flow to correct an address reduces a significant friction point. This aligns with Nielsen's error prevention and recovery heuristics — users should always feel in control."
  },
  {
    title: 'Consistent box alignment',
    body: 'Predictable layout rhythm reduces cognitive effort during scanning. When boxes align, users can process cart details faster — the interface stops being an obstacle and becomes a guide.'
  }
]

const mobileIssues = [
  'Elements overflowed the grid and broke the layout on small screens.',
  'Button hierarchy was flat — primary CTA did not stand out visually.',
  'No scrollbar indicators left users unaware that content continued below the fold.',
  'Heatmap data showed significant tap volume on the breadcrumb at the top — a non-interactive element — indicating user confusion about navigation and progress.'
]

const results = [
  {
    num: '+7.10%',
    label: 'Revenue',
    desc: 'The cleaner hierarchy and reduced friction at checkout drove measurable uplift in overall revenue during the test window.'
  },
  {
    num: '+5.71%',
    label: 'Conversion Rate',
    desc: 'More users who entered the checkout flow completed their purchase — a direct reflection of reduced cognitive load and fewer layout obstacles.'
  },
  {
    num: '+3.93%',
    label: 'Checkout CTR',
    desc: 'More users clicked through to initiate checkout from the cart, suggesting the improved cart UI also built confidence earlier in the funnel.'
  }
]
</script>

<style scoped>
/* ── TOKENS (local) ───────────────────────────────────────── */
.case-page {
  --accent:        #F0185A;
  --accent-glow:   rgba(240, 24, 90, .12);
  --accent-soft:   rgba(240, 24, 90, .4);
  --font-display:  'Clash Display', sans-serif;
  --font-body:     'DM Sans', sans-serif;
  --ease-expo:     cubic-bezier(.16, 1, .3, 1);

  position: relative;
  overflow-x: hidden;
  font-family: var(--font-body);
  -webkit-font-smoothing: antialiased;
}

.theme-dark {
  --bg:           #070711;
  --fg:           #F0EFF8;
  --fg-muted:     #6B6A82;
  --fg-faint:     #22213A;
  --border:       rgba(255, 255, 255, .07);
  --ghost-border: rgba(255, 255, 255, .11);
  --alt-bg:       #0C0C1A;
}
.theme-light {
  --bg:           #F5F3FF;
  --fg:           #0D0C1A;
  --fg-muted:     #62607A;
  --fg-faint:     #D2CFEA;
  --border:       rgba(0, 0, 0, .08);
  --ghost-border: rgba(13, 12, 26, .12);
  --alt-bg:       #EDEAF8;
}

/* ── BASE ────────────────────────────────────────────────── */
.case-page { background: var(--bg); color: var(--fg); }

.grain {
  position: fixed;
  inset: 0;
  pointer-events: none;
  z-index: 1;
  opacity: .04;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)'/%3E%3C/svg%3E");
  background-size: 180px 180px;
}

.case-wrap {
  position: relative;
  z-index: 2;
  max-width: 1120px;
  margin: 0 auto;
  padding-left: clamp(1.5rem, 7vw, 7rem);
  padding-right: clamp(1.5rem, 7vw, 7rem);
}
.case-wrap--narrow { max-width: 680px; }

/* ── HERO ────────────────────────────────────────────────── */
.case-hero {
  padding: clamp(7rem, 14vw, 11rem) 0 clamp(4rem, 7vw, 6rem);
  position: relative;
  z-index: 2;
}

.case-eyebrow {
  display: flex;
  align-items: center;
  gap: .5rem;
  font-size: .6rem;
  font-weight: 500;
  letter-spacing: .16em;
  text-transform: uppercase;
  color: var(--fg-muted);
  margin-bottom: 2rem;
}

.pf-dot {
  display: inline-block;
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: var(--accent);
  flex-shrink: 0;
  animation: pulse 2.5s ease-in-out infinite;
}

.case-title {
  font-family: var(--font-display);
  font-weight: 700;
  font-size: clamp(3.2rem, 10vw, 7rem);
  line-height: .87;
  letter-spacing: -.025em;
  margin-bottom: 2rem;
}
.case-title em {
  font-style: italic;
  color: var(--accent);
}

.case-subtitle {
  font-size: clamp(.875rem, 2vw, 1.05rem);
  font-weight: 300;
  line-height: 1.8;
  color: var(--fg-muted);
  max-width: 52ch;
  margin-bottom: 3rem;
}

.case-meta-row {
  display: flex;
  align-items: center;
  gap: 2rem;
  flex-wrap: wrap;
}
.case-meta-item { display: flex; flex-direction: column; gap: .3rem; }
.case-meta-label {
  font-size: .5rem;
  font-weight: 500;
  letter-spacing: .14em;
  text-transform: uppercase;
  color: var(--fg-muted);
}
.case-meta-value {
  font-family: var(--font-display);
  font-size: .8rem;
  font-weight: 600;
  letter-spacing: .04em;
  color: var(--fg);
}
.case-meta-divider {
  width: 1px;
  height: 32px;
  background: var(--border);
}

/* ── RESULTS BAND ────────────────────────────────────────── */
.results-band {
  position: relative;
  z-index: 2;
  border-top: 1px solid var(--border);
  border-bottom: 1px solid var(--border);
  padding: 2.5rem 0;
  overflow: hidden;
}
.results-band::before {
  content: '';
  position: absolute;
  inset: 0;
  background: var(--accent-glow);
}
.results-grid {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 3rem;
  flex-wrap: wrap;
}
.result-item { display: flex; flex-direction: column; align-items: center; gap: .4rem; }
.result-num {
  font-family: var(--font-display);
  font-size: clamp(2rem, 5vw, 3rem);
  font-weight: 700;
  color: var(--accent);
  line-height: 1;
}
.result-label {
  font-size: .55rem;
  font-weight: 500;
  letter-spacing: .14em;
  text-transform: uppercase;
  color: var(--fg-muted);
}
.result-divider {
  width: 1px;
  height: 48px;
  background: var(--border);
}

/* ── SECTIONS ────────────────────────────────────────────── */
.case-section { padding: clamp(4rem, 8vw, 7rem) 0; position: relative; z-index: 2; }
.case-section--alt { background: var(--alt-bg); }
.case-section--alt::before {
  content: '';
  position: absolute;
  inset: 0;
  border-top: 1px solid var(--border);
  border-bottom: 1px solid var(--border);
  pointer-events: none;
}

.section-label {
  font-size: .55rem;
  font-weight: 500;
  letter-spacing: .18em;
  text-transform: uppercase;
  color: var(--accent);
  margin-bottom: 1.25rem;
  display: flex;
  align-items: center;
  gap: .5rem;
}
.section-label::before {
  content: '';
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background: var(--accent);
  animation: pulse 2.5s ease-in-out infinite;
}

.section-heading {
  font-family: var(--font-display);
  font-weight: 600;
  font-size: clamp(1.4rem, 4vw, 2.4rem);
  line-height: 1.15;
  letter-spacing: -.01em;
  margin-bottom: 1.5rem;
}

.section-body {
  font-size: clamp(.875rem, 2vw, .975rem);
  font-weight: 300;
  line-height: 1.85;
  color: var(--fg-muted);
  max-width: 62ch;
  margin-bottom: 1.25rem;
}
.section-body:last-child { margin-bottom: 0; }

/* ── BEFORE / AFTER ──────────────────────────────────────── */
.ba-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2px;
  margin-top: 2.5rem;
  border: 1px solid var(--border);
}
@media (max-width: 768px) {
  .ba-grid { grid-template-columns: 1fr; }
}

.ba-col { display: flex; flex-direction: column; }
.ba-col:first-child { border-right: 1px solid var(--border); }

@media (max-width: 768px) {
  .ba-col:first-child { border-right: none; border-bottom: 1px solid var(--border); }
}

.ba-badge {
  display: inline-block;
  font-size: .5rem;
  font-weight: 500;
  letter-spacing: .14em;
  text-transform: uppercase;
  padding: .5rem 1rem;
  border-bottom: 1px solid var(--border);
}
.ba-badge--before { color: var(--fg-muted); background: transparent; }
.ba-badge--after  { color: #fff; background: var(--accent); border-color: var(--accent); }

.ba-image-wrap {
  overflow: hidden;
  background: var(--fg-faint);
  border-bottom: 1px solid var(--border);
  aspect-ratio: 3 / 4;
}
.ba-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: top;
  display: block;
  transition: transform .6s var(--ease-expo);
}
.ba-image-wrap:hover .ba-image { transform: scale(1.02); }

.ba-issues {
  list-style: none;
  padding: 1.5rem;
  margin: 0;
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: .75rem;
}
.ba-issues li {
  font-size: .8rem;
  font-weight: 300;
  line-height: 1.6;
  color: var(--fg-muted);
  padding-left: 1rem;
  position: relative;
}
.ba-issues li::before {
  content: '—';
  position: absolute;
  left: 0;
  color: var(--fg-faint);
}
.ba-issues--after li { color: var(--fg); }
.ba-issues--after li::before { color: var(--accent); content: '+'; }

/* ── DECISIONS GRID ──────────────────────────────────────── */
.decisions-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 1px;
  margin-top: 2.5rem;
  border: 1px solid var(--border);
}

.decision-card {
  padding: 2rem 1.75rem;
  border-right: 1px solid var(--border);
  border-bottom: 1px solid var(--border);
  transition: background .2s ease;
}
.decision-card:hover { background: var(--accent-glow); }

.decision-num {
  font-family: var(--font-display);
  font-size: .7rem;
  font-weight: 700;
  color: var(--accent);
  letter-spacing: .08em;
  margin-bottom: 1rem;
}

.decision-title {
  font-family: var(--font-display);
  font-size: .95rem;
  font-weight: 600;
  line-height: 1.3;
  margin-bottom: .75rem;
  color: var(--fg);
}

.decision-body {
  font-size: .8rem;
  font-weight: 300;
  line-height: 1.75;
  color: var(--fg-muted);
}

/* ── MOBILE ISSUES ───────────────────────────────────────── */
.mobile-issues-list {
  display: flex;
  flex-direction: column;
  gap: 1rem;
  margin-top: 2rem;
}
.mobile-issue {
  display: flex;
  gap: 1rem;
  align-items: flex-start;
}
.mobile-issue-marker {
  flex-shrink: 0;
  width: 1px;
  height: 1.4rem;
  background: var(--accent);
  margin-top: .1rem;
}
.mobile-issue p {
  font-size: .875rem;
  font-weight: 300;
  line-height: 1.75;
  color: var(--fg-muted);
  margin: 0;
}

/* ── RESULTS CARDS ───────────────────────────────────────── */
.results-cards {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1px;
  margin-top: 2.5rem;
  border: 1px solid var(--border);
}
@media (max-width: 640px) {
  .results-cards { grid-template-columns: 1fr; }
}

.result-card {
  padding: 2rem 1.5rem;
  border-right: 1px solid var(--border);
  display: flex;
  flex-direction: column;
  gap: .5rem;
}
.result-card:last-child { border-right: none; }

.result-card-num {
  font-family: var(--font-display);
  font-size: clamp(1.8rem, 4vw, 2.5rem);
  font-weight: 700;
  color: var(--accent);
  line-height: 1;
}
.result-card-label {
  font-size: .55rem;
  font-weight: 500;
  letter-spacing: .14em;
  text-transform: uppercase;
  color: var(--fg);
}
.result-card-desc {
  font-size: .78rem;
  font-weight: 300;
  line-height: 1.7;
  color: var(--fg-muted);
  margin: .5rem 0 0;
}

/* ── FOOTER NAV ──────────────────────────────────────────── */
.case-footer-nav {
  border-top: 1px solid var(--border);
  padding: 2.5rem 0;
  position: relative;
  z-index: 2;
}
.case-footer-nav-inner {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.case-nav-link {
  display: flex;
  align-items: center;
  gap: .75rem;
  font-size: .6rem;
  font-weight: 500;
  letter-spacing: .14em;
  text-transform: uppercase;
  color: var(--fg-muted);
  text-decoration: none;
  transition: color .2s ease;
}
.case-nav-link:hover { color: var(--accent); }
.case-nav-arr { font-size: 1rem; transition: transform .2s ease; }
.case-nav-link--back:hover .case-nav-arr { transform: translateX(-4px); }
.case-nav-link--next:hover .case-nav-arr { transform: translateX(4px); }

/* ── ANIMATIONS ──────────────────────────────────────────── */
@keyframes pulse {
  0%, 100% { opacity: 1; transform: scale(1); }
  50%       { opacity: .4; transform: scale(.8); }
}

/* ── RESPONSIVE ──────────────────────────────────────────── */
@media (max-width: 640px) {
  .case-meta-row { gap: 1rem; }
  .case-meta-divider { display: none; }
  .results-grid { gap: 1.5rem; }
  .result-divider { display: none; }
  .decisions-grid { grid-template-columns: 1fr; }
}
</style>
