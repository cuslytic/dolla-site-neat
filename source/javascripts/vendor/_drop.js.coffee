$(document).ready ->
  $(".dropdown__button").click ->
    $button = $(this)
    $menu = $button.siblings(".dropdown__menu")
    $menu.toggleClass "show-menu"
    $menu.children("li").click ->
      $menu.removeClass "show-menu"
      $button.html $(this).html()
      return
    return
  return
