#!/bin/bash
# ─── ADD LAZY LOADING ─────────────────────────────────────────────────────────
# Coloca na raiz do projeto e roda: bash add-lazy-loading.sh

echo "Adicionando lazy loading..."

# ─── LancomeCase.vue ──────────────────────────────────────────────────────────
FILE=$(find src -name "LancomeCase.vue" 2>/dev/null | head -1)
if [ -f "$FILE" ]; then
  sed -i 's/alt="User flow diagram — Guest and Promoter journeys" \/>/alt="User flow diagram — Guest and Promoter journeys" loading="lazy" \/>/g' "$FILE"
  sed -i 's/alt="Wireframes — low and high fidelity" class="lc-photo"/alt="Wireframes — low and high fidelity" loading="lazy" class="lc-photo"/g' "$FILE"
  sed -i 's/alt="Final UI — guest and promoter screens" class="lc-photo"/alt="Final UI — guest and promoter screens" loading="lazy" class="lc-photo"/g' "$FILE"
  echo "  OK  LancomeCase.vue"
else
  echo "  --  LancomeCase.vue não encontrado"
fi

# ─── YSLCase.vue ──────────────────────────────────────────────────────────────
FILE=$(find src -name "YSLCase.vue" 2>/dev/null | head -1)
if [ -f "$FILE" ]; then
  sed -i 's/:alt="t\.altCaptacao"   class="ysl-photo ysl-photo--full"/:alt="t.altCaptacao"   loading="lazy" class="ysl-photo ysl-photo--full"/g' "$FILE"
  sed -i 's/:alt="t\.altDesktop"    class="ysl-photo"/:alt="t.altDesktop"    loading="lazy" class="ysl-photo"/g' "$FILE"
  sed -i 's/:alt="t\.altMobile"     class="ysl-photo"/:alt="t.altMobile"     loading="lazy" class="ysl-photo"/g' "$FILE"
  sed -i 's/alt="YSL Libre — Dua Lipa campaign" \/>/alt="YSL Libre — Dua Lipa campaign" loading="lazy" \/>/g' "$FILE"
  sed -i 's/alt="YSL E-commerce Brazil launch" \/>/alt="YSL E-commerce Brazil launch" loading="lazy" \/>/g' "$FILE"
  echo "  OK  YSLCase.vue"
else
  echo "  --  YSLCase.vue não encontrado"
fi

# ─── ProjectsPage.vue ─────────────────────────────────────────────────────────
FILE=$(find src -name "ProjectsPage.vue" 2>/dev/null | head -1)
if [ -f "$FILE" ]; then
  sed -i 's/class="card-thumb-img" alt=""/class="card-thumb-img" loading="lazy" alt=""/g' "$FILE"
  echo "  OK  ProjectsPage.vue"
else
  echo "  --  ProjectsPage.vue não encontrado"
fi

# ─── ProjectsSection.vue ──────────────────────────────────────────────────────
FILE=$(find src -name "ProjectsSection.vue" 2>/dev/null | head -1)
if [ -f "$FILE" ]; then
  sed -i 's/class="card-img-photo" alt=""/class="card-img-photo" loading="lazy" alt=""/g' "$FILE"
  echo "  OK  ProjectsSection.vue"
else
  echo "  --  ProjectsSection.vue não encontrado"
fi

# ─── AboutSection.vue ─────────────────────────────────────────────────────────
FILE=$(find src -name "AboutSection.vue" 2>/dev/null | head -1)
if [ -f "$FILE" ]; then
  sed -i 's/<img$/<img loading="lazy"/g' "$FILE"
  echo "  OK  AboutSection.vue"
else
  echo "  --  AboutSection.vue não encontrado"
fi

echo ""
echo "Pronto! Testa no browser: F12 > Network > Img"
