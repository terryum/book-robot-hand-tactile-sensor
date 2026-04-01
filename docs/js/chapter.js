/* ============================================
   Tactile Sensing for Robot Hands — Chapter JS
   GSAP ScrollTrigger animations, sidebar nav
   ============================================ */

document.addEventListener('DOMContentLoaded', function() {

  // --- GSAP ScrollTrigger Animations ---
  if (typeof gsap !== 'undefined' && typeof ScrollTrigger !== 'undefined') {
    gsap.registerPlugin(ScrollTrigger);

    // Section enter animations
    gsap.utils.toArray('.content-section').forEach((section, i) => {
      gsap.from(section, {
        scrollTrigger: {
          trigger: section,
          start: 'top 85%',
          toggleActions: 'play none none reverse'
        },
        y: 40,
        opacity: 0,
        duration: 0.8,
        delay: i * 0.05
      });
    });

    // Chapter header animation
    const header = document.querySelector('.chapter-header');
    if (header) {
      gsap.from(header, {
        y: 30,
        opacity: 0,
        duration: 1,
        ease: 'power2.out'
      });
    }

    // Figure animations
    gsap.utils.toArray('figure').forEach(fig => {
      gsap.from(fig, {
        scrollTrigger: {
          trigger: fig,
          start: 'top 85%',
          toggleActions: 'play none none reverse'
        },
        y: 30,
        opacity: 0,
        duration: 0.6
      });
    });

    // Table animations
    gsap.utils.toArray('.styled-table').forEach(table => {
      gsap.from(table, {
        scrollTrigger: {
          trigger: table,
          start: 'top 85%',
          toggleActions: 'play none none reverse'
        },
        y: 20,
        opacity: 0,
        duration: 0.6
      });
    });
  } else {
    // Fallback: just make everything visible
    document.querySelectorAll('.content-section').forEach(el => {
      el.classList.add('visible');
    });
  }

  // --- Sidebar Dot Navigation ---
  const sidebarNav = document.querySelector('.sidebar-nav');
  const sections = document.querySelectorAll('.content-section[id]');

  if (sidebarNav && sections.length > 0) {
    // Update active dot on scroll
    const observerOptions = {
      rootMargin: '-20% 0px -70% 0px',
      threshold: 0
    };

    const sectionObserver = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const id = entry.target.id;
          document.querySelectorAll('.sidebar-nav .nav-dot').forEach(dot => {
            dot.classList.toggle('active', dot.getAttribute('data-section') === id);
          });
        }
      });
    }, observerOptions);

    sections.forEach(section => sectionObserver.observe(section));

    // Click to scroll
    sidebarNav.querySelectorAll('.nav-dot').forEach(dot => {
      dot.addEventListener('click', () => {
        const targetId = dot.getAttribute('data-section');
        const target = document.getElementById(targetId);
        if (target) {
          target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
      });
    });
  }
});
