# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# TODO: use some damn templates!

onReady = (e) ->
  $.when(
    $.ajax('https://api.github.com/repos/falquan/skwandr/commits?sha=develop')
  ).then (data, textStatus, jqXHR) ->
    changelog = $('aside #changelog')
    if textStatus is 'success'
      changelog.append renderJson data[0..9]
    else
      changelog.append '<div class="error">Could not retrieve GitHub log.</div>' 

renderJson = (json) ->
  html = '<ul>'

  json.forEach (checkin) ->
    html += '<li>'
    html += '<div>' + new Date(checkin.commit.author.date).toLocaleString() + '</div>'
    html += '<div>' + checkin.commit.message + '</div>'
    html += '<div><a href="' + checkin.html_url + '">' + checkin.sha[0..7] + '...</a></div>'
    if checkin.author?
      html += '<div><a href="' + checkin.author.html_url + '">' + checkin.author.login + '</a></div>'
    else
      html += '<div>' + checkin.commit.author.email + '</div>'      
    html += '</li>'

  html += '</ul>'

createLine = (checkin) ->


$(document).on 'ready page:change', onReady
