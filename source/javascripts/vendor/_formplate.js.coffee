###*
# jquery.dropdown.js v1.0.0
# http://www.codrops.com
#
# Licensed under the MIT license.
# http://www.opensource.org/licenses/mit-license.php
#
# Copyright 2012, Codrops
# http://www.codrops.com
###

(($, window) ->
  'use strict'

  $.DropDown = (options, element) ->
    @$el = $(element)
    @_init options
    return

  # the options
  $.DropDown.defaults =
    speed: 300
    easing: 'ease'
    gutter: 0
    stack: true
    delay: 0
    random: false
    rotated: false
    slidingIn: false
    onOptionSelect: (opt) ->
      false
  $.DropDown.prototype =
    _init: (options) ->
      # options
      @options = $.extend(true, {}, $.DropDown.defaults, options)
      @_layout()
      @_initEvents()
      return
    _layout: ->
      self = this
      @minZIndex = 1000
      value = @_transformSelect()
      @opts = @listopts.children('li')
      @optsCount = @opts.length
      @size =
        width: @dd.width()
        height: @dd.height()
      elName = @$el.attr('name')
      elId = @$el.attr('id')
      inputName = if elName != undefined then elName else if elId != undefined then elId else 'cd-dropdown-' + (new Date).getTime()
      @inputEl = $('<input type="hidden" name="' + inputName + '" value="' + value + '"></input>').insertAfter(@selectlabel)
      @selectlabel.css 'z-index', @minZIndex + @optsCount
      @_positionOpts()
      if Modernizr.csstransitions
        setTimeout (->
          self.opts.css 'transition', 'all ' + self.options.speed + 'ms ' + self.options.easing
          return
        ), 25
      return
    _transformSelect: ->
      optshtml = ''
      selectlabel = ''
      value = -1
      @$el.children('option').each ->
        $this = $(this)
        val = if isNaN($this.attr('value')) then $this.attr('value') else Number($this.attr('value'))
        classes = $this.attr('class')
        selected = $this.attr('selected')
        label = $this.text()
        if val != -1
          optshtml += if classes != undefined then '<li data-value="' + val + '"><span class="' + classes + '">' + label + '</span></li>' else '<li data-value="' + val + '"><span>' + label + '</span></li>'
        if selected
          selectlabel = label
          value = val
        return
      @listopts = $('<ul/>').append(optshtml)
      @selectlabel = $('<span/>').append(selectlabel)
      @dd = $('<div class="cd-dropdown"/>').append(@selectlabel, @listopts).insertAfter(@$el)
      @$el.remove()
      value
    _positionOpts: (anim) ->
      self = this
      @listopts.css 'height', 'auto'
      @opts.each (i) ->
        $(this).css
          zIndex: self.minZIndex + self.optsCount - 1 - i
          top: if self.options.slidingIn then (i + 1) * (self.size.height + self.options.gutter) else 0
          left: 0
          marginLeft: if self.options.slidingIn then (if i % 2 == 0 then self.options.slidingIn else -self.options.slidingIn) else 0
          opacity: if self.options.slidingIn then 0 else 1
          transform: 'none'
        return
      if !@options.slidingIn
        @opts.eq(@optsCount - 1).css(
          top: if @options.stack then 9 else 0
          left: if @options.stack then 4 else 0
          width: if @options.stack then @size.width - 8 else @size.width
          transform: 'none').end().eq(@optsCount - 2).css(
          top: if @options.stack then 6 else 0
          left: if @options.stack then 2 else 0
          width: if @options.stack then @size.width - 4 else @size.width
          transform: 'none').end().eq(@optsCount - 3).css
          top: if @options.stack then 3 else 0
          left: 0
          transform: 'none'
      return
    _initEvents: ->
      self = this
      @selectlabel.on 'mousedown.dropdown', (event) ->
        if self.opened then self.close() else self.open()
        false
      @opts.on 'click.dropdown', ->
        if self.opened
          opt = $(this)
          self.options.onOptionSelect opt
          self.inputEl.val opt.data('value')
          self.selectlabel.html opt.html()
          self.close()
        return
      return
    open: ->
      self = this
      @dd.toggleClass 'cd-active'
      @listopts.css 'height', (@optsCount + 1) * (@size.height + @options.gutter)
      @opts.each (i) ->
        $(this).css
          opacity: 1
          top: if self.options.rotated then self.size.height + self.options.gutter else (i + 1) * (self.size.height + self.options.gutter)
          left: if self.options.random then Math.floor(Math.random() * 11 - 5) else 0
          width: self.size.width
          marginLeft: 0
          transform: if self.options.random then 'rotate(' + Math.floor(Math.random() * 11 - 5) + 'deg)' else if self.options.rotated then (if self.options.rotated == 'right' then 'rotate(-' + i * 5 + 'deg)' else 'rotate(' + i * 5 + 'deg)') else 'none'
          transitionDelay: if self.options.delay and Modernizr.csstransitions then (if self.options.slidingIn then i * self.options.delay + 'ms' else (self.optsCount - 1 - i) * self.options.delay + 'ms') else 0
        return
      @opened = true
      return
    close: ->
      self = this
      @dd.toggleClass 'cd-active'
      if @options.delay and Modernizr.csstransitions
        @opts.each (i) ->
          $(this).css 'transition-delay': if self.options.slidingIn then (self.optsCount - 1 - i) * self.options.delay + 'ms' else i * self.options.delay + 'ms'
          return
      @_positionOpts true
      @opened = false
      return

  $.fn.dropdown = (options) ->
    instance = $.data(this, 'dropdown')
    if typeof options == 'string'
      args = Array::slice.call(arguments, 1)
      @each ->
        instance[options].apply instance, args
        return
    else
      @each ->
        if instance then instance._init() else (instance = $.data(this, 'dropdown', new ($.DropDown)(options, this)))
        return
    instance

  return
) jQuery, window

# ---
# generated by js2coffee 2.1.0
