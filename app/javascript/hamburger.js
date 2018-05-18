export default window.onload = function () {
  const navHamburger = document.querySelector('[data-attribute="navHamburger"]')
  navHamburger.addEventListener('click', function (event) {
    event.preventDefault()
    document.querySelector('.c-nav__toggle').classList.toggle('c-nav-active__toggle')
    document.querySelector('.c-nav').classList.toggle('c-nav-active')
  })
}
