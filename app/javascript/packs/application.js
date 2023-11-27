// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

function startCountdown() {
  const startText = document.getElementById("fasting_start").textContent;
  const endText = document.getElementById("fasting_end").textContent;
  const countdownContainer = document.getElementById("countdown");
  const start = new Date(startText).getTime();
  const end = new Date(endText).getTime();

  // Obtenir l'heure actuelle
  const now = new Date().getTime();

  // Vérifier si l'heure actuelle est supérieure à l'heure de début
  if (now >= start) {
    const distanceBase = end - now;

    let remainingTime = parseInt(distanceBase);
    const interval = setInterval(function () {
      const hours = Math.floor(remainingTime / 3600000);
      const minutes = Math.floor((remainingTime % 3600000) / 60000);
      const seconds = Math.floor((remainingTime % 60000) / 1000);

      countdownContainer.innerHTML = `${hours}h ${minutes}m ${seconds}s avant la fin du jeûne`;

      if (remainingTime <= 0) {
        clearInterval(interval);
        countdownContainer.innerHTML = "Le jeûne est terminé !";
      } else {
        remainingTime -= 1000;
      }
    }, 1000);
  } else {
    // L'heure actuelle n'a pas encore atteint l'heure de début
    countdownContainer.innerHTML = "En attente du début du jeûne...";
  }
}
// Appel de la fonction pour démarrer le compte à rebours au chargement de la page
window.onload = startCountdown;

function test() {
  let progressBar = document.querySelector(".circular-progress");
  let valueContainer = document.querySelector(".value-container");

  let progressValue = 0;
  let progressEndValue = end;
  let speed = 50;

  let progress = setInterval(() => {
    progressValue++;
    valueContainer.textContent = `${progressValue}%`;
    progressBar.style.background = `conic-gradient(
      rgba(44, 181, 90, 0.95) ${progressValue * 3.6}deg,
      rgba(44, 181, 90, 0.25) ${progressValue * 3.6}deg
  )`;
    if (progressValue == progressEndValue) {
      clearInterval(progress);
    }
  }, speed);
}
window.onload = test;

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
