import { ref, watch } from 'vue'

const VALID = ['PT', 'EN', 'ES', 'DE']

// Module-level ref — shared across every component that imports this
const lang = ref(
  VALID.includes(localStorage.getItem('pf-lang'))
    ? localStorage.getItem('pf-lang')
    : 'EN'
)

watch(lang, v => localStorage.setItem('pf-lang', v))

export function useLang() {
  return { lang }
}
