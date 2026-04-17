<template>
  <div :class="['pf-page', `theme-${theme}`]">

    <!-- Ambient -->
    <div class="pf-ambient" aria-hidden="true">
      <div class="pf-glow"></div>
      <div class="pf-glow-bl"></div>
      <div class="pf-grain"></div>
    </div>

    <!-- NavBar -->
    <NavBar v-model:lang="lang" v-model:theme="theme" />

    <!-- ═══ HERO ═══ -->
    <header class="cv-hero">
      <div>
        <div class="hero-eyebrow">
          <span class="pf-dot"></span>
          <span>{{ t.hero_eyebrow }}</span>
        </div>
        <h1 class="hero-name">TAY<em>NÁ</em><br>SCHULTZ</h1>
        <p class="hero-role">{{ t.hero_role }}</p>
        <div class="hero-contacts">
          <a class="hero-contact-item" href="mailto:tayna.schultz@gmail.com">
            <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
              <polyline points="22,6 12,13 2,6"/>
            </svg>
            tayna.schultz@gmail.com
          </a>
          <a class="hero-contact-item" href="tel:+5521998761604">
            <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07A19.5 19.5 0 013.07 8.81a19.79 19.79 0 01-3.07-8.63A2 2 0 012 0h3a2 2 0 012 1.72 12.84 12.84 0 00.7 2.81 2 2 0 01-.45 2.11L6.09 7.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45 12.84 12.84 0 002.81.7A2 2 0 0122 14v2.92z"/>
            </svg>
            +55 (21) 99876-1604
          </a>
          <a class="hero-contact-item" href="https://linkedin.com/in/taynaschultz" target="_blank" rel="noopener">
            <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <path d="M16 8a6 6 0 016 6v7h-4v-7a2 2 0 00-2-2 2 2 0 00-2 2v7h-4v-7a6 6 0 016-6z"/>
              <rect x="2" y="9" width="4" height="12"/>
              <circle cx="4" cy="4" r="2"/>
            </svg>
            linkedin.com/in/taynaschultz
          </a>
          <span class="hero-contact-item">
            <svg width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="12" cy="12" r="10"/>
              <line x1="2" y1="12" x2="22" y2="12"/>
              <path d="M12 2a15.3 15.3 0 014 10 15.3 15.3 0 01-4 10 15.3 15.3 0 01-4-10 15.3 15.3 0 014-10z"/>
            </svg>
            Brasil
          </span>
        </div>
        <div class="hero-rule"></div>
      </div>

      <div class="hero-meta">
        <div class="hero-stat">
          <div class="hero-stat-n">6+</div>
          <div class="hero-stat-t">{{ t.stat_exp }}</div>
        </div>
        <div class="hero-stat">
          <div class="hero-stat-n">4</div>
          <div class="hero-stat-t">{{ t.stat_lang }}</div>
        </div>
        <div class="hero-stat">
          <div class="hero-stat-n">B2</div>
          <div class="hero-stat-t">{{ t.stat_en }}</div>
        </div>
      </div>
    </header>

    <!-- ═══ CONTENT ═══ -->
    <div class="cv-content">

      <!-- ── MAIN COLUMN ── -->
      <div>

        <!-- OBJECTIVE -->
        <div class="cv-section cv-section--1">
          <div class="cv-section-label">{{ t.sec_objective }}</div>
          <div class="objective-box">
            <p class="objective-text">{{ t.obj_text }}</p>
          </div>
        </div>

        <!-- EXPERIENCE -->
        <div class="cv-section cv-section--2">
          <div class="cv-section-label">{{ t.sec_exp }}</div>

          <!-- NV8 -->
          <div class="exp-item">
            <div class="exp-header">
              <div class="exp-title">{{ lang === 'EN' ? 'Product Designer' : 'Product Designer Pleno' }}</div>
              <div class="exp-period">Sep 2025 — Mar 2026</div>
            </div>
            <div class="exp-company">
              NV8 <span class="exp-company-dot"></span>
              <span>{{ t.remote }}</span>
            </div>
            <div class="exp-desc">
              <p>{{ t.exp1_lead }}</p>
              <ul>
                <li>{{ t.exp1_1 }}</li>
                <li>{{ t.exp1_2 }}</li>
                <li>{{ t.exp1_3 }}</li>
              </ul>
            </div>
          </div>

          <!-- VML -->
          <div class="exp-item">
            <div class="exp-header">
              <div class="exp-title">{{ lang === 'EN' ? 'UX/UI Designer' : 'UX/UI Designer Pleno' }}</div>
              <div class="exp-period">Jul 2021 — Jun 2025</div>
            </div>
            <div class="exp-company">
              VML / Enext Company <span class="exp-company-dot"></span>
              <span>{{ t.remote }}</span>
            </div>
            <div class="exp-desc">
              <ul>
                <li>{{ t.exp2_1 }}</li>
                <li>{{ t.exp2_2 }}</li>
                <li>{{ t.exp2_3 }}</li>
                <li>{{ t.exp2_4 }}</li>
                <li>{{ t.exp2_5 }}</li>
              </ul>
            </div>
          </div>

          <!-- Ascendio -->
          <div class="exp-item">
            <div class="exp-header">
              <div class="exp-title">{{ t.exp3_title }}</div>
              <div class="exp-period">Jan 2016 — Jun 2021</div>
            </div>
            <div class="exp-company">
              Ascendio Comunicação <span class="exp-company-dot"></span>
              <span>{{ t.remote }}</span>
            </div>
            <div class="exp-desc">
              <ul>
                <li>{{ t.exp3_1 }}</li>
                <li>{{ t.exp3_2 }}</li>
                <li>{{ t.exp3_3 }}</li>
              </ul>
            </div>
          </div>
        </div>

        <!-- EDUCATION -->
        <div class="cv-section cv-section--3">
          <div class="cv-section-label">{{ t.sec_edu }}</div>

          <div class="edu-item">
            <div>
              <div class="edu-name">{{ t.edu1_name }}</div>
              <div class="edu-inst">UX Unicórnio</div>
            </div>
            <div class="edu-year">2023</div>
          </div>
          <div class="edu-item">
            <div>
              <div class="edu-name">{{ t.edu2_name }}</div>
              <div class="edu-inst">Unicesumar</div>
            </div>
            <div class="edu-year">2022</div>
          </div>
          <div class="edu-item">
            <div>
              <div class="edu-name">{{ t.edu3_name }}</div>
              <div class="edu-inst">UX Unicórnio</div>
            </div>
            <div class="edu-year">2021</div>
          </div>
          <div class="edu-item">
            <div>
              <div class="edu-name">{{ t.edu4_name }}</div>
              <div class="edu-inst">PUCRS</div>
            </div>
            <div class="edu-year">2019</div>
          </div>
        </div>

        <!-- CERTIFICATIONS -->
        <div class="cv-section cv-section--4">
          <div class="cv-section-label">{{ t.sec_cert }}</div>

          <div class="edu-item">
            <div><div class="edu-name">Interaction Design for Usability</div><div class="edu-inst">Interaction Design Foundation</div></div>
            <div class="edu-year">2026</div>
          </div>
          <div class="edu-item">
            <div><div class="edu-name">Vibe Code Design</div><div class="edu-inst">ASIMOV Academy</div></div>
            <div class="edu-year">2026</div>
          </div>
          <div class="edu-item">
            <div><div class="edu-name">{{ t.cert3_name }}</div><div class="edu-inst">TheStarter</div></div>
            <div class="edu-year">2025</div>
          </div>
          <div class="edu-item">
            <div><div class="edu-name">Google Analytics</div><div class="edu-inst">Google</div></div>
            <div class="edu-year">2025</div>
          </div>
          <div class="edu-item">
            <div><div class="edu-name">Motion Design Pro</div><div class="edu-inst">Udemy Academy</div></div>
            <div class="edu-year">2024</div>
          </div>
          <div class="edu-item">
            <div><div class="edu-name">Certification UX/UI and Product Design</div><div class="edu-inst">Udemy</div></div>
            <div class="edu-year">2023</div>
          </div>
          <div class="edu-item">
            <div><div class="edu-name">Adobe InDesign Pro</div><div class="edu-inst">Adobe</div></div>
            <div class="edu-year">2023</div>
          </div>
          <div class="edu-item">
            <div><div class="edu-name">Visual Communications</div><div class="edu-inst">Udemy</div></div>
            <div class="edu-year">2023</div>
          </div>
          <div class="edu-item">
            <div><div class="edu-name">Adobe XD Pro</div><div class="edu-inst">Adobe</div></div>
            <div class="edu-year">2022</div>
          </div>
          <div class="edu-item">
            <div><div class="edu-name">Microsoft Product Design &amp; UX</div><div class="edu-inst">Microsoft</div></div>
            <div class="edu-year">2020</div>
          </div>
        </div>

      </div><!-- /main col -->

      <!-- ── SIDEBAR ── -->
      <aside class="cv-sidebar">

        <!-- CONTACT -->
        <div class="sidebar-section sidebar-section--1">
          <div class="cv-section-label">{{ t.sec_contact }}</div>
          <div class="contact-item">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
              <polyline points="22,6 12,13 2,6"/>
            </svg>
            <div><div class="contact-label">Email</div>tayna.schultz@gmail.com</div>
          </div>
          <div class="contact-item">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07A19.5 19.5 0 013.07 8.81a19.79 19.79 0 01-3.07-8.63A2 2 0 012 0h3a2 2 0 012 1.72 12.84 12.84 0 00.7 2.81 2 2 0 01-.45 2.11L6.09 7.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45 12.84 12.84 0 002.81.7A2 2 0 0122 14v2.92z"/>
            </svg>
            <div><div class="contact-label">{{ t.contact_phone }}</div>+55 (21) 99876-1604</div>
          </div>
          <div class="contact-item">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <path d="M16 8a6 6 0 016 6v7h-4v-7a2 2 0 00-2-2 2 2 0 00-2 2v7h-4v-7a6 6 0 016-6z"/>
              <rect x="2" y="9" width="4" height="12"/>
              <circle cx="4" cy="4" r="2"/>
            </svg>
            <div><div class="contact-label">LinkedIn</div>taynaschultz</div>
          </div>
          <div class="contact-item">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/>
              <circle cx="12" cy="10" r="3"/>
            </svg>
            <div><div class="contact-label">{{ t.contact_location }}</div>Brasil</div>
          </div>
        </div>

        <!-- LANGUAGES -->
        <div class="sidebar-section sidebar-section--2">
          <div class="cv-section-label">{{ t.sec_languages }}</div>

          <div class="lang-item">
            <div class="lang-name">{{ t.lang_pt }}</div>
            <div class="lang-level-wrap">
              <div class="lang-level-label">C2 — {{ t.lang_native }}</div>
              <div class="lang-dots">
                <div class="lang-dot filled"></div><div class="lang-dot filled"></div>
                <div class="lang-dot filled"></div><div class="lang-dot filled"></div>
                <div class="lang-dot filled"></div>
              </div>
            </div>
          </div>
          <div class="lang-item">
            <div class="lang-name">{{ t.lang_en }}</div>
            <div class="lang-level-wrap">
              <div class="lang-level-label">B2 — {{ t.lang_bilingual }}</div>
              <div class="lang-dots">
                <div class="lang-dot filled"></div><div class="lang-dot filled"></div>
                <div class="lang-dot filled"></div><div class="lang-dot filled"></div>
                <div class="lang-dot"></div>
              </div>
            </div>
          </div>
          <div class="lang-item">
            <div class="lang-name">{{ t.lang_es }}</div>
            <div class="lang-level-wrap">
              <div class="lang-level-label">A1 — {{ t.lang_basic }}</div>
              <div class="lang-dots">
                <div class="lang-dot filled"></div><div class="lang-dot"></div>
                <div class="lang-dot"></div><div class="lang-dot"></div>
                <div class="lang-dot"></div>
              </div>
            </div>
          </div>
          <div class="lang-item">
            <div class="lang-name">{{ t.lang_de }}</div>
            <div class="lang-level-wrap">
              <div class="lang-level-label">A1 — {{ t.lang_basic }}</div>
              <div class="lang-dots">
                <div class="lang-dot filled"></div><div class="lang-dot"></div>
                <div class="lang-dot"></div><div class="lang-dot"></div>
                <div class="lang-dot"></div>
              </div>
            </div>
          </div>
        </div>

        <!-- SKILLS -->
        <div class="sidebar-section sidebar-section--3">
          <div class="cv-section-label">{{ t.sec_skills }}</div>

          <div class="skill-group">
            <div class="skill-group-label">{{ t.skill_tools }}</div>
            <div class="skill-list">
              <span class="skill-tag">Figma</span>
              <span class="skill-tag">Miro</span>
              <span class="skill-tag">Trello</span>
              <span class="skill-tag">JIRA</span>
              <span class="skill-tag">VTEX</span>
              <span class="skill-tag">Shopify</span>
              <span class="skill-tag">Claude Code</span>
              <span class="skill-tag">Antigravity</span>
              <span class="skill-tag">Lovable</span>
              <span class="skill-tag">Adobe XD</span>
              <span class="skill-tag">InDesign</span>
              <span class="skill-tag">Google Analytics</span>
            </div>
          </div>

          <div class="skill-group">
            <div class="skill-group-label">{{ t.skill_design }}</div>
            <div class="skill-list">
              <span class="skill-tag">UX Research</span>
              <span class="skill-tag">Wireframing</span>
              <span class="skill-tag">Prototyping</span>
              <span class="skill-tag">A/B Testing</span>
              <span class="skill-tag">Design System</span>
              <span class="skill-tag">Design Thinking</span>
              <span class="skill-tag">Design Sprints</span>
              <span class="skill-tag">Interaction Design</span>
              <span class="skill-tag">UI</span>
              <span class="skill-tag">UX Writing</span>
              <span class="skill-tag">Accessibility</span>
              <span class="skill-tag">Vibe Code</span>
              <span class="skill-tag">HTML</span>
            </div>
          </div>

          <div class="skill-group">
            <div class="skill-group-label">{{ t.skill_ai }}</div>
            <div class="skill-list">
              <span class="skill-tag">Claude</span>
              <span class="skill-tag">ChatGPT</span>
              <span class="skill-tag">Gemini</span>
              <span class="skill-tag">Generative AI</span>
            </div>
          </div>

          <div class="skill-group">
            <div class="skill-group-label">{{ t.skill_soft }}</div>
            <div class="skill-list">
              <span class="skill-tag">{{ t.soft1 }}</span>
              <span class="skill-tag">{{ t.soft2 }}</span>
              <span class="skill-tag">{{ t.soft3 }}</span>
              <span class="skill-tag">{{ t.soft4 }}</span>
            </div>
          </div>
        </div>

        <!-- ADDITIONAL -->
        <div class="sidebar-section sidebar-section--4">
          <div class="cv-section-label">{{ t.sec_extra }}</div>
          <div class="skill-list">
            <span class="skill-tag">Mercado Ads</span>
            <span class="skill-tag">Code QA</span>
            <span class="skill-tag">Motion Design</span>
            <span class="skill-tag">User-Centered Design</span>
            <span class="skill-tag">Automation</span>
          </div>
        </div>

      </aside>
    </div><!-- /cv-content -->

    <!-- ═══ DOWNLOAD CTA ═══ -->
    <section class="cv-download">
      <div class="download-box">
        <div class="download-left">
          <div class="download-eyebrow">
            <span class="pf-dot"></span>
            <span>{{ t.dl_eyebrow }}</span>
          </div>
          <h2 class="download-title">DOWN<em>LOAD</em><br>THE PDF</h2>
          <p class="download-desc">{{ t.dl_desc }}</p>
        </div>
        <button class="pf-btn pf-btn--dl" @click="printCV">
          <span class="pf-ring"></span>
          <span class="pf-veil"></span>
          <span class="pf-core"></span>
          <span class="pf-btn-lbl dl-icon">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
              <path d="M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4"/>
              <polyline points="7 10 12 15 17 10"/>
              <line x1="12" y1="15" x2="12" y2="3"/>
            </svg>
            <span>{{ t.dl_btn }}</span>
            <span class="dl-arrow">↓</span>
          </span>
        </button>
      </div>
    </section>

  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import NavBar from './NavBar.vue'

const props = defineProps({
  lang:  { type: String, default: 'PT' },
  theme: { type: String, default: 'light' },
})

const lang  = ref(props.lang)
const theme = ref(props.theme)

// ── Translations ─────────────────────────────────────────────
const copy = {
  PT: {
    hero_eyebrow  : 'Currículo',
    hero_role     : 'Designer UX/UI com 6 anos de experiência em design estratégico para e-commerce e 1 ano de Vibe Code Design — unindo pesquisa, estratégia de conversão e liderança de design.',
    stat_exp      : 'Anos de UX',
    stat_lang     : 'Idiomas',
    stat_en       : 'Nível de inglês',
    sec_objective : 'Objetivo',
    obj_text      : 'Atuar como Design Lead Estratégico — aplicando design orientado a dados, pesquisa UX e liderança para gerar soluções focadas em conversão, crescimento de receita e sistemas de alta complexidade para e-commerce global e produtos digitais.',
    sec_exp       : 'Experiência',
    remote        : 'Remoto, Brasil',
    exp1_lead     : 'Criação de um sistema interno de leasing e crédito para o Grupo Rodobens — projeto de seis meses modernizando um sistema interno legado de uma empresa brasileira de 75 anos do setor financeiro e varejo automotivo.',
    exp1_1        : 'Compilou e mapeou 129 perfis de acesso distintos, redesenhando o fluxo e aplicando regras de negócio variadas.',
    exp1_2        : 'Centralizou todas as operações de leasing, aluguel e venda de veículos em uma única plataforma.',
    exp1_3        : 'Liderou a descoberta: entrevistas com usuários, mapeamento de jornada AS-IS × TO-BE, redesenho de fluxos com base em regras de negócio e mediação de trade-offs com stakeholders.',
    exp2_1        : 'Aplicou abordagens de design lean orientadas por dados, gerando insights acionáveis para melhorias contínuas.',
    exp2_2        : 'Garantiu alinhamento com melhores práticas e diretrizes técnicas, incluindo padrões de acessibilidade.',
    exp2_3        : 'Conduziu pesquisas de usabilidade e implementou testes A/B para soluções focadas em conversão.',
    exp2_4        : 'Gerenciou projetos de design, definiu cronogramas e entregou sites completos e aplicativos móveis para clientes internacionais.',
    exp2_5        : 'Treinou e mentorou designers juniores, promovendo uma cultura de aprendizado contínuo.',
    exp3_title    : 'Especialista em Redes Sociais',
    exp3_1        : 'Gerenciou presença em redes sociais e plataformas de social listening com publicações consistentes.',
    exp3_2        : 'Monitorou métricas, criou e analisou desempenho de conteúdo, entregando relatórios de performance.',
    exp3_3        : 'Aumentou as taxas de conversão e engajamento nos perfis dos clientes.',
    sec_edu       : 'Formação',
    edu1_name     : 'Bacharelado em Design de Produto (EQF Nível 7)',
    edu2_name     : 'MBA em Marketing, Inovação & Criatividade',
    edu3_name     : 'MBA em UX/UI Design (Mestrado A)',
    edu4_name     : 'Comunicação — Jornalismo',
    sec_cert      : 'Certificações & Treinamentos',
    cert3_name    : 'Product Design: da colaboração à estratégia',
    sec_contact   : 'Contato',
    contact_phone : 'Telefone',
    contact_location: 'Localização',
    sec_languages : 'Idiomas',
    lang_pt       : 'Português',
    lang_en       : 'Inglês',
    lang_es       : 'Espanhol',
    lang_de       : 'Alemão',
    lang_native   : 'Nativo',
    lang_bilingual: 'Bilíngue',
    lang_basic    : 'Básico',
    sec_skills    : 'Habilidades',
    skill_tools   : 'Ferramentas & Métodos',
    skill_design  : 'Design & Pesquisa',
    skill_ai      : 'IA & Emergentes',
    skill_soft    : 'Soft Skills',
    soft1         : 'Liderança',
    soft2         : 'Comunicação',
    soft3         : 'Adaptabilidade',
    soft4         : 'Pensamento Analítico',
    sec_extra     : 'Adicional',
    dl_eyebrow    : 'Documento completo',
    dl_desc       : 'Baixe o CV completo em PDF — formatado, pronto para impressão e para compartilhar com seu time ou encaminhar a oportunidades.',
    dl_btn        : 'Baixar CV',
  },
  EN: {
    hero_eyebrow  : 'Curriculum Vitae',
    hero_role     : 'UX/UI Designer with 6 years of experience in strategic design for e-commerce and 1 year of Vibe Code Design — bridging research, conversion strategy, and design leadership.',
    stat_exp      : 'Years of UX',
    stat_lang     : 'Languages',
    stat_en       : 'English level',
    sec_objective : 'Objective',
    obj_text      : 'To act as a Strategic Design Lead — applying data-driven design strategy, UX research, and leadership to generate solutions focused on conversion, revenue growth, and high-complexity systems for global e-commerce and digital products.',
    sec_exp       : 'Experience',
    remote        : 'Remote, Brazil',
    exp1_lead     : 'Creation of an internal leasing and credit system for Grupo Rodobens — a six-month project modernizing a legacy internal system of a 75-year-old Brazilian company in the financial and automotive retail sector.',
    exp1_1        : 'Compiled and mapped 129 different access profiles, redesigning the flow and applying varied business rules.',
    exp1_2        : 'Centralized all leasing, rental, and vehicle sales operations within a single platform.',
    exp1_3        : 'Led discovery: user interviews, AS-IS × TO-BE journey mapping, redesigning flows based on business rules and stakeholder trade-off mediation.',
    exp2_1        : 'Applied lean design approaches driven by data, generating actionable insights for continuous improvements.',
    exp2_2        : 'Ensured alignment with best practices and technical guidelines, including accessibility standards.',
    exp2_3        : 'Conducted usability research and implemented A/B testing to drive conversion-focused solutions.',
    exp2_4        : 'Managed design projects, defined timelines, and delivered complete websites and mobile applications for international clients.',
    exp2_5        : 'Trained and mentored junior designers, fostering a culture of continuous learning.',
    exp3_title    : 'Social Media Specialist',
    exp3_1        : 'Managed social media presence and social listening platforms with consistent scheduling.',
    exp3_2        : 'Monitored metrics, created and analyzed content performance, delivering performance reports.',
    exp3_3        : 'Increased conversion and engagement rates across client profiles.',
    sec_edu       : 'Education',
    edu1_name     : 'Bachelor in Product Design (EQF Level 7)',
    edu2_name     : 'MBA in Marketing, Innovation & Creativity',
    edu3_name     : 'MBA in UX/UI Design (Master\'s A)',
    edu4_name     : 'Communication — Journalism',
    sec_cert      : 'Certifications & Training',
    cert3_name    : 'Product Design: from collaboration to strategy',
    sec_contact   : 'Contact',
    contact_phone : 'Phone',
    contact_location: 'Location',
    sec_languages : 'Languages',
    lang_pt       : 'Portuguese',
    lang_en       : 'English',
    lang_es       : 'Spanish',
    lang_de       : 'German',
    lang_native   : 'Native',
    lang_bilingual: 'Bilingual',
    lang_basic    : 'Basic',
    sec_skills    : 'Skills',
    skill_tools   : 'Tools & Methods',
    skill_design  : 'Design & Research',
    skill_ai      : 'AI & Emerging',
    skill_soft    : 'Soft Skills',
    soft1         : 'Leadership',
    soft2         : 'Communication',
    soft3         : 'Adaptability',
    soft4         : 'Analytical Thinking',
    sec_extra     : 'Additional',
    dl_eyebrow    : 'Full document',
    dl_desc       : 'Get the complete CV as a PDF — formatted, print-ready, and ready to share with your team or forward to opportunities.',
    dl_btn        : 'Download CV',
  },
  ES: {
    hero_eyebrow  : 'Currículum Vitae',
    hero_role     : 'Diseñadora UX/UI con 6 años de experiencia en diseño estratégico para e-commerce y 1 año de Vibe Code Design — conectando investigación, estrategia de conversión y liderazgo de diseño.',
    stat_exp      : 'Años de UX',
    stat_lang     : 'Idiomas',
    stat_en       : 'Nivel de inglés',
    sec_objective : 'Objetivo',
    obj_text      : 'Actuar como Design Lead Estratégico — aplicando estrategia de diseño basada en datos, investigación UX y liderazgo para generar soluciones enfocadas en conversión, crecimiento de ingresos y sistemas de alta complejidad para e-commerce global y productos digitales.',
    sec_exp       : 'Experiencia',
    remote        : 'Remoto, Brasil',
    exp1_lead     : 'Creación de un sistema interno de leasing y crédito para el Grupo Rodobens — un proyecto de seis meses que moderniza un sistema interno legado de una empresa brasileña de 75 años del sector financiero y comercio automotriz.',
    exp1_1        : 'Compiló y mapeó 129 perfiles de acceso distintos, rediseñando el flujo y aplicando diversas reglas de negocio.',
    exp1_2        : 'Centralizó todas las operaciones de leasing, alquiler y venta de vehículos en una única plataforma.',
    exp1_3        : 'Lideró el discovery: entrevistas con usuarios, mapeo de journey AS-IS × TO-BE, rediseño de flujos basado en reglas de negocio y mediación de trade-offs con stakeholders.',
    exp2_1        : 'Aplicó enfoques de diseño lean basados en datos, generando insights accionables para mejoras continuas.',
    exp2_2        : 'Aseguró la alineación con mejores prácticas y directrices técnicas, incluidos estándares de accesibilidad.',
    exp2_3        : 'Realizó investigaciones de usabilidad e implementó pruebas A/B para impulsar soluciones enfocadas en conversión.',
    exp2_4        : 'Gestionó proyectos de diseño, definió cronogramas y entregó sitios web completos y aplicaciones móviles para clientes internacionales.',
    exp2_5        : 'Capacitó y mentoreó a diseñadores junior, fomentando una cultura de aprendizaje continuo.',
    exp3_title    : 'Especialista en Redes Sociales',
    exp3_1        : 'Gestionó la presencia en redes sociales y plataformas de social listening con publicaciones consistentes.',
    exp3_2        : 'Monitoreó métricas, creó y analizó rendimiento de contenido, entregando informes de desempeño.',
    exp3_3        : 'Aumentó las tasas de conversión y engagement en los perfiles de clientes.',
    sec_edu       : 'Formación',
    edu1_name     : 'Licenciatura en Diseño de Producto (EQF Nivel 7)',
    edu2_name     : 'MBA en Marketing, Innovación & Creatividad',
    edu3_name     : 'MBA en UX/UI Design (Máster A)',
    edu4_name     : 'Comunicación — Periodismo',
    sec_cert      : 'Certificaciones & Formación',
    cert3_name    : 'Product Design: de la colaboración a la estrategia',
    sec_contact   : 'Contacto',
    contact_phone : 'Teléfono',
    contact_location: 'Ubicación',
    sec_languages : 'Idiomas',
    lang_pt       : 'Portugués',
    lang_en       : 'Inglés',
    lang_es       : 'Español',
    lang_de       : 'Alemán',
    lang_native   : 'Nativo',
    lang_bilingual: 'Bilingüe',
    lang_basic    : 'Básico',
    sec_skills    : 'Habilidades',
    skill_tools   : 'Herramientas & Métodos',
    skill_design  : 'Diseño & Investigación',
    skill_ai      : 'IA & Emergentes',
    skill_soft    : 'Soft Skills',
    soft1         : 'Liderazgo',
    soft2         : 'Comunicación',
    soft3         : 'Adaptabilidad',
    soft4         : 'Pensamiento Analítico',
    sec_extra     : 'Adicional',
    dl_eyebrow    : 'Documento completo',
    dl_desc       : 'Descarga el CV completo en PDF — formateado, listo para imprimir y para compartir con tu equipo o enviar a oportunidades.',
    dl_btn        : 'Descargar CV',
  },
  DE: {
    hero_eyebrow  : 'Lebenslauf',
    hero_role     : 'UX/UI-Designerin mit 6 Jahren Erfahrung im strategischen Design für E-Commerce und 1 Jahr Vibe Code Design — Verbindung von Forschung, Conversion-Strategie und Design-Leadership.',
    stat_exp      : 'Jahre UX',
    stat_lang     : 'Sprachen',
    stat_en       : 'Englischniveau',
    sec_objective : 'Ziel',
    obj_text      : 'Als Strategic Design Lead tätig sein — datengetriebene Designstrategie, UX-Forschung und Leadership anwenden, um Lösungen zu entwickeln, die auf Conversion, Umsatzwachstum und hochkomplexe Systeme für globalen E-Commerce und digitale Produkte ausgerichtet sind.',
    sec_exp       : 'Erfahrung',
    remote        : 'Remote, Brasilien',
    exp1_lead     : 'Erstellung eines internen Leasing- und Kreditsystems für die Grupo Rodobens — ein sechsmonatiges Projekt zur Modernisierung eines Legacy-Systems eines 75 Jahre alten brasilianischen Unternehmens im Finanz- und Automobilhandel.',
    exp1_1        : '129 verschiedene Zugriffsprofile kompiliert und kartiert, den Ablauf neu gestaltet und verschiedene Geschäftsregeln angewendet.',
    exp1_2        : 'Alle Leasing-, Miet- und Fahrzeugverkaufsoperationen auf einer einzigen Plattform zentralisiert.',
    exp1_3        : 'Discovery geleitet: Nutzerinterviews, AS-IS × TO-BE Journey Mapping, Neugestaltung von Abläufen basierend auf Geschäftsregeln und Stakeholder Trade-off-Mediation.',
    exp2_1        : 'Lean-Design-Ansätze datengesteuert angewendet und umsetzbare Erkenntnisse für kontinuierliche Verbesserungen gewonnen.',
    exp2_2        : 'Ausrichtung an Best Practices und technischen Richtlinien, einschließlich Barrierefreiheitsstandards, sichergestellt.',
    exp2_3        : 'Usability-Forschung durchgeführt und A/B-Tests implementiert, um konversionsfokussierte Lösungen zu entwickeln.',
    exp2_4        : 'Designprojekte verwaltet, Zeitpläne definiert und vollständige Websites und mobile Apps für internationale Kunden geliefert.',
    exp2_5        : 'Junior-Designer trainiert und betreut und eine Kultur des kontinuierlichen Lernens gefördert.',
    exp3_title    : 'Social-Media-Spezialistin',
    exp3_1        : 'Social-Media-Präsenz und Social-Listening-Plattformen mit konsistenter Planung verwaltet.',
    exp3_2        : 'Metriken überwacht, Content-Performance erstellt und analysiert, Performance-Berichte geliefert.',
    exp3_3        : 'Conversion- und Engagement-Raten in Kundenprofilen erhöht.',
    sec_edu       : 'Ausbildung',
    edu1_name     : 'Bachelor in Produktdesign (EQF Level 7)',
    edu2_name     : 'MBA in Marketing, Innovation & Kreativität',
    edu3_name     : 'MBA in UX/UI Design (Master A)',
    edu4_name     : 'Kommunikation — Journalismus',
    sec_cert      : 'Zertifikate & Weiterbildung',
    cert3_name    : 'Product Design: von der Zusammenarbeit zur Strategie',
    sec_contact   : 'Kontakt',
    contact_phone : 'Telefon',
    contact_location: 'Standort',
    sec_languages : 'Sprachen',
    lang_pt       : 'Portugiesisch',
    lang_en       : 'Englisch',
    lang_es       : 'Spanisch',
    lang_de       : 'Deutsch',
    lang_native   : 'Muttersprache',
    lang_bilingual: 'Zweisprachig',
    lang_basic    : 'Grundkenntnisse',
    sec_skills    : 'Fähigkeiten',
    skill_tools   : 'Tools & Methoden',
    skill_design  : 'Design & Forschung',
    skill_ai      : 'KI & Emerging Tech',
    skill_soft    : 'Soft Skills',
    soft1         : 'Führung',
    soft2         : 'Kommunikation',
    soft3         : 'Anpassungsfähigkeit',
    soft4         : 'Analytisches Denken',
    sec_extra     : 'Weitere Kenntnisse',
    dl_eyebrow    : 'Vollständiges Dokument',
    dl_desc       : 'Laden Sie den vollständigen Lebenslauf als PDF herunter — formatiert, druckfertig und bereit zum Teilen mit Ihrem Team oder Weiterleiten an Möglichkeiten.',
    dl_btn        : 'Lebenslauf herunterladen',
  },
}

const t = computed(() => copy[lang.value] ?? copy['PT'])

function printCV() {
  window.print()
}
</script>

<style scoped>
/* ── Page shell ──────────────────────────────────────────── */
.pf-page {
  background : var(--bg);
  color      : var(--fg);
  font-family: var(--font-body);
  min-height : 100svh;
  position   : relative;
  overflow-x : hidden;
  transition : background .5s ease, color .5s ease;
  -webkit-font-smoothing: antialiased;
}

/* ── Ambient ─────────────────────────────────────────────── */
.pf-ambient { position: fixed; inset: 0; pointer-events: none; z-index: 0; }
.pf-glow {
  position : absolute; top: -15%; right: -8%; width: 60vw; height: 60vw;
  background: radial-gradient(ellipse at 65% 25%, var(--accent-glow) 0%, transparent 62%);
}
.theme-light .pf-glow { opacity: .55; }
.pf-glow-bl {
  position : absolute; bottom: -10%; left: -5%; width: 45vw; height: 45vw;
  background: radial-gradient(ellipse at 30% 70%, rgba(240,24,90,.05) 0%, transparent 65%);
}
.pf-grain {
  position : absolute; inset: 0; opacity: var(--grain-opacity);
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='g'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.72' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23g)'/%3E%3C/svg%3E");
  background-size: 180px 180px;
}

/* ── Hero ────────────────────────────────────────────────── */
.cv-hero {
  position : relative; z-index: 1;
  max-width : 1120px; margin: 0 auto;
  padding   : calc(56px + 5rem) 1.5rem 3rem;
  display   : flex; flex-direction: column; gap: 2.5rem;
}

@media (min-width: 640px) {
  .cv-hero { padding: calc(56px + 5rem) 3rem 3rem; }
}

@media (min-width: 1024px) {
  .cv-hero {
    padding : calc(56px + 5.5rem) 4rem 3rem;
    display : grid; grid-template-columns: 1fr auto; gap: 3rem; align-items: end;
  }
}

.hero-eyebrow {
  display: flex; align-items: center; gap: .5rem;
  font-size: .6rem; font-weight: 500; letter-spacing: .16em; text-transform: uppercase;
  color: var(--fg-muted); margin-bottom: 1.25rem;
  animation: pf-up .8s var(--ease-expo) .1s both;
}

.pf-dot {
  width: 5px; height: 5px; border-radius: 50%; background: var(--accent);
  flex-shrink: 0; animation: pf-pulse 2.5s ease-in-out infinite;
}

.hero-name {
  font-family: var(--font-display); font-weight: 700;
  font-size: clamp(2.4rem, 5.5vw, 4.5rem);
  line-height: .88; letter-spacing: -.025em; margin-bottom: 1.25rem;
  animation: pf-up .85s var(--ease-expo) .18s both;
}
.hero-name em { font-style: italic; color: var(--accent); }

.hero-role {
  font-size: clamp(.85rem, 1.4vw, .95rem); font-weight: 300;
  line-height: 1.7; color: var(--fg-muted); max-width: 52ch;
  animation: pf-up .85s var(--ease-expo) .26s both; margin-bottom: 2rem;
}

.hero-contacts {
  display: flex; flex-wrap: wrap; gap: .75rem;
  animation: pf-up .85s var(--ease-expo) .34s both;
}

.hero-contact-item {
  display: inline-flex; align-items: center; gap: .5rem;
  font-size: .52rem; font-weight: 500; letter-spacing: .1em; text-transform: uppercase;
  color: var(--fg-muted); padding: 4px 10px; border: 1px solid var(--border);
  transition: color .2s, border-color .2s; text-decoration: none;
}
.hero-contact-item:hover { color: var(--accent); border-color: var(--accent-soft); }
.hero-contact-item svg { flex-shrink: 0; color: var(--accent); }

.hero-rule {
  width: 100%; height: 1px;
  background: linear-gradient(90deg, rgba(240,24,90,.55) 0%, transparent 65%);
  margin-top: 2rem;
  animation: pf-up .85s var(--ease-expo) .4s both;
}

.hero-meta {
  animation: pf-up .85s var(--ease-expo) .3s both;
  display: flex; flex-direction: column; align-items: flex-start; gap: 1rem;
  padding-bottom: .5rem;
}
@media (min-width: 1024px) {
  .hero-meta { align-items: flex-end; }
}

.hero-stat { text-align: left; }
@media (min-width: 1024px) { .hero-stat { text-align: right; } }

.hero-stat-n {
  font-family: var(--font-display); font-size: 2rem; font-weight: 700;
  color: var(--accent); line-height: 1; margin-bottom: 2px;
}
.hero-stat-t {
  font-size: .48rem; font-weight: 500; letter-spacing: .14em;
  text-transform: uppercase; color: var(--fg-muted);
}

/* ── Content grid ────────────────────────────────────────── */
.cv-content {
  position : relative; z-index: 1;
  max-width : 1120px; margin: 0 auto;
  padding   : 0 1.5rem 2rem;
  display   : grid; gap: 3rem;
}

@media (min-width: 640px) {
  .cv-content { padding: 0 3rem 2rem; }
}

@media (min-width: 1024px) {
  .cv-content {
    padding : 0 4rem 2rem;
    grid-template-columns: 1fr 300px;
  }
}

/* ── Section ─────────────────────────────────────────────── */
.cv-section {
  margin-bottom: 2.5rem;
  animation: pf-up .7s var(--ease-expo) both;
}

.cv-section--1 { animation-delay: .5s; }
.cv-section--2 { animation-delay: .6s; }
.cv-section--3 { animation-delay: .7s; }
.cv-section--4 { animation-delay: .8s; }

.cv-section-label {
  display: flex; align-items: center; gap: .75rem;
  font-size: .5rem; font-weight: 500; letter-spacing: .18em; text-transform: uppercase;
  color: var(--accent); margin-bottom: 1.5rem;
  padding-bottom: .75rem; border-bottom: 1px solid var(--border);
}
.cv-section-label::before {
  content: ''; width: 5px; height: 5px; border-radius: 50%;
  background: var(--accent); flex-shrink: 0;
  animation: pf-pulse 2.5s ease-in-out infinite;
}

/* ── Experience ──────────────────────────────────────────── */
.exp-item {
  padding: 1.5rem 0; border-bottom: 1px solid var(--border); position: relative;
}
.exp-item:last-child { border-bottom: none; }
.exp-item::before {
  content: ''; position: absolute; left: 0; top: 1.5rem;
  width: 1px; height: calc(100% - 1.5rem);
  background: linear-gradient(to bottom, var(--accent-soft), transparent);
  opacity: 0; transition: opacity .3s;
}
.exp-item:hover::before { opacity: 1; }

.exp-header {
  display: grid; grid-template-columns: 1fr auto; gap: 1rem; margin-bottom: .75rem;
  align-items: start;
}
.exp-title {
  font-family: var(--font-display); font-size: 1rem; font-weight: 600;
  letter-spacing: -.01em; line-height: 1.1;
}
.exp-period {
  font-size: .48rem; font-weight: 500; letter-spacing: .12em; text-transform: uppercase;
  color: var(--accent); white-space: nowrap;
  padding: 2px 8px; border: 1px solid var(--accent-soft);
  flex-shrink: 0;
}
.exp-company {
  font-size: .55rem; font-weight: 500; letter-spacing: .1em; text-transform: uppercase;
  color: var(--fg-muted); margin-bottom: 1rem;
  display: flex; align-items: center; gap: .5rem;
}
.exp-company-dot { width: 3px; height: 3px; border-radius: 50%; background: var(--fg-faint); }

.exp-desc { font-size: clamp(.8rem, 1.2vw, .87rem); font-weight: 300; line-height: 1.85; color: var(--fg-muted); }
.exp-desc ul { list-style: none; padding: 0; margin-top: .75rem; display: flex; flex-direction: column; gap: .5rem; }
.exp-desc li { display: flex; gap: .75rem; }
.exp-desc li::before { content: '—'; color: var(--accent); font-weight: 500; flex-shrink: 0; font-size: .75rem; }

/* ── Education / Certs ───────────────────────────────────── */
.edu-item {
  display: grid; grid-template-columns: 1fr auto; gap: 1rem;
  padding: 1rem 0; border-bottom: 1px solid var(--border); align-items: start;
}
.edu-item:last-child { border-bottom: none; }
.edu-name { font-size: clamp(.8rem, 1.2vw, .87rem); font-weight: 400; line-height: 1.5; color: var(--fg); }
.edu-inst { font-size: .5rem; font-weight: 500; letter-spacing: .1em; text-transform: uppercase; color: var(--fg-muted); margin-top: 3px; }
.edu-year {
  font-family: var(--font-display); font-size: .75rem; font-weight: 700;
  color: var(--accent); white-space: nowrap;
}

/* ── Objective box ───────────────────────────────────────── */
.objective-box {
  border: 1px solid var(--border); padding: 1.25rem; position: relative; overflow: hidden;
}
.objective-box::before {
  content: ''; position: absolute; top: 0; left: 0; right: 0; height: 1px;
  background: linear-gradient(90deg, var(--accent) 0%, transparent 70%);
}
.objective-text { font-size: clamp(.8rem, 1.2vw, .87rem); font-weight: 300; line-height: 1.85; color: var(--fg-muted); }

/* ── Sidebar ─────────────────────────────────────────────── */
.cv-sidebar { display: flex; flex-direction: column; gap: 2rem; }

@media (min-width: 1024px) {
  .cv-sidebar { position: sticky; top: 96px; }
}

.sidebar-section {
  animation: pf-up .7s var(--ease-expo) both;
}

.sidebar-section--1 { animation-delay: .55s; }
.sidebar-section--2 { animation-delay: .65s; }
.sidebar-section--3 { animation-delay: .75s; }
.sidebar-section--4 { animation-delay: .85s; }

/* ── Skills ──────────────────────────────────────────────── */
.skill-group { margin-bottom: 1rem; }
.skill-group-label {
  font-size: .48rem; font-weight: 500; letter-spacing: .14em;
  text-transform: uppercase; color: var(--fg-muted); margin-bottom: .75rem;
}
.skill-list { display: flex; flex-wrap: wrap; gap: .5rem; }
.skill-tag {
  font-size: .5rem; font-weight: 500; letter-spacing: .1em; text-transform: uppercase;
  color: var(--fg-muted); padding: 4px 10px; border: 1px solid var(--border);
  transition: color .2s, border-color .2s; cursor: default;
}
.skill-tag:hover { color: var(--fg); border-color: var(--accent-soft); }

/* ── Languages ───────────────────────────────────────────── */
.lang-item {
  display: flex; align-items: center; justify-content: space-between;
  padding: .75rem 0; border-bottom: 1px solid var(--border);
}
.lang-item:last-child { border-bottom: none; }
.lang-name { font-size: .78rem; font-weight: 400; color: var(--fg); }
.lang-level-wrap { display: flex; flex-direction: column; align-items: flex-end; gap: 4px; }
.lang-level-label { font-size: .45rem; font-weight: 500; letter-spacing: .12em; text-transform: uppercase; color: var(--fg-muted); }
.lang-dots { display: flex; gap: 3px; }
.lang-dot { width: 6px; height: 6px; border: 1px solid var(--ghost-border); }
.lang-dot.filled { background: var(--accent); border-color: var(--accent); }

/* ── Contact sidebar ─────────────────────────────────────── */
.contact-item {
  display: flex; align-items: center; gap: .75rem;
  padding: .75rem 0; border-bottom: 1px solid var(--border);
  font-size: .75rem; font-weight: 300; color: var(--fg-muted); transition: color .2s;
}
.contact-item:last-child { border-bottom: none; }
.contact-item:hover { color: var(--fg); }
.contact-item svg { color: var(--accent); flex-shrink: 0; }
.contact-label { font-size: .45rem; font-weight: 500; letter-spacing: .12em; text-transform: uppercase; color: var(--fg-muted); margin-bottom: 2px; }

/* ── Download CTA ────────────────────────────────────────── */
.cv-download {
  position: relative; z-index: 1;
  max-width: 1120px; margin: 0 auto;
  padding: 3rem 1.5rem 6rem;
}

@media (min-width: 640px) { .cv-download { padding: 3rem 3rem 6rem; } }
@media (min-width: 1024px) { .cv-download { padding: 3rem 4rem 6rem; } }

.download-box {
  border: 1px solid var(--border); padding: 3rem 2rem;
  position: relative; overflow: hidden;
  display: flex; flex-direction: column; gap: 2rem;
  transition: border-color .4s;
}

@media (min-width: 640px) {
  .download-box {
    display: grid; grid-template-columns: 1fr auto;
    gap: 2rem; align-items: center; padding: 3rem 4rem;
  }
}

.download-box:hover { border-color: var(--accent-soft); }
.download-box::before {
  content: ''; position: absolute; top: 0; left: 0; right: 0; height: 1px;
  background: linear-gradient(90deg, rgba(240,24,90,.55) 0%, transparent 65%);
}
.download-box::after {
  content: ''; position: absolute;
  top: -50%; right: -10%; width: 40%; height: 200%;
  background: radial-gradient(ellipse, var(--accent-glow) 0%, transparent 70%);
  pointer-events: none;
}

.download-eyebrow {
  font-size: .5rem; font-weight: 500; letter-spacing: .16em; text-transform: uppercase;
  color: var(--accent); display: flex; align-items: center; gap: .5rem; margin-bottom: 1rem;
}
.download-title {
  font-family: var(--font-display); font-weight: 700;
  font-size: clamp(1.4rem, 3vw, 2.4rem); line-height: .9; letter-spacing: -.02em; margin-bottom: 1rem;
}
.download-title em { font-style: italic; color: var(--accent); }
.download-desc { font-size: clamp(.8rem, 1.2vw, .88rem); font-weight: 300; line-height: 1.8; color: var(--fg-muted); max-width: 44ch; }

/* ── Download button ─────────────────────────────────────── */
.pf-btn {
  position: relative; display: inline-flex; align-items: center; justify-content: center;
  height: 50px; padding: 0 2rem; overflow: hidden; outline: none;
  transition: transform .15s ease; flex-shrink: 0; border: none; cursor: pointer;
  min-width: 200px; text-decoration: none;
}
.pf-btn:active { transform: scale(.97); }
.pf-ring {
  position: absolute; inset: -100%; animation: pf-spin-ring 3s linear infinite;
  opacity: 0; transition: opacity .4s ease; pointer-events: none;
}
.pf-btn:hover .pf-ring { opacity: 1; }
.pf-veil { position: absolute; inset: 0; transition: opacity .4s ease; pointer-events: none; }
.pf-btn:hover .pf-veil { opacity: 0; }
.pf-core { position: absolute; inset: 1px; z-index: 1; pointer-events: none; transition: background .4s ease; }
.pf-btn-lbl {
  position: relative; z-index: 2; font-size: .55rem; font-weight: 500;
  letter-spacing: .14em; text-transform: uppercase; transition: color .2s;
}

/* dark theme btn */
.theme-dark .pf-ring { background: conic-gradient(from 90deg at 50% 50%, transparent 0%, transparent 75%, rgba(255,255,255,.85) 100%); }
.theme-dark .pf-veil { background: #F0185A; }
.theme-dark .pf-core { background: #F0185A; }
.theme-dark .pf-btn-lbl { color: #fff; }
.theme-dark .pf-btn:hover .pf-core { background: #F0EFF8; }
.theme-dark .pf-btn:hover .pf-btn-lbl { color: #070711; }

/* light theme btn */
.theme-light .pf-ring { background: conic-gradient(from 90deg at 50% 50%, transparent 0%, transparent 75%, rgba(240,24,90,.8) 100%); }
.theme-light .pf-veil { background: #F0185A; }
.theme-light .pf-core { background: #F0185A; }
.theme-light .pf-btn-lbl { color: #fff; }
.theme-light .pf-btn:hover .pf-core { background: #62607A; }
.theme-light .pf-btn:hover .pf-btn-lbl { color: #F5F3FF; }

.dl-icon { display: inline-flex; align-items: center; gap: .5rem; }
.dl-arrow { display: inline-block; transition: transform .3s var(--ease-expo); }
.pf-btn:hover .dl-arrow { transform: translateY(3px); }

/* ── Animations ──────────────────────────────────────────── */
@keyframes pf-up    { from { opacity: 0; transform: translateY(24px); filter: blur(8px); } to { opacity: 1; transform: none; filter: blur(0); } }
@keyframes pf-pulse { 0%,100% { opacity: 1; transform: scale(1); } 50% { opacity: .3; transform: scale(.75); } }
@keyframes pf-spin-ring { to { transform: rotate(360deg); } }

/* ── Print / PDF ─────────────────────────────────────────── */
@media print {
  /* Force light background for readability */
  .pf-page {
    background: #fff !important;
    color: #0D0C1A !important;
  }

  /* Hide non-content chrome */
  .pf-ambient,
  .cv-download,
  nav { display: none !important; }

  /* Remove animations so content is visible */
  .cv-section,
  .sidebar-section { animation: none !important; opacity: 1 !important; transform: none !important; }

  /* Reset hero padding (no navbar offset needed) */
  .cv-hero { padding-top: 2rem !important; }

  /* Flatten sticky sidebar */
  .cv-sidebar { position: static !important; }

  /* Page layout */
  .cv-content {
    display: grid;
    grid-template-columns: 1fr 260px;
    gap: 2rem;
  }

  /* Borders visible in print */
  .cv-section-label,
  .exp-item,
  .edu-item,
  .lang-item,
  .contact-item,
  .skill-tag,
  .objective-box { border-color: #ccc !important; }

  .exp-period { border-color: #F0185A !important; }

  /* Accent color survives print */
  .hero-name em,
  .cv-section-label,
  .hero-stat-n,
  .exp-period,
  .edu-year { color: #F0185A !important; }

  /* Avoid breaking items across pages */
  .exp-item,
  .edu-item { page-break-inside: avoid; }

  @page {
    margin: 1.5cm 1.8cm;
    size: A4;
  }
}
</style>
