# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# TODO: use some damn templates!

onReady = (e) ->
  $.when(
    $.ajax('https://api.github.com/repos/falquan/skwandr/commits?sha=develop')
  ).then (data, textStatus, jqXHR) ->
    changelog = $('aside #changelog')
    if textStatus == 'success'
      htmlData = parseJson data.slice 0, 10
      changelog.append htmlData
    else
      changelog.append '<div class="error">Could not retrieve GitHub log.</div>' 


parseJson = (json) ->
  html = '<ul>'

  json.forEach (checkin) ->
    html += '<li>'
    html += '<div>'+checkin.commit.message+'</div>'
    html += '<div><a href="'+checkin.html_url+'">'+checkin.sha+'</a></div>'
    if checkin.author
      html += '<div><a href="'+checkin.author.html_url+'">'+checkin.author.login+'</a></div>'
    else
      html += '<div>'+checkin.commit.author.email+'</div>'      
    html += '</li>'

  html += '</ul>'

$(document).on 'ready page:change', onReady
