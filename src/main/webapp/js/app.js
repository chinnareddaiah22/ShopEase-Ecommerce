document.addEventListener("DOMContentLoaded", () => {
  const toggle = document.querySelector("[data-nav-toggle]");
  const menu = document.querySelector("[data-nav-menu]");

  if (toggle && menu) {
    toggle.addEventListener("click", () => {
      const open = menu.classList.toggle("open");
      toggle.setAttribute("aria-expanded", String(open));
    });

    menu.querySelectorAll("a").forEach(link => {
      link.addEventListener("click", () => {
        menu.classList.remove("open");
        toggle.setAttribute("aria-expanded", "false");
      });
    });
  }

  document.querySelectorAll('input[type="number"]').forEach(input => {
    input.addEventListener("input", () => {
      const min = Number(input.min || 1);
      const max = input.max ? Number(input.max) : Infinity;
      let value = Number(input.value || min);
      if (value < min) value = min;
      if (value > max) value = max;
      input.value = value;
    });
  });
});
