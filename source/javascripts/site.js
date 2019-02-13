// Dirty hack to get font-display: swap for googlefonts.
// Source: https://googlefonts.3perf.com
!function() {
  var t = "https://fonts.googleapis.com/css?family=PT+Mono&subset=cyrillic",
      n = "__gFS";

  function e() {
      var e = document.createElement("link");
      e.href = t, e.rel = "stylesheet", (document.head || document.body).appendChild(e)
  }

  function o(e) {
      var t = e.replace(/@font-face {/g, "@font-face {\n  font-display: swap;"),
          n = document.createElement("style");
      n.innerHTML = t, (document.head || document.body).appendChild(n)
  }
  if (window.FontFace && window.FontFace.prototype.hasOwnProperty("display")) {
      if (localStorage.getItem(n)) return o(localStorage.getItem(n)), fetch(t).then(function() {});
      fetch(t).then(function(e) {
          return e.text()
      }).then(function(e) {
          return localStorage.setItem(n, e), e
      }).then(o).catch(e)
  } else e()
}();
