# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

onReady = (e) ->
	$('.quick-set').click (e) ->
		e.preventDefault()

		me = $(this)
		seconds = me.data('duration')
		$('#incident_duration').val(seconds)

$(document).on 'ready page:change', onReady
