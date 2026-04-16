<template>
  <figure class="fm-root" :class="{ 'fm-root--light': theme === 'light' }" aria-hidden="true" role="presentation">

    <!-- ── Chrome ─────────────────────────────────────────── -->
    <div class="fm-chrome">
      <div class="fm-dots">
        <span class="fm-dot fm-dot--r"></span>
        <span class="fm-dot fm-dot--y"></span>
        <span class="fm-dot fm-dot--g"></span>
      </div>
      <div class="fm-tools">
        <svg class="fm-tool fm-tool--on" width="12" height="12" viewBox="0 0 12 12">
          <path d="M2 1.5 L11 7 L6.8 7.7 L4.8 12.5 Z" fill="currentColor"/>
        </svg>
        <svg class="fm-tool" width="12" height="12" viewBox="0 0 12 12" fill="none" stroke="currentColor" stroke-width="1.2">
          <rect x="1.5" y="1.5" width="9" height="9"/>
        </svg>
        <svg class="fm-tool" width="12" height="12" viewBox="0 0 12 12" fill="currentColor">
          <rect x="1" y="2" width="10" height="1.4"/>
          <rect x="4.8" y="3.4" width="2.4" height="7"/>
        </svg>
        <svg class="fm-tool" width="12" height="12" viewBox="0 0 12 12" fill="none" stroke="currentColor" stroke-width="1.2">
          <circle cx="6" cy="4" r="1.5"/>
          <path d="M6 5.5 V10 M4 10 H8"/>
        </svg>
      </div>
      <span class="fm-filename">portfolio.fig</span>
      <div class="fm-collab">
        <span class="fm-avatar">TS</span>
      </div>
    </div>

    <!-- ── Canvas ─────────────────────────────────────────── -->
    <div class="fm-canvas">
      <span class="fm-frame-lbl">Card / Hero</span>

      <div class="fm-frame">

        <div class="fm-el-head">
          Making websites<br><em>win</em>
          <div class="fm-sel fm-sel--h">
            <b class="fm-hnd fm-hnd--tl"></b>
            <b class="fm-hnd fm-hnd--tr"></b>
            <b class="fm-hnd fm-hnd--bl"></b>
            <b class="fm-hnd fm-hnd--br"></b>
          </div>
        </div>

        <p class="fm-el-sub">UX Designer · Global</p>
        <div class="fm-el-rule"></div>

        <div class="fm-el-btn">
          Talk with the expert
          <div class="fm-sel fm-sel--b">
            <b class="fm-hnd fm-hnd--tl"></b>
            <b class="fm-hnd fm-hnd--tr"></b>
            <b class="fm-hnd fm-hnd--bl"></b>
            <b class="fm-hnd fm-hnd--br"></b>
          </div>
        </div>

      </div>

      <div class="fm-tip fm-tip--h">Text / Display</div>
      <div class="fm-tip fm-tip--b">Component / CTA</div>

      <svg class="fm-cursor" width="15" height="19" viewBox="0 0 15 19">
        <path d="M1.5 1.5 L13.5 8.5 L7.8 9.5 L5.2 16.5 Z"
              fill="white" stroke="#111" stroke-width="1.3" stroke-linejoin="round"/>
      </svg>
    </div>

  </figure>
</template>

<script setup>
defineProps({
  theme: { type: String, default: 'light' },
})
</script>

<style scoped>
@import url('https://api.fontshare.com/v2/css?f[]=clash-display@400,500,600,700&display=swap');

/* ════════════════════════════════════════════════════════════
   BASE (mobile — 280px)
   ════════════════════════════════════════════════════════════ */

.fm-root {
  width           : 280px;
  border          : 1px solid rgba(255, 255, 255, 0.09);
  background      : rgba(10, 10, 20, 0.92);
  backdrop-filter : blur(20px);
  -webkit-backdrop-filter: blur(20px);
  box-shadow      :
    0 0 0 1px rgba(240, 24, 90, 0.07),
    0 32px 80px rgba(0, 0, 0, 0.7),
    0 4px 20px rgba(0, 0, 0, 0.45);
  overflow        : hidden;
  user-select     : none;
  -webkit-user-select: none;
  flex-shrink     : 0;
}

/* Chrome */
.fm-chrome {
  display       : flex;
  align-items   : center;
  gap           : 0.55rem;
  height        : 30px;
  padding       : 0 10px;
  background    : rgba(255, 255, 255, 0.025);
  border-bottom : 1px solid rgba(255, 255, 255, 0.06);
}
.fm-dots  { display: flex; gap: 5px; flex-shrink: 0; }
.fm-dot   { width: 8px; height: 8px; border-radius: 50%; flex-shrink: 0; }
.fm-dot--r { background: #FF5F57; }
.fm-dot--y { background: #FEBC2E; }
.fm-dot--g { background: #28C840; }
.fm-tools  { display: flex; align-items: center; gap: 5px; flex-shrink: 0; }
.fm-tool   { display: block; color: rgba(255, 255, 255, 0.28); flex-shrink: 0; }
.fm-tool--on { color: rgba(255, 255, 255, 0.72); }
.fm-filename {
  flex: 1; text-align: center;
  font-size: 0.5rem; font-weight: 400; letter-spacing: 0.04em;
  color: rgba(255,255,255,0.32); white-space: nowrap;
}
.fm-collab { margin-left: auto; }
.fm-avatar {
  display: flex; align-items: center; justify-content: center;
  width: 18px; height: 18px; border-radius: 50%;
  background: #F0185A; font-size: 0.38rem; font-weight: 700;
  color: white; letter-spacing: 0.02em;
}

/* Canvas */
.fm-canvas {
  position  : relative;
  height    : 182px;
  background: rgba(0, 0, 0, 0.25);
  overflow  : hidden;
}
.fm-frame-lbl {
  position: absolute; top: 6px; left: 22px;
  font-size: 0.4rem; font-weight: 500; letter-spacing: 0.07em;
  text-transform: uppercase; color: rgba(255,255,255,0.2);
  pointer-events: none; z-index: 2;
}

/* Frame */
.fm-frame {
  position: absolute;
  top: 16px; left: 20px;
  width: 240px; height: 152px;
  border: 1px solid rgba(255, 255, 255, 0.1);
  background: rgba(255, 255, 255, 0.018);
  padding: 14px;
  display: flex; flex-direction: column; gap: 6px;
}

/* Heading */
.fm-el-head {
  position: relative;
  font-family: 'Clash Display', sans-serif;
  font-weight: 700; font-size: 14px;
  letter-spacing: -0.02em; line-height: 1.2; color: #F0EFF8;
}
.fm-el-head em { font-style: italic; color: #F0185A; }

/* Sub */
.fm-el-sub { font-size: 7px; font-weight: 400; color: #6B6A82; line-height: 1.4; }

/* Rule */
.fm-el-rule {
  height: 1px;
  background: linear-gradient(90deg, rgba(240,24,90,0.45) 0%, transparent 65%);
  margin: 1px 0;
}

/* Button */
.fm-el-btn {
  position: relative;
  display: inline-flex; align-items: center; justify-content: center;
  align-self: flex-start;
  background: #F0185A; color: white;
  font-size: 6px; font-weight: 600; letter-spacing: 0.1em;
  text-transform: uppercase; padding: 5px 10px; white-space: nowrap;
}

/* Selection */
.fm-sel {
  position: absolute; inset: -2px;
  border: 1.5px solid #F0185A; pointer-events: none; opacity: 0;
}
.fm-sel--h { animation: fm-sel-h  9s ease-in-out infinite; }
.fm-sel--b { animation: fm-sel-b  9s ease-in-out infinite; }

.fm-hnd {
  position: absolute; width: 5px; height: 5px;
  background: white; border: 1.5px solid #F0185A; border-radius: 1px;
}
.fm-hnd--tl { top: -3px;    left: -3px;  }
.fm-hnd--tr { top: -3px;    right: -3px; }
.fm-hnd--bl { bottom: -3px; left: -3px;  }
.fm-hnd--br { bottom: -3px; right: -3px; }

/* Tooltips */
.fm-tip {
  position: absolute;
  background: #F0185A; color: white;
  font-size: 0.38rem; font-weight: 600; letter-spacing: 0.08em;
  text-transform: uppercase; padding: 2px 6px;
  white-space: nowrap; opacity: 0; pointer-events: none; z-index: 6;
}
.fm-tip--h { top: 10px; left: 20px; animation: fm-tip-h 9s ease-in-out infinite; }
.fm-tip--b { top: 84px; left: 20px; animation: fm-tip-b 9s ease-in-out infinite; }

/* Cursor */
.fm-cursor {
  position: absolute; top: 22px; left: 16px;
  z-index: 10; pointer-events: none;
  animation: fm-cursor 9s ease-in-out infinite;
  filter: drop-shadow(0 1px 4px rgba(0,0,0,0.65));
}

/* ── Mobile keyframes ──────────────────────────────────── */
@keyframes fm-cursor {
  0%,  36% { transform: translate(0, 0); }
  44%      { transform: translate(0, 64px); }
  72%      { transform: translate(0, 64px); }
  80%      { transform: translate(202px, 126px); }
  90%      { transform: translate(202px, 126px); }
  100%     { transform: translate(0, 0); }
}
@keyframes fm-sel-h {
  0%  { opacity: 0; }  7%  { opacity: 1; }
  34% { opacity: 1; }  41% { opacity: 0; }  100% { opacity: 0; }
}
@keyframes fm-sel-b {
  0%  { opacity: 0; }  47% { opacity: 0; }  52% { opacity: 1; }
  70% { opacity: 1; }  77% { opacity: 0; }  100% { opacity: 0; }
}
@keyframes fm-tip-h {
  0%  { opacity: 0; }  10% { opacity: 1; }
  31% { opacity: 1; }  38% { opacity: 0; }  100% { opacity: 0; }
}
@keyframes fm-tip-b {
  0%  { opacity: 0; }  55% { opacity: 0; }  59% { opacity: 1; }
  68% { opacity: 1; }  75% { opacity: 0; }  100% { opacity: 0; }
}

/* ════════════════════════════════════════════════════════════
   DESKTOP (1280px+) — native larger dimensions
   ════════════════════════════════════════════════════════════ */
@media (min-width: 1280px) {

  .fm-root   { width: 420px; }
  .fm-chrome { height: 36px; padding: 0 14px; gap: 0.75rem; }
  .fm-dot    { width: 10px; height: 10px; }
  .fm-tools  { gap: 7px; }
  .fm-tool   { width: 14px; height: 14px; }
  .fm-filename { font-size: 0.58rem; }
  .fm-avatar { width: 22px; height: 22px; font-size: 0.45rem; }

  .fm-canvas    { height: 268px; }
  .fm-frame-lbl { top: 8px; left: 28px; font-size: 0.48rem; }

  .fm-frame {
    top: 22px; left: 26px;
    width: 368px; height: 230px;
    padding: 18px; gap: 8px;
  }

  .fm-el-head  { font-size: 21px; }
  .fm-el-sub   { font-size: 9.5px; }
  .fm-el-btn   { font-size: 8px; padding: 7px 14px; }

  .fm-hnd { width: 7px; height: 7px; }
  .fm-hnd--tl { top: -4px;    left: -4px;  }
  .fm-hnd--tr { top: -4px;    right: -4px; }
  .fm-hnd--bl { bottom: -4px; left: -4px;  }
  .fm-hnd--br { bottom: -4px; right: -4px; }

  .fm-tip      { font-size: 0.48rem; padding: 3px 8px; }
  .fm-tip--h   { top: 14px; left: 26px; }
  .fm-tip--b   { top: 116px; left: 26px; }

  .fm-cursor   { top: 30px; left: 20px; width: 20px; height: 25px;
                 animation-name: fm-cursor-lg; }
  .fm-sel--h   { animation-name: fm-sel-h-lg; }
  .fm-sel--b   { animation-name: fm-sel-b-lg; }
  .fm-tip--h   { animation-name: fm-tip-h-lg; }
  .fm-tip--b   { animation-name: fm-tip-b-lg; }
}

/* ── Desktop keyframes (larger pixel values) ─────────────── */
@keyframes fm-cursor-lg {
  0%,  36% { transform: translate(0, 0); }
  44%      { transform: translate(0, 88px); }
  72%      { transform: translate(0, 88px); }
  80%      { transform: translate(316px, 190px); }
  90%      { transform: translate(316px, 190px); }
  100%     { transform: translate(0, 0); }
}
@keyframes fm-sel-h-lg {
  0%  { opacity: 0; }  7%  { opacity: 1; }
  34% { opacity: 1; }  41% { opacity: 0; }  100% { opacity: 0; }
}
@keyframes fm-sel-b-lg {
  0%  { opacity: 0; }  47% { opacity: 0; }  52% { opacity: 1; }
  70% { opacity: 1; }  77% { opacity: 0; }  100% { opacity: 0; }
}
@keyframes fm-tip-h-lg {
  0%  { opacity: 0; }  10% { opacity: 1; }
  31% { opacity: 1; }  38% { opacity: 0; }  100% { opacity: 0; }
}
@keyframes fm-tip-b-lg {
  0%  { opacity: 0; }  55% { opacity: 0; }  59% { opacity: 1; }
  68% { opacity: 1; }  75% { opacity: 0; }  100% { opacity: 0; }
}

/* Reduced motion */
@media (prefers-reduced-motion: reduce) {
  .fm-cursor,
  .fm-sel--h, .fm-sel--b,
  .fm-tip--h, .fm-tip--b { animation: none; }
  .fm-sel--h { opacity: 0.4; }
}

/* ── Light mode ─────────────────────────────────────────────── */
.fm-root--light {
  background  : rgba(248, 247, 255, 0.97);
  border-color: rgba(0, 0, 0, 0.10);
  box-shadow  :
    0 0 0 1px rgba(240, 24, 90, 0.06),
    0 32px 80px rgba(0, 0, 0, 0.12),
    0 4px 20px rgba(0, 0, 0, 0.06);
}
.fm-root--light .fm-chrome {
  background   : rgba(0, 0, 0, 0.03);
  border-bottom: 1px solid rgba(0, 0, 0, 0.07);
}
.fm-root--light .fm-tool     { color: rgba(0, 0, 0, 0.30); }
.fm-root--light .fm-tool--on { color: rgba(0, 0, 0, 0.65); }
.fm-root--light .fm-filename { color: rgba(0, 0, 0, 0.38); }
.fm-root--light .fm-canvas   { background: rgba(0, 0, 0, 0.05); }
.fm-root--light .fm-frame-lbl{ color: rgba(0, 0, 0, 0.28); }
.fm-root--light .fm-frame {
  border-color: rgba(0, 0, 0, 0.10);
  background  : rgba(255, 255, 255, 0.85);
}
.fm-root--light .fm-el-head  { color: #0D0C1A; }
.fm-root--light .fm-cursor path {
  fill  : #1e1e2e;
  stroke: rgba(255, 255, 255, 0.65);
}
</style>
