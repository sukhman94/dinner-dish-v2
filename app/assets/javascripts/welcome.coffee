# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
###
# Welcome to the new js2coffee 2.0, now
# rewritten to use the esprima parser.
# try it out!
###

### Navbar scroll ###
$(document).on 'turbolinks:load', ->

  $ ->
    nav = $('.navbar')
    doc = $(document)
    win = $(window)
    win.scroll ->
      if doc.scrollTop() > 80
        nav.addClass 'scrolled'
      else
        nav.removeClass 'scrolled'
      return
    win.scroll()
    return

  ### ***** Btn More-Less ***** ###

  $('#more').click ->
    $this = $(this)
    $this.toggleClass 'more'
    if $this.hasClass('more')
      $this.text 'More'
    else
      $this.text 'Less'
    return

  ### ***** Slideanim  ***** ###

  $(window).scroll ->
    $('.slideanim').each ->
      pos = $(this).offset().top
      winTop = $(window).scrollTop()
      if pos < winTop + 600
        $(this).addClass 'slide'
      return
    return

  ### ***** Smooth Scrolling  ***** ###

  $(document).ready ->
    $('.navbar a, #service a').on 'click', (event) ->
      if @hash != ''
        event.preventDefault()
        hash = @hash
        $('html, body').animate { scrollTop: $(hash).offset().top }, 900, ->
          window.location.hash = hash
          return
      return

    ### ***** Scroll to Top ***** ###

  $(window).scroll ->
    if $(this).scrollTop() >= 300
      $('.to-top').fadeIn 200
    else
      $('.to-top').fadeOut 200
    return
  $('.to-top').click ->
    $('.body,html').animate { scrollTop: 0 }, 500
    return
  return



