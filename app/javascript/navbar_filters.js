// document.addEventListener("DOMContentLoaded", () => {
//   const searchBar = document.querySelector(".search-bar");
//   const filterButtons = document.querySelector(".filter-bar-buttons");

//   if (searchBar && filterButtons) {
//     filterButtons.style.display = "none"; // Cache les boutons au chargement

//     searchBar.addEventListener("focus", () => {
//       filterButtons.style.display = "flex"; // Affiche les boutons lors du focus
//     });

//     searchBar.addEventListener("blur", () => {
//       setTimeout(() => {
//         filterButtons.style.display = "none"; // Cache les boutons après une petite pause
//       }, 200);
//     });  
//   }
// });


document.addEventListener("DOMContentLoaded", () => {
  const searchBar = document.querySelector(".search-bar");
  const filterButtons = document.querySelector(".filter-bar-buttons");
  let isInteractingWithDropdown = false; // Flag pour suivre les interactions avec les dropdowns

  if (searchBar && filterButtons) {
    filterButtons.style.display = "none"; // Cache les boutons au chargement

    searchBar.addEventListener("focus", () => {
      filterButtons.style.display = "flex"; // Affiche les boutons lors du focus
    });

    searchBar.addEventListener("blur", () => {
      setTimeout(() => {
        if (!isInteractingWithDropdown) {
          filterButtons.style.display = "none"; // Cache les boutons si pas d'interaction avec les dropdowns
        }
      }, 200);
    });

    // Gérer les interactions avec les dropdowns
    const dropdowns = document.querySelectorAll(".dropdown-menu");
    dropdowns.forEach((dropdown) => {
      dropdown.addEventListener("mouseenter", () => {
        isInteractingWithDropdown = true; // Interaction avec le dropdown commence
      });
      dropdown.addEventListener("mouseleave", () => {
        isInteractingWithDropdown = false; // Interaction avec le dropdown termine
      });
    });

    // Empêcher de masquer les boutons lors d'un clic sur les dropdowns
    filterButtons.addEventListener("mouseenter", () => {
      isInteractingWithDropdown = true;
    });
    filterButtons.addEventListener("mouseleave", () => {
      isInteractingWithDropdown = false;
    });
  }
});
