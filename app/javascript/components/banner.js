import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Welcome to the Star Wars universe!", "Check out every character here"],
    typeSpeed: 50,
    backSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
