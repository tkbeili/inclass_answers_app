# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "focus", "#answer_body", ->
  $("#answer-errors").slideUp 500, ->
    $("#answer-errors").html ""