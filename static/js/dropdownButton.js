function menuButton() {
  document.getElementById("menuDropdown").classList.toggle("show");
  document.getElementById("menuButton").classList.toggle("change");
}

window.onclick = function(event) {
  if (!event.target.matches('.menuButton')) {
      var dropdowns = document.getElementsByClassName("dropdown-content");
      for (i = 0; i < dropdowns.length; i++) {
          var openDropdown = dropdowns[i];
          if (openDropdown.classList.contains('show')) {
              openDropdown.classList.remove('show');
          }
      }
      var menuButton = document.getElementById("menuButton");
      if (menuButton.classList.contains('change')) {
          menuButton.classList.remove('change');
      }
      var dropDown = document.getElementById("myDropdown");
      if (dropDown.classList.contains('show')) {
          dropDown.classList.remove('show');
      }
  }
}