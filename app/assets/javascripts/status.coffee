# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# TODO: kill ERB

onReady = (e) ->
  $.when(
    $.ajax('https://api.github.com/repos/falquan/skwandr/commits?sha=develop')
  ).then (data, textStatus, jqXHR) ->
    renderChangelog = Handlebars.compile($('#changelog-template').html());    
    $('aside #changelog').html renderChangelog({ checkin: data[0..9] })

$(document).on 'ready page:change', onReady
