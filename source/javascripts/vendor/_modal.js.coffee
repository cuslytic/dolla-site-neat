$ ->
  $('#modal__1').on 'change', ->
    if $(this).is(':checked')
      $('body').addClass 'modal-open'
    else
      $('body').removeClass 'modal-open'
    return
  $('.modal__closeButton, .modal__close').on 'click', ->
    $('.modal__state:checked').prop('checked', false).change()
    return
  $('.modal__inner').on 'click', (e) ->
    e.stopPropagation()
    return
  return

$ ->
  $('#modal__2').on 'change', ->
    if $(this).is(':checked')
      $('body').addClass 'modal-open'
    else
      $('body').removeClass 'modal-open'
    return
  $('.modal__closeButton, .modal__close').on 'click', ->
    $('.modal__state:checked').prop('checked', false).change()
    return
  $('.modal__inner').on 'click', (e) ->
    e.stopPropagation()
    return
  return


$ ->
  $('#modal__3').on 'change', ->
    if $(this).is(':checked')
      $('body').addClass 'modal-open'
    else
      $('body').removeClass 'modal-open'
    return
  $('.modal__closeButton, .modal__close').on 'click', ->
    $('.modal__state:checked').prop('checked', false).change()
    return
  $('.modal__inner').on 'click', (e) ->
    e.stopPropagation()
    return
  return
