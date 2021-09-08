# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.radio').first().css 'background-color', '#ffab35'
  $('.radio').click ->
    $('.radio').css 'background-color', 'transparent'
    $(this).css 'background-color', '#ffab35'
    return
  return
