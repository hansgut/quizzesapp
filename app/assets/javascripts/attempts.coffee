# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#$('#confirm').closest('i').removeClass('disabled')
jQuery ->
  $('form').on 'click', 'input[type="checkbox"]', (event) ->
    n_tabs = $('.tab-info').length
    check = []
    $('.tab-info').each ->
      $(this).find('input[type="checkbox"]').each ->
        if $(this).prop('checked')
          check.push(true)
          return false
    if n_tabs == check.length
      $('#confirm').closest('i').removeClass('disabled')
    else
      $('#confirm').closest('i').addClass('disabled')
