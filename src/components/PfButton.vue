<template>
  <component
    :is="href ? 'a' : 'button'"
    :class="['pf-btn', `pf-btn--${variant}`]"
    :href="href || undefined"
    :target="href ? target : undefined"
    :rel="href && target === '_blank' ? 'noopener noreferrer' : undefined"
  >
    <span class="pf-ring"  aria-hidden="true"></span>
    <span class="pf-veil"  aria-hidden="true"></span>
    <span class="pf-core"  aria-hidden="true"></span>
    <span class="pf-btn-lbl">
      <slot />
    </span>
  </component>
</template>

<script setup>
defineProps({
  variant: {
    type    : String,
    default : 'solid',
    validator: (v) => ['solid', 'ghost'].includes(v),
  },
  href   : { type: String,  default: null },
  target : { type: String,  default: '_self' },
})
</script>

<style scoped>
/* ── Base do botão ──────────────────────────────────────── */
.pf-btn {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  height: 50px;
  padding: 0 1.75rem;
  overflow: hidden;
  outline: none;
  transition: transform 0.15s ease;
  width: 100%;
  max-width: 300px;
  border-radius: 0;
}
.pf-btn:active { transform: scale(0.97); }

/* ── Spinning border (conic-gradient) ───────────────────── */
.pf-ring {
  position: absolute;
  inset: -100%;
  animation: pf-spin-ring 3s linear infinite;
  opacity: 0;
  transition: opacity 0.4s ease;
  pointer-events: none;
}
.pf-btn:hover .pf-ring { opacity: 1; }

/* Véu estático — borda padrão (some no hover) */
.pf-veil {
  position: absolute;
  inset: 0;
  transition: opacity 0.4s ease;
  pointer-events: none;
}
.pf-btn:hover .pf-veil { opacity: 0; }

/* Recorte interno (1px) */
.pf-core {
  position: absolute;
  inset: 1px;
  z-index: 1;
  pointer-events: none;
}

/* Label */
.pf-btn-lbl {
  position: relative;
  z-index: 2;
  font-size: 0.63rem;
  font-weight: 500;
  letter-spacing: 0.14em;
  text-transform: uppercase;
  transition: color 0.2s;
}

/* ── Solid (primary) ────────────────────────────────────── */
.pf-btn--solid .pf-ring {
  background: conic-gradient(from 90deg at 50% 50%, transparent 0%, transparent 75%, rgba(255,255,255,0.85) 100%);
}
.pf-btn--solid .pf-veil  { background: var(--accent); }
.pf-btn--solid .pf-core  { background: var(--accent); }
.pf-btn--solid .pf-btn-lbl { color: #fff; }

/* ── Ghost (secondary) ──────────────────────────────────── */
.pf-btn--ghost .pf-ring {
  background: conic-gradient(from 90deg at 50% 50%, transparent 0%, transparent 75%, var(--accent) 100%);
}
.pf-btn--ghost .pf-veil  { background: var(--ghost-border); }
.pf-btn--ghost .pf-core  { background: var(--btn-fill); }
.pf-btn--ghost .pf-btn-lbl { color: var(--fg); }

/* ── Responsivo ─────────────────────────────────────────── */
@media (min-width: 640px) {
  .pf-btn {
    width: auto;
    min-width: 175px;
    max-width: none;
  }
}
</style>
