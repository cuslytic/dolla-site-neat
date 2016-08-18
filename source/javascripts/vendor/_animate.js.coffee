$ ->
  invisible = 'invisible'
  animationClasses = 'animated alternate iteration zoomOut'
  animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend'
  $('.animate-trigger').on 'click', ->
    $('.animate-target').addClass(animationClasses).one animationEnd, ->
      $(this).removeClass animationClasses
      $('.md-head-box').addClass('.invisible')
      return
    return
  return

  $('.go-trigger').on 'click', ->
    return
  return
