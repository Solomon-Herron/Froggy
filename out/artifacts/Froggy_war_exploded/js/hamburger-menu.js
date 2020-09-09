const body =  document.body;
const underline = document.querySelector(".underline");
body.addEventListener("onload", () => {
    underline.classList.toggle("change");
});


const menuIcon = document.querySelector(".hamburger-menu");
const navbar = document.querySelector(".navbar");

menuIcon.addEventListener("click", () => {
    navbar.classList.toggle("change");
});