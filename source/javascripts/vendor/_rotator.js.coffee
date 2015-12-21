### ===========================================================
# jquery-simple-text-rotator.js v1
# ===========================================================
# Copyright 2013 Pete Rojwongsuriya.
# http://www.thepetedesign.com
#
# A very simple and light weight jQuery plugin that
# allows you to rotate multiple text without changing
# the layout
# https://github.com/peachananr/simple-text-rotator
#
# ==========================================================
###

$(document).ready ->
  $('.rotate').textrotator
    animation: 'fade'
    speed: 1000
  $('.flip').textrotator
    animation: 'flip'
    speed: 1250
  $('.flipCube').textrotator
    animation: 'flipCube'
    speed: 1500
  $('.flipUp').textrotator
    animation: 'flipUp'
    speed: 1750
  $('.spin').textrotator
    animation: 'dissolve'
    speed: 2000
  return

# ---
# generated by js2coffee 2.1.0

!(($) ->
  defaults =
    animation: 'dissolve'
    separator: ','
    speed: 2000

  $.fx.step.textShadowBlur = (fx) ->
    $(fx.elem).prop('textShadowBlur', fx.now).css textShadow: '0 0 ' + Math.floor(fx.now) + 'px black'
    return

  $.fn.textrotator = (options) ->
    settings = $.extend({}, defaults, options)
    @each ->
      el = $(this)
      array = []
      $.each el.text().split(settings.separator), (key, value) ->
        array.push value
        return
      el.text array[0]
      # animation option

      rotate = ->
        switch settings.animation
          when 'dissolve'
            el.animate {
              textShadowBlur: 20
              opacity: 0
            }, 500, ->
              `var index`
              `var initial`
              `var index`
              `var initial`
              `var index`
              `var initial`
              index = $.inArray(el.text(), array)
              if index + 1 == array.length
                index = -1
              el.text(array[index + 1]).animate {
                textShadowBlur: 0
                opacity: 1
              }, 500
              return
          when 'flip'
            if el.find('.back').length > 0
              el.html el.find('.back').html()
            initial = el.text()
            index = $.inArray(initial, array)
            if index + 1 == array.length
              index = -1
            el.html ''
            $('<span class=\'front\'>' + initial + '</span>').appendTo el
            $('<span class=\'back\'>' + array[index + 1] + '</span>').appendTo el
            el.wrapInner('<span class=\'rotating\' />').find('.rotating').hide().addClass('flip').show().css
              '-webkit-transform': ' rotateY(-180deg)'
              '-moz-transform': ' rotateY(-180deg)'
              '-o-transform': ' rotateY(-180deg)'
              'transform': ' rotateY(-180deg)'
          when 'flipUp'
            if el.find('.back').length > 0
              el.html el.find('.back').html()
            initial = el.text()
            index = $.inArray(initial, array)
            if index + 1 == array.length
              index = -1
            el.html ''
            $('<span class=\'front\'>' + initial + '</span>').appendTo el
            $('<span class=\'back\'>' + array[index + 1] + '</span>').appendTo el
            el.wrapInner('<span class=\'rotating\' />').find('.rotating').hide().addClass('flip up').show().css
              '-webkit-transform': ' rotateX(-180deg)'
              '-moz-transform': ' rotateX(-180deg)'
              '-o-transform': ' rotateX(-180deg)'
              'transform': ' rotateX(-180deg)'
          when 'flipCube'
            if el.find('.back').length > 0
              el.html el.find('.back').html()
            initial = el.text()
            index = $.inArray(initial, array)
            if index + 1 == array.length
              index = -1
            el.html ''
            $('<span class=\'front\'>' + initial + '</span>').appendTo el
            $('<span class=\'back\'>' + array[index + 1] + '</span>').appendTo el
            el.wrapInner('<span class=\'rotating\' />').find('.rotating').hide().addClass('flip cube').show().css
              '-webkit-transform': ' rotateY(180deg)'
              '-moz-transform': ' rotateY(180deg)'
              '-o-transform': ' rotateY(180deg)'
              'transform': ' rotateY(180deg)'
          when 'flipCubeUp'
            if el.find('.back').length > 0
              el.html el.find('.back').html()
            initial = el.text()
            index = $.inArray(initial, array)
            if index + 1 == array.length
              index = -1
            el.html ''
            $('<span class=\'front\'>' + initial + '</span>').appendTo el
            $('<span class=\'back\'>' + array[index + 1] + '</span>').appendTo el
            el.wrapInner('<span class=\'rotating\' />').find('.rotating').hide().addClass('flip cube up').show().css
              '-webkit-transform': ' rotateX(180deg)'
              '-moz-transform': ' rotateX(180deg)'
              '-o-transform': ' rotateX(180deg)'
              'transform': ' rotateX(180deg)'
          when 'spin'
            if el.find('.rotating').length > 0
              el.html el.find('.rotating').html()
            index = $.inArray(el.text(), array)
            if index + 1 == array.length
              index = -1
            el.wrapInner('<span class=\'rotating spin\' />').find('.rotating').hide().text(array[index + 1]).show().css
              '-webkit-transform': ' rotate(0) scale(1)'
              '-moz-transform': 'rotate(0) scale(1)'
              '-o-transform': 'rotate(0) scale(1)'
              'transform': 'rotate(0) scale(1)'
          when 'fade'
            el.fadeOut settings.speed, ->
              index = $.inArray(el.text(), array)
              if index + 1 == array.length
                index = -1
              el.text(array[index + 1]).fadeIn settings.speed
              return
        return

      setInterval rotate, settings.speed
      return

  return
)(window.jQuery)

# ---
# generated by js2coffee 2.1.0
