<template>
  <div class="cw-root">
    <!-- FAB trigger -->
    <button
      class="cw-fab"
      :class="{ 'cw-fab--open': isOpen }"
      @click="toggleChat"
      aria-label="Chat with Tayná"
    >
      <div class="cw-fab-dot" aria-hidden="true" />
      <img
        v-if="photo"
        :src="photo"
        alt="Tayná"
        class="cw-fab-photo"
      />
      <svg v-else class="cw-fab-icon cw-fab-icon--msg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/>
      </svg>
      <svg class="cw-fab-icon cw-fab-icon--close" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/>
      </svg>
    </button>

    <!-- Chat card -->
    <Transition name="cw-card">
      <div v-if="isOpen" class="cw-card" role="dialog" aria-label="Chat with Tayná.ai">

        <!-- Header -->
        <div class="cw-header">
          <!-- Back / reset — only after a topic is selected -->
          <button
            v-if="mode === 'done'"
            class="cw-back-btn"
            @click="resetChat"
            aria-label="Back to menu"
            title="Back to menu"
          >
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <polyline points="15 18 9 12 15 6"/>
            </svg>
          </button>
          <div class="cw-avatar">
            <img v-if="photo" :src="photo" alt="Tayná" />
            <div v-else class="cw-avatar-fallback">T</div>
            <div class="cw-avatar-dot" aria-hidden="true" />
          </div>
          <div class="cw-header-info">
            <div class="cw-header-name">Tayná.ai</div>
            <div class="cw-header-sub">Digital extension · online</div>
          </div>
        </div>

        <!-- Messages -->
        <div class="cw-body" ref="bodyRef">
          <TransitionGroup name="cw-bubble" tag="div" class="cw-messages">
            <div
              v-for="msg in messages"
              :key="msg.id"
              class="cw-bubble"
              :class="{ 'cw-bubble--user': msg.role === 'user', 'cw-bubble--typing': msg.typing }"
            >
              <template v-if="msg.typing">
                <div class="cw-dots">
                  <span /><span /><span />
                </div>
              </template>
              <template v-else>
                <span v-html="formatText(msg.content)" />
              </template>
            </div>
          </TransitionGroup>
        </div>

        <!-- Quick buttons (initial state) -->
        <template v-if="mode === 'quick'">
          <div class="cw-rule" aria-hidden="true" />
          <div class="cw-quick">
            <button
              v-for="btn in quickButtons"
              :key="btn.id"
              class="cw-qbtn"
              @click="askQuick(btn)"
            >
              <div class="cw-qbtn-icon" aria-hidden="true">
                <component :is="btn.icon" />
              </div>
              {{ btn.label }}
              <span class="cw-qbtn-arr" aria-hidden="true">→</span>
            </button>
          </div>
          <div class="cw-footer-projects">
            <a href="/projetos" class="cw-projects-btn">See all projects →</a>
          </div>
        </template>

        <!-- Post-interaction footer -->
        <template v-else>
          <div class="cw-footer-cta">
            <a href="/projetos" class="cw-projects-btn cw-projects-btn--full">See all projects →</a>
            Have another question? →
            <a href="mailto:tayna.schultz@gmail.com" class="cw-footer-link">tayna.schultz@gmail.com</a>
          </div>
        </template>

      </div>
    </Transition>
  </div>
</template>

<script setup>
import { ref, nextTick, h } from 'vue'

// ─── Props ───────────────────────────────────────────────────────
defineProps({
  photo: { type: String, default: '' }
})

// ─── State ───────────────────────────────────────────────────────
const isOpen  = ref(false)
const mode    = ref('quick')
const messages = ref([
  {
    id: 'welcome',
    role: 'assistant',
    content: "Hello! I'm **Tayná Schultz's** digital extension.\nHow can I expedite your analysis today?"
  }
])
const bodyRef = ref(null)
let   msgId   = 0

// ─── Hardcoded responses ──────────────────────────────────────────
const RESPONSES = {
  cases: `Here are a few cases I brought to life:\n\n**Rodobens Unica** — Transformed a 7-year-old internal leasing & credit system for one of Brazil's largest automotive finance groups. Mapped flows for 600+ users, documented business rules from scratch, and delivered high-fidelity navigable screens — all in 7 months.\n\n**NV8 Website** — Full redesign of identity, architecture and stack. From static HTML to Vue.js with a custom design system and 6 product pages — shipped in 1 week with AI. → <a href="/cases/nv8" class="cw-inline-link">View case</a>\n\n**Master Globo** — UX Research and results dashboard for product shipping, translating complex data into a decision-ready interface for the team.\n\n**Lancôme Brazil** — Sensorial experience blending the physical and digital worlds for a brand activation campaign.`,

  ai: `I use AI to accelerate every phase of the design process — research, ideation, prototyping, coding, and QA.\n\nThe approach isn't one-size-fits-all: I combine tools and strategies based on what each project actually needs. Sometimes that means AI-assisted discovery synthesis, sometimes it's generating and iterating on code directly in the browser.`,

  experience: `I work as a freelance UX Designer, currently contracted through **NV8 Tecnologia** — where I've led the Rodobens Unica platform redesign and the full modernization of NV8's own website, coding everything with Claude.\n\nPreviously I've worked with **L'Oréal Group** brands (YSL Beauty Brazil, Lancôme) on campaign activations and e-commerce UX.\n\nWant to see the NV8 I designed and shipped? → <a href="/cases/nv8" class="cw-internal-link">View case study</a>`,

  academic: `Bachelor's degree in **Journalism** from Pontifícia Universidade Católica do Rio Grande do Sul (PUCRS), 2019.\n\nTwo specializations in **UX/Product Design**, plus 5+ courses and certifications across design, business, and data analysis.\n\nThe journalism background isn't a detour — it's what makes me sharp at storytelling, research, and translating complex information into something people actually want to read.`,

  talk: `I'd love to connect.\n\nDrop me a line at **tayna.schultz@gmail.com** — whether it's a project, a contract, or just a conversation about design.\n\nI'm open to international remote opportunities: freelance, part-time, or full-time.`
}

// ─── Quick buttons ────────────────────────────────────────────────
const IconTrend = () => h('svg', { viewBox: '0 0 24 24', fill: 'none', stroke: 'currentColor', 'stroke-width': 2, 'stroke-linecap': 'round', 'stroke-linejoin': 'round' }, [
  h('polyline', { points: '22 7 13.5 15.5 8.5 10.5 2 17' }),
  h('polyline', { points: '16 7 22 7 22 13' })
])
const IconAI = () => h('svg', { viewBox: '0 0 24 24', fill: 'none', stroke: 'currentColor', 'stroke-width': 2, 'stroke-linecap': 'round', 'stroke-linejoin': 'round' }, [
  h('circle', { cx: 12, cy: 12, r: 3 }),
  h('path', { d: 'M12 1v4M12 19v4M4.22 4.22l2.83 2.83M16.95 16.95l2.83 2.83M1 12h4M19 12h4M4.22 19.78l2.83-2.83M16.95 7.05l2.83-2.83' })
])
const IconBag = () => h('svg', { viewBox: '0 0 24 24', fill: 'none', stroke: 'currentColor', 'stroke-width': 2, 'stroke-linecap': 'round', 'stroke-linejoin': 'round' }, [
  h('rect', { x: 2, y: 7, width: 20, height: 14, rx: 2 }),
  h('path', { d: 'M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2' })
])
const IconGrad = () => h('svg', { viewBox: '0 0 24 24', fill: 'none', stroke: 'currentColor', 'stroke-width': 2, 'stroke-linecap': 'round', 'stroke-linejoin': 'round' }, [
  h('path', { d: 'M22 10v6M2 10l10-5 10 5-10 5z' }),
  h('path', { d: 'M6 12v5c0 1.66 4 3 6 3s6-1.34 6-3v-5' })
])
const IconMail = () => h('svg', { viewBox: '0 0 24 24', fill: 'none', stroke: 'currentColor', 'stroke-width': 2, 'stroke-linecap': 'round', 'stroke-linejoin': 'round' }, [
  h('path', { d: 'M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z' }),
  h('polyline', { points: '22,6 12,13 2,6' })
])

const quickButtons = [
  { id: 'cases',      label: 'Cases I brought to life',  icon: IconTrend, responseKey: 'cases'      },
  { id: 'ai',         label: 'AI in workflow',            icon: IconAI,    responseKey: 'ai'         },
  { id: 'experience', label: 'Professional experience',  icon: IconBag,   responseKey: 'experience' },
  { id: 'academic',   label: 'Academic curriculum',      icon: IconGrad,  responseKey: 'academic'   },
  { id: 'talk',       label: 'Schedule a talk',          icon: IconMail,  responseKey: 'talk'       }
]

// ─── Helpers ─────────────────────────────────────────────────────
function formatText (text) {
  return text
    .replace(/\*\*(.*?)\*\*/g, '<em>$1</em>')
    .replace(/\n/g, '<br>')
}

async function scrollBottom () {
  await nextTick()
  if (bodyRef.value) bodyRef.value.scrollTop = bodyRef.value.scrollHeight
}

function addMsg (role, content, typing = false) {
  const id = `msg-${++msgId}`
  messages.value.push({ id, role, content, typing })
  scrollBottom()
  return id
}

function removeMsg (id) {
  const idx = messages.value.findIndex(m => m.id === id)
  if (idx !== -1) messages.value.splice(idx, 1)
}

// ─── Chat logic ───────────────────────────────────────────────────
function toggleChat () {
  isOpen.value = !isOpen.value
}

function resetChat () {
  mode.value = 'quick'
  messages.value = [{
    id: 'welcome',
    role: 'assistant',
    content: "Hello! I'm **Tayná Schultz's** digital extension.\nHow can I expedite your analysis today?"
  }]
  msgId = 0
}

async function askQuick (btn) {
  addMsg('user', btn.label)

  const typingId = addMsg('assistant', '', true)
  await new Promise(r => setTimeout(r, 700))
  removeMsg(typingId)

  addMsg('assistant', RESPONSES[btn.responseKey])
  mode.value = 'done'

  // Scroll to the START of the response bubble, not the bottom.
  // setTimeout(0) is a macrotask — runs after scrollBottom's nextTick microtask.
  setTimeout(() => {
    const bubbles = bodyRef.value?.querySelectorAll('.cw-bubble')
    if (bubbles?.length) {
      bubbles[bubbles.length - 1].scrollIntoView({ block: 'start', behavior: 'smooth' })
    }
  }, 0)
}
</script>

<style scoped>
/* ── Root & positioning ── */
.cw-root {
  position: fixed;
  bottom: 24px;
  right: 24px;
  z-index: 9999;
  font-family: 'DM Sans', sans-serif;
  -webkit-font-smoothing: antialiased;
}

/* ── FAB ── */
.cw-fab {
  position: relative;
  width: 56px;
  height: 56px;
  border-radius: 9999px;
  background: #F0185A;
  border: none;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  padding: 0;
  box-shadow: 0 4px 24px rgba(240, 24, 90, .35);
  transition: transform .2s cubic-bezier(.16,1,.3,1), box-shadow .2s ease;
  -webkit-tap-highlight-color: transparent;
}
.cw-fab:hover {
  transform: scale(1.08);
  box-shadow: 0 8px 32px rgba(240, 24, 90, .5);
}

.cw-fab-dot {
  position: absolute;
  top: 8px; right: 8px;
  width: 9px; height: 9px;
  border-radius: 50%;
  background: #2DCA73;
  border: 2px solid #F0185A;
  animation: cw-pulse 2.5s ease-in-out infinite;
  z-index: 3;
  transition: opacity .2s;
}
.cw-fab--open .cw-fab-dot { opacity: 0; pointer-events: none; }

.cw-fab-photo {
  width: 100%; height: 100%;
  object-fit: cover;
  object-position: center top;
  filter: grayscale(100%) contrast(1.1);
  display: block;
  transition: opacity .2s ease;
  position: absolute;
  inset: 0;
}
.cw-fab--open .cw-fab-photo { opacity: 0; }

.cw-fab-icon {
  width: 22px; height: 22px;
  color: #fff;
  position: relative; z-index: 2;
  transition: opacity .15s ease, transform .2s ease;
}
.cw-fab-icon--msg { opacity: 1; }
.cw-fab-icon--close { opacity: 0; position: absolute; transform: rotate(-90deg); }
.cw-fab--open .cw-fab-icon--msg  { opacity: 0; }
.cw-fab--open .cw-fab-icon--close { opacity: 1; transform: rotate(0deg); }

/* ── Card ── */
.cw-card {
  position: absolute;
  bottom: 68px;
  right: 0;
  width: 320px;
  background: #0D0C1E;
  border: 1px solid rgba(255,255,255,.09);
  border-radius: 24px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  max-height: 480px;
}

@media (max-width: 400px) {
  .cw-card {
    width: calc(100vw - 32px);
    right: -8px;
  }
}

/* Card transition */
.cw-card-enter-active { transition: opacity .3s ease, transform .4s cubic-bezier(.16,1,.3,1); }
.cw-card-leave-active { transition: opacity .2s ease, transform .25s ease; }
.cw-card-enter-from   { opacity: 0; transform: translateY(14px) scale(.97); }
.cw-card-leave-to     { opacity: 0; transform: translateY(8px) scale(.98); }

/* ── Header ── */
.cw-header {
  padding: 14px 16px 12px;
  border-bottom: 1px solid rgba(255,255,255,.06);
  display: flex;
  align-items: center;
  gap: 10px;
  flex-shrink: 0;
}

/* ── Back button ── */
.cw-back-btn {
  width: 28px;
  height: 28px;
  border-radius: 8px;
  background: rgba(255,255,255,.06);
  border: 1px solid rgba(255,255,255,.09);
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  color: #6B6A82;
  transition: background .2s, color .2s, border-color .2s;
  -webkit-tap-highlight-color: transparent;
}
.cw-back-btn:hover {
  background: rgba(240,24,90,.12);
  border-color: rgba(240,24,90,.35);
  color: #F0185A;
}
.cw-back-btn svg { width: 14px; height: 14px; }

.cw-avatar {
  width: 38px; height: 38px;
  border-radius: 9999px;
  overflow: hidden;
  flex-shrink: 0;
  position: relative;
  border: 1.5px solid rgba(240,24,90,.4);
}
.cw-avatar img {
  width: 100%; height: 100%;
  object-fit: cover;
  object-position: center top;
  filter: grayscale(100%) contrast(1.1);
  display: block;
}
.cw-avatar-fallback {
  width: 100%; height: 100%;
  display: flex; align-items: center; justify-content: center;
  background: #F0185A;
  font-family: 'Clash Display', sans-serif;
  font-weight: 700; font-size: 16px; color: #fff;
}
.cw-avatar-dot {
  position: absolute; bottom: 0; right: 0;
  width: 9px; height: 9px;
  border-radius: 50%;
  background: #2DCA73;
  border: 2px solid #0D0C1E;
}
.cw-header-name {
  font-family: 'Clash Display', sans-serif;
  font-size: 13px; font-weight: 600;
  color: #F0EFF8;
  letter-spacing: -.01em; line-height: 1;
}
.cw-header-sub {
  font-size: 10px; font-weight: 500;
  letter-spacing: .12em; text-transform: uppercase;
  color: #6B6A82; margin-top: 3px;
}

/* ── Body / messages ── */
.cw-body {
  flex: 1;
  overflow-y: auto;
  padding: 14px 14px 8px;
  scrollbar-width: thin;
  scrollbar-color: #22213A transparent;
}
.cw-messages {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

/* ── Bubbles ── */
.cw-bubble {
  max-width: 86%;
  padding: 10px 13px;
  border-radius: 18px 18px 18px 4px;
  font-size: 12.5px; font-weight: 300; line-height: 1.65;
  color: #F0EFF8;
  background: #22213A;
  border: 1px solid rgba(255,255,255,.06);
}
.cw-bubble--user {
  align-self: flex-end;
  margin-left: auto;
  background: rgba(240, 24, 90, .18);
  border-color: rgba(240, 24, 90, .25);
  border-radius: 18px 18px 4px 18px;
}

/* Bubble transition */
.cw-bubble-enter-active { transition: opacity .35s cubic-bezier(.16,1,.3,1), transform .35s cubic-bezier(.16,1,.3,1); }
.cw-bubble-enter-from   { opacity: 0; transform: translateY(8px); }

/* Inline em highlight (bold → accent) */
.cw-bubble :deep(em) { font-style: normal; color: #F0185A; font-weight: 500; }
.cw-bubble :deep(a)  { color: #F0185A; text-underline-offset: 2px; }

/* ── Typing dots ── */
.cw-dots {
  display: flex; gap: 4px; align-items: center;
  padding: 3px 2px;
}
.cw-dots span {
  width: 5px; height: 5px; border-radius: 50%;
  background: #6B6A82;
  animation: cw-dot-bounce 1.2s ease-in-out infinite;
}
.cw-dots span:nth-child(2) { animation-delay: .2s; }
.cw-dots span:nth-child(3) { animation-delay: .4s; }

/* ── Rule ── */
.cw-rule {
  height: 1px;
  background: linear-gradient(90deg, rgba(240,24,90,.4) 0%, transparent 65%);
  margin: 2px 14px 2px;
  flex-shrink: 0;
}

/* ── Quick buttons ── */
.cw-quick {
  padding: 8px 14px 14px;
  display: flex; flex-direction: column; gap: 5px;
  flex-shrink: 0;
}
.cw-qbtn {
  display: flex; align-items: center; gap: 10px;
  padding: 9px 13px;
  background: transparent;
  border: 1px solid rgba(255,255,255,.09);
  border-radius: 10px;
  cursor: pointer;
  font-family: 'DM Sans', sans-serif;
  font-size: 11px; font-weight: 500; letter-spacing: .05em;
  color: #F0EFF8;
  text-align: left; width: 100%;
  transition: border-color .2s, background .2s, transform .15s;
  -webkit-tap-highlight-color: transparent;
}
.cw-qbtn:hover {
  border-color: rgba(240,24,90,.4);
  background: rgba(240,24,90,.12);
  transform: translateX(2px);
}
.cw-qbtn:active { transform: scale(.98); }

.cw-qbtn-icon {
  width: 26px; height: 26px;
  border-radius: 7px;
  background: #22213A;
  display: flex; align-items: center; justify-content: center;
  flex-shrink: 0; transition: background .2s;
}
.cw-qbtn-icon :deep(svg) { width: 12px; height: 12px; color: #F0185A; }
.cw-qbtn:hover .cw-qbtn-icon { background: rgba(240,24,90,.18); }

.cw-qbtn-arr {
  margin-left: auto; color: #6B6A82; font-size: 12px;
  transition: transform .2s, color .2s;
}
.cw-qbtn:hover .cw-qbtn-arr { transform: translateX(3px); color: #F0185A; }

/* ── Projects button ── */
.cw-footer-projects {
  padding: 0 14px 12px;
  flex-shrink: 0;
}
.cw-projects-btn {
  display: block;
  width: 100%;
  padding: 9px 13px;
  background: rgba(240,24,90,.1);
  border: 1px solid rgba(240,24,90,.3);
  border-radius: 10px;
  color: #F0185A;
  font-family: 'DM Sans', sans-serif;
  font-size: 11px; font-weight: 600; letter-spacing: .06em;
  text-align: center;
  text-decoration: none;
  transition: background .2s, border-color .2s, transform .15s;
  -webkit-tap-highlight-color: transparent;
}
.cw-projects-btn:hover {
  background: rgba(240,24,90,.2);
  border-color: rgba(240,24,90,.55);
  transform: translateY(-1px);
}
.cw-projects-btn--full {
  display: block;
  margin-bottom: 10px;
}

/* ── Footer CTA ── */
.cw-footer-cta {
  padding: 12px 16px 14px;
  border-top: 1px solid rgba(255,255,255,.05);
  font-family: 'DM Sans', sans-serif;
  font-size: 11px; font-weight: 300;
  color: #6B6A82;
  flex-shrink: 0;
}
.cw-footer-link {
  color: #F0185A;
  text-decoration: none;
  font-weight: 500;
  transition: opacity .2s;
}
.cw-footer-link:hover { opacity: .75; }

/* ── Inline case link ── */
.cw-bubble :deep(.cw-inline-link) {
  color: #F0185A;
  text-decoration: underline;
  text-underline-offset: 2px;
  font-weight: 500;
}

/* ── Animations ── */
@keyframes cw-pulse {
  0%, 100% { opacity: 1; transform: scale(1); }
  50%       { opacity: .4; transform: scale(.7); }
}
@keyframes cw-dot-bounce {
  0%, 80%, 100% { transform: translateY(0); opacity: .4; }
  40%           { transform: translateY(-5px); opacity: 1; }
}
</style>
