$(document).ready ->
  $(".nav__hamburger").click ->
    $(".nav__nav--mobile").toggleClass("is-open")
    $(".nav__hamburger").toggleClass("switch")


# # bankCard
# bankCard = $(".js__bankCardButton")
# bankCardView = $(".js__bankCardInterface")
#
# # mobile wallet
# mobileWallet = $(".js__mobileWalletButton")
# var mobileWalletView = $(".js__mobileWalletInterface")
#
#
# $(document).ready ->
#   $(mobileWallet).click ->
#     alert "hello"

$(document).ready ->
  $(".js__bankCardButton").click ->
    $(".js__bankCardButton, .js__bankCardInterface").addClass("js--active")
    $(".js__mobileWalletInterface, .js__mobileWalletButton").removeClass("js--active")

  $(".js__mobileWalletButton").click ->
    $(".js__mobileWalletButton, .js__mobileWalletInterface").addClass("js--active")
    $(".js__bankCardButton, .js__bankCardInterface").removeClass("js--active")

  $(".checkbox").click ->
    $(".PayForm__registerCustomerInformation, .PayForm__notification").toggleClass("js--active")
