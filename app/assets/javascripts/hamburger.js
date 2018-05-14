$(function () {
  const navHamburger = $('#navHamburger')
  navHamburger.click(function (e) {
    e.preventDefault()
    $('.c-nav__toggle').toggleClass('c-nav-active__toggle')
    $('.c-nav').toggleClass('c-nav-active')
  })
})
