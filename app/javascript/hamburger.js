export default window.onload = function () {
  const navHamburger = document.querySelector('[data-attribute="navHamburger"]')
  navHamburger.addEventListener('click', function (event) {
    event.preventDefault()
    document.querySelector('[data-attribute="navHamburger"]').classList.toggle('c-nav-active__toggle')
    document.querySelector('[data-attribute="navHamburger-wrapper"]').classList.toggle('c-nav-active')
  })
}
