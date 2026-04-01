'use strict';

/* ── Mobile nav ── */
(function () {
  var toggle = document.querySelector('.nav-toggle');
  var nav    = document.querySelector('#primary-nav');
  if (!toggle || !nav) return;

  toggle.addEventListener('click', function () {
    var open = nav.classList.toggle('open');
    toggle.setAttribute('aria-expanded', String(open));
    toggle.setAttribute('aria-label', open ? 'Close navigation' : 'Open navigation');
  });

  document.addEventListener('click', function (e) {
    if (!nav.contains(e.target) && !toggle.contains(e.target) && nav.classList.contains('open')) {
      nav.classList.remove('open');
      toggle.setAttribute('aria-expanded', 'false');
    }
  });

  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape' && nav.classList.contains('open')) {
      nav.classList.remove('open');
      toggle.setAttribute('aria-expanded', 'false');
      toggle.focus();
    }
  });

  nav.querySelectorAll('a').forEach(function (a) {
    a.addEventListener('click', function () {
      nav.classList.remove('open');
      toggle.setAttribute('aria-expanded', 'false');
    });
  });
}());

/* ── Nav scroll shadow ── */
(function () {
  var nav = document.querySelector('.nav');
  if (!nav) return;
  window.addEventListener('scroll', function () {
    nav.classList.toggle('scrolled', window.scrollY > 4);
  }, { passive: true });
}());

/* ── Scroll reveal ── */
(function () {
  if (!('IntersectionObserver' in window)) return;

  var targets = document.querySelectorAll(
    '.why-card, .service-card, .step-card, .testi-card, .stat-card, .cta-card, .section-head, .strip-quote'
  );

  targets.forEach(function (el, i) {
    el.classList.add('reveal');
    el.style.transitionDelay = ((i % 6) * 55) + 'ms';
  });

  var io = new IntersectionObserver(function (entries) {
    entries.forEach(function (entry) {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        io.unobserve(entry.target);
      }
    });
  }, { threshold: 0.08, rootMargin: '0px 0px -24px 0px' });

  targets.forEach(function (el) { io.observe(el); });
}());

/* ── Smooth anchor scroll ── */
(function () {
  document.querySelectorAll('a[href^="#"]').forEach(function (a) {
    a.addEventListener('click', function (e) {
      var id = this.getAttribute('href').slice(1);
      if (!id) return;
      var target = document.getElementById(id);
      if (!target) return;
      e.preventDefault();
      var navH = (document.querySelector('.nav') || {}).offsetHeight || 68;
      window.scrollTo({ top: target.getBoundingClientRect().top + window.scrollY - navH - 16, behavior: 'smooth' });
    });
  });
}());
