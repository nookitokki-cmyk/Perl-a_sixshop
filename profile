<style>
/* ===== 기본 컨테이너 ===== */
.bm-profile {
  background-color: {{property.backgroundColor}};
  color: {{property.textColor}};
  padding: {{property.paddingTop}}px {{property.paddingHorizontal}}px {{property.paddingBottom}}px {{property.paddingHorizontal}}px;
  font-family: var(--font-family-body);
  line-height: {{property.lineHeight}};
}

/* ===== RICH_TEXT 기본 지원 ===== */
.bm-profile p {
  margin: 0;
}

/* ===== 그리드 레이아웃 ===== */
.bm-profile__grid {
  max-width: {{property.maxWidth}}px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: {{property.imageWidth}}px 1fr;
  gap: {{property.headerCardGap}}px;
  align-items: stretch;
}

/* ===== 이미지 영역 ===== */
.bm-profile__image-area {
  width: 100%;
  position: relative;
}

.bm-profile__image {
  width: 100%;
  height: 100%;
  min-height: 300px;
  overflow: hidden;
  background-color: #F0F0F0;
}

.bm-profile__image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.bm-profile__image-placeholder {
  width: 100%;
  height: 100%;
  min-height: 300px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 80px;
  color: #CCCCCC;
  background: linear-gradient(135deg, #FAF8F5 0%, #EDE3D8 100%);
}

/* ===== 모바일 전용 헤더 (기본 숨김) ===== */
.bm-profile__header-mobile {
  display: none;
}

/* ===== 오른쪽 콘텐츠 ===== */
.bm-profile__content {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.bm-profile__header {
  margin-bottom: {{property.nameBottomGap}}px;
}

.bm-profile__name {
  margin: 0 0 4px 0;
  font-size: {{property.namePcSize}}px;
  font-family: var(--font-family-heading);
  font-weight: var(--font-weight-heading);
  line-height: 1.3;
}

.bm-profile__role {
  margin: 0;
  font-size: {{property.titlePcSize}}px;
  line-height: {{property.lineHeight}};
  opacity: 0.6;
}

/* ===== 경력 목록 ===== */
.bm-profile__exp-list {
  list-style: none;
  padding: 0;
  margin: 0;
}

.bm-profile__exp-item {
  margin-bottom: 6px;
  font-size: {{property.expPcSize}}px;
  line-height: {{property.lineHeight}};
  display: flex;
  align-items: baseline;
  gap: 10px;
  opacity: 0;
  transform: translateY(10px);
  transition: opacity {{property.animationDuration}}ms ease, transform {{property.animationDuration}}ms ease;
}

.bm-profile__exp-item.is-visible {
  opacity: 1;
  transform: translateY(0);
}

.bm-profile__exp-item.is-no-anim {
  opacity: 1;
  transform: translateY(0);
  transition: none;
}

.bm-profile__exp-year {
  display: inline-block;
  background-color: {{property.yearBgColor}};
  color: {{property.yearTextColor}};
  padding: 2px 10px;
  border-radius: {{property.yearBorderRadius}}px;
  font-size: calc({{property.expPcSize}}px - 1px);
  line-height: 1.4;
  white-space: nowrap;
  flex-shrink: 0;
}

.bm-profile__exp-text {
  flex: 1;
  word-break: keep-all;
  overflow-wrap: break-word;
}

/* ===== 추가 정보 ===== */
.bm-profile__additional {
  margin-top: {{property.additionalTopGap}}px;
}

.bm-profile__additional-title {
  font-size: {{property.additionalTitlePcSize}}px;
  text-transform: uppercase;
  margin-bottom: 8px;
}

.bm-profile__additional-body {
  font-size: {{property.additionalInfoPcSize}}px;
  line-height: 1.7;
  white-space: pre-line;
  word-break: keep-all;
  overflow-wrap: break-word;
}

/* ===== 모바일 + 태블릿 (1023px 이하) ===== */
@media (max-width: 1023px) {
  .bm-profile {
    padding: {{property.paddingTop}}px {{property.paddingHorizontal}}px {{property.paddingBottom}}px {{property.paddingHorizontal}}px;
  }

  .bm-profile__grid {
    grid-template-columns: 1fr;
    gap: 0;
    max-width: 100%;
  }

  /* 데스크톱 헤더 숨김 */
  .bm-profile__header {
    display: none;
  }

  /* 모바일 헤더 표시 */
  .bm-profile__header-mobile {
    display: block;
    text-align: center;
    margin-bottom: 16px;
  }

  .bm-profile__header-mobile .bm-profile__name {
    font-size: {{property.nameMoSize}}px;
  }

  .bm-profile__header-mobile .bm-profile__role {
    font-size: {{property.titleMoSize}}px;
  }

  .bm-profile__image-area {
    max-width: 100%;
    margin: 0 auto 32px auto;
  }

  .bm-profile__image {
    height: auto;
    aspect-ratio: 1 / 1;
    min-height: unset;
  }

  .bm-profile__content {
    justify-content: flex-start;
  }

  .bm-profile__exp-item {
    font-size: {{property.expMoSize}}px;
    gap: 8px;
  }

  .bm-profile__exp-year {
    font-size: calc({{property.expMoSize}}px - 1px);
    padding: 2px 8px;
  }

  .bm-profile__additional-title {
    font-size: {{property.additionalTitleMoSize}}px;
  }

  .bm-profile__additional-body {
    font-size: {{property.additionalInfoMoSize}}px;
  }
}

/* ===== 접근성 ===== */
@media (prefers-contrast: high) {
  .bm-profile__exp-year {
    border: 1px solid currentColor;
  }
}

@media (prefers-reduced-motion: reduce) {
  .bm-profile__exp-item {
    transition: none;
  }
}
</style>

<template>
<section class="bm-profile" role="region" aria-label="프로필 정보">
  <div class="bm-profile__grid">
    <!-- 왼쪽: 이미지 -->
    <div class="bm-profile__image-area">
      <!-- 모바일 전용 헤더 -->
      <header class="bm-profile__header-mobile">
        <h1 class="bm-profile__name">{{{property.name}}}</h1>
        <div class="bm-profile__role">{{{property.title}}}</div>
      </header>

      <div class="bm-profile__image">
        {{#if property.profileImage}}
          <img src="{{property.profileImage}}" alt="프로필 사진" loading="lazy">
        {{else}}
          <div class="bm-profile__image-placeholder">□</div>
        {{/if}}
      </div>
    </div>

    <!-- 오른쪽: 콘텐츠 -->
    <div class="bm-profile__content">
      <!-- 데스크톱 전용 헤더 -->
      <header class="bm-profile__header">
        <h1 class="bm-profile__name">{{{property.name}}}</h1>
        <div class="bm-profile__role">{{{property.title}}}</div>
      </header>

      <!-- 경력 목록 -->
      <ul class="bm-profile__exp-list" role="list" aria-label="경력 목록">
        {{#each property.experiences}}
        <li class="bm-profile__exp-item" role="listitem">
          <span class="bm-profile__exp-year" aria-label="연도">{{year}}</span>
          <span class="bm-profile__exp-text">{{content}}</span>
        </li>
        {{/each}}
      </ul>

      <!-- 추가 정보 -->
      {{#if property.additionalInfo}}
      <div class="bm-profile__additional" role="complementary" aria-label="추가 경력 정보">
        <h2 class="bm-profile__additional-title">{{{property.additionalTitle}}}</h2>
        <div class="bm-profile__additional-body">{{{property.additionalInfo}}}</div>
      </div>
      {{/if}}
    </div>
  </div>
</section>
</template>

<script>
var container = bm.container;
var context = bm.context;

var observer = null;

function init() {
  setupAnimation();
  setupImageFallback();
}

/* ===== 스크롤 애니메이션 ===== */
function setupAnimation() {
  var items = container.querySelectorAll('.bm-profile__exp-item');

  if (!context.property.enableAnimation) {
    items.forEach(function(item) {
      item.classList.add('is-no-anim');
    });
    return;
  }

  var prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  if (prefersReducedMotion) {
    items.forEach(function(item) {
      item.classList.add('is-no-anim');
    });
    return;
  }

  if (observer) {
    observer.disconnect();
  }

  var observerOptions = {
    root: null,
    rootMargin: '0px',
    threshold: 0.1
  };

  observer = new IntersectionObserver(function(entries) {
    entries.forEach(function(entry) {
      if (entry.isIntersecting) {
        var delay = Array.from(items).indexOf(entry.target) * 50;
        setTimeout(function() {
          entry.target.classList.add('is-visible');
        }, delay);
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  items.forEach(function(item) {
    observer.observe(item);
  });
}

/* ===== 이미지 폴백 ===== */
function setupImageFallback() {
  var img = container.querySelector('.bm-profile__image img');
  if (img) {
    img.addEventListener('error', function() {
      var wrapper = img.parentElement;
      wrapper.innerHTML = '<div class="bm-profile__image-placeholder">□</div>';
    });
  }
}

/* ===== Context 변경 ===== */
bm.onContextChange = function() {
  var items = container.querySelectorAll('.bm-profile__exp-item');
  items.forEach(function(item) {
    item.classList.remove('is-visible', 'is-no-anim');
  });
  init();
};

/* ===== 정리 ===== */
bm.onDestroy = function() {
  if (observer) {
    observer.disconnect();
    observer = null;
  }
};

/* ===== 초기 실행 ===== */
init();
</script>


{"settings":[{"type":"TITLE","content":"누끼토끼 전문 개발 블록"},{"type":"DESCRIPTION","content":"【 안내 】\n코드 없이 직접 운영하실 수 있도록\n전문 개발자가 기획·설계·구현했습니다.\n간단한 수정은 블록 AI를 활용하시고,\n고도화된 커스텀이 필요하시면\n전문가에게 의뢰해 주세요."},{"type":"TITLE","content":"📋 기본 정보"},{"type":"RICH_TEXT","id":"name","label":"이름","default":"<p>홍길동</p>"},{"type":"RANGE","id":"namePcSize","label":"↳ 이름 PC 글씨 크기","min":16,"max":40,"step":1,"unit":"px","default":20},{"type":"RANGE","id":"nameMoSize","label":"↳ 이름 모바일 글씨 크기","min":14,"max":32,"step":1,"unit":"px","default":18},{"type":"RICH_TEXT","id":"title","label":"직책/소개","default":"<p>웰포슬린 스타트업 창업가</p>"},{"type":"RANGE","id":"titlePcSize","label":"↳ 직책 PC 글씨 크기","min":12,"max":24,"step":1,"unit":"px","default":14},{"type":"RANGE","id":"titleMoSize","label":"↳ 직책 모바일 글씨 크기","min":11,"max":20,"step":1,"unit":"px","default":13},{"type":"IMAGE_PICKER","id":"profileImage","label":"프로필 이미지"},{"type":"TITLE","content":"📐 레이아웃 설정"},{"type":"RANGE","id":"maxWidth","label":"컨텐츠 최대 너비","min":800,"max":1600,"step":50,"unit":"px","default":1200},{"type":"RANGE","id":"paddingTop","label":"상단 여백","min":0,"max":200,"step":10,"unit":"px","default":64},{"type":"RANGE","id":"paddingBottom","label":"하단 여백","min":0,"max":200,"step":10,"unit":"px","default":64},{"type":"RANGE","id":"paddingHorizontal","label":"좌우 여백","min":0,"max":100,"step":5,"unit":"px","default":40},{"id":"imageWidth","label":"이미지 영역 너비 (PC)","min":200,"max":999,"step":50,"unit":"px","type":"RANGE"},{"type":"RANGE","id":"headerCardGap","label":"이미지 ↔ 텍스트 간격","min":24,"max":120,"step":4,"unit":"px","default":80},{"type":"RANGE","id":"nameBottomGap","label":"이름 ↔ 경력 간격","min":16,"max":64,"step":4,"unit":"px","default":32},{"type":"RANGE","id":"additionalTopGap","label":"경력 ↔ 추가정보 간격","min":16,"max":64,"step":4,"unit":"px","default":24},{"type":"TITLE","content":"🎨 디자인 설정"},{"type":"COLOR_PICKER","id":"backgroundColor","label":"배경색","default":"#FAF8F5"},{"type":"COLOR_PICKER","id":"textColor","label":"기본 텍스트 색상","default":"#4A3F38"},{"type":"COLOR_PICKER","id":"yearBgColor","label":"연도 배경색","default":"#EDE3D8"},{"type":"COLOR_PICKER","id":"yearTextColor","label":"연도 텍스트 색상","default":"#7A5E4E"},{"type":"RANGE","id":"yearBorderRadius","label":"연도 모서리 둥글기","min":0,"max":999,"step":1,"unit":"px","default":999},{"type":"RANGE","id":"lineHeight","label":"줄 간격","min":1.4,"max":2.2,"step":0.1,"unit":"","default":1.75},{"type":"TITLE","content":"✏️ 경력 정보"},{"type":"LIST","id":"experiences","label":"경력 목록","maxCount":50,"settings":[{"type":"TEXT","id":"year","label":"연도 (예: 2025, 前 2019)","default":"2024"},{"type":"TEXT","id":"content","label":"경력 내용","default":""}]},{"type":"RANGE","id":"expPcSize","label":"↳ 경력 PC 글씨 크기","min":12,"max":18,"step":1,"unit":"px","default":14},{"type":"RANGE","id":"expMoSize","label":"↳ 경력 모바일 글씨 크기","min":11,"max":16,"step":1,"unit":"px","default":13},{"type":"TITLE","content":"📝 추가 정보"},{"type":"RICH_TEXT","id":"additionalTitle","label":"추가 정보 제목","default":"<p>Additional Experience</p>"},{"type":"RANGE","id":"additionalTitlePcSize","label":"↳ 제목 PC 글씨 크기","min":9,"max":16,"step":1,"unit":"px","default":11},{"type":"RANGE","id":"additionalTitleMoSize","label":"↳ 제목 모바일 글씨 크기","min":9,"max":14,"step":1,"unit":"px","default":10},{"type":"RICH_TEXT","id":"additionalInfo","label":"추가 정보 내용","default":""},{"type":"RANGE","id":"additionalInfoPcSize","label":"↳ 내용 PC 글씨 크기","min":11,"max":18,"step":1,"unit":"px","default":13},{"type":"RANGE","id":"additionalInfoMoSize","label":"↳ 내용 모바일 글씨 크기","min":10,"max":16,"step":1,"unit":"px","default":12},{"type":"TITLE","content":"🎬 애니메이션 설정"},{"type":"CHECKBOX","id":"enableAnimation","label":"스크롤 애니메이션 사용","default":true},{"type":"RANGE","id":"animationDuration","label":"애니메이션 속도","min":300,"max":1000,"step":100,"unit":"ms","default":600,"isVisible":"property.enableAnimation == true"}],"property":{"name":"<p>홍길동</p>","namePcSize":20,"nameMoSize":18,"title":"<p>웰포슬린 스타트업 창업가</p>","titlePcSize":14,"titleMoSize":13,"profileImage":"","maxWidth":1200,"paddingTop":64,"paddingBottom":64,"paddingHorizontal":40,"imageWidth":350,"headerCardGap":80,"nameBottomGap":32,"additionalTopGap":24,"backgroundColor":"#FFFFFF00","textColor":"#4A3F38","yearBgColor":"#EDE3D8","yearTextColor":"#7A5E4E","yearBorderRadius":999,"lineHeight":1.75,"experiences":[{"year":"現","content":"웰포슬린 스타트업 창업가"},{"year":"2025","content":"경남관광스타트업"},{"year":"2025","content":"부산 아다티 엣 코블 키즈 문화프로그램 강사"},{"year":"2024","content":"한국예술인복지재단 선정 신진예술인"},{"year":"2024","content":"양산교육지원청 학교연계 프로그램 도자기 강사"},{"year":"2023","content":"IPAT 국제 공모전 GOLD 수상"},{"year":"2023","content":"양산청년예술인 전시회 참가"},{"year":"前 2019","content":"NH농협 공채 입사"},{"year":"前 2018","content":"한국마사회 외국인 심판관 등록"},{"year":"前 2012","content":"카타르 외국공공사 승무원 공채 입사"}],"expPcSize":14,"expMoSize":13,"additionalTitle":"<p>Additional Experience</p>","additionalTitlePcSize":11,"additionalTitleMoSize":10,"additionalInfo":"","additionalInfoPcSize":13,"additionalInfoMoSize":12,"enableAnimation":true,"animationDuration":600}}
