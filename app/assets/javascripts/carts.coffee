# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('[name="quantity"]').keyup ->
  if parseInt($(this).val()) < 1
    $('#div1').html 'value cannot be less than 1'
    $(this).val 1
  else
    $('#div1').html ''
  return
