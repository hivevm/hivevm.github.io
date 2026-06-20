// Current year
    document.getElementById('year').textContent = new Date().getFullYear();

    // Mobile menu
    for (const nav of document.querySelectorAll('[data-nav]')) {
      const button = nav.querySelector('[data-menu-button]');
      const panel = nav.querySelector('[data-menu-panel]');
      if (!button || !panel) continue;
      const isOpen = () => button.getAttribute('aria-expanded') === 'true';
      const setOpen = (open) => {
        button.setAttribute('aria-expanded', String(open));
        panel.toggleAttribute('data-open', open);
      };
      button.addEventListener('click', () => setOpen(!isOpen()));
      panel.addEventListener('click', (e) => {
        if (e.target.closest('a')) setOpen(false);
      });
      document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && isOpen()) { setOpen(false); button.focus(); }
      });
    }

    // Tabs (with arrow-key support)
    for (const root of document.querySelectorAll('[data-tabs]')) {
      const tabs = [...root.querySelectorAll('[role="tab"]')];
      const panels = [...root.querySelectorAll('[role="tabpanel"]')];
      const select = (i, focus = true) => {
        tabs.forEach((tab, j) => {
          const active = j === i;
          tab.setAttribute('aria-selected', String(active));
          tab.tabIndex = active ? 0 : -1;
          if (panels[j]) panels[j].toggleAttribute('hidden', !active);
        });
        if (focus) tabs[i].focus();
      };
      tabs.forEach((tab, i) => {
        tab.addEventListener('click', () => select(i, false));
        tab.addEventListener('keydown', (e) => {
          const map = { ArrowRight: (i + 1) % tabs.length, ArrowLeft: (i - 1 + tabs.length) % tabs.length, Home: 0, End: tabs.length - 1 };
          const t = map[e.key];
          if (t === undefined) return;
          e.preventDefault();
          select(t);
        });
      });
    }

    // Scroll reveal
    const reveals = document.querySelectorAll('[data-reveal]');
    if ('IntersectionObserver' in window && !matchMedia('(prefers-reduced-motion: reduce)').matches) {
      const io = new IntersectionObserver((entries) => {
        for (const entry of entries) {
          if (entry.isIntersecting) { entry.target.classList.add('in'); io.unobserve(entry.target); }
        }
      }, { rootMargin: '0px 0px -10% 0px', threshold: 0.08 });
      reveals.forEach((el) => io.observe(el));
    } else {
      reveals.forEach((el) => el.classList.add('in'));
    }
