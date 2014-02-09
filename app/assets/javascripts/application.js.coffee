#= require jquery
#= require jquery_ujs
#= require js-routes
#= require bootstrap_and_overrides
#= require turbolinks
#= require colorbox-rails

#= require chosen-jquery

#= require films
#= require home
#= require views
#= require_self

$(document).on 'ready page:load', ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'Ничего не найдено...'
    width: '100%'
    inherit_select_classes: true

  $(".js-colorbox-image").colorbox()

  $('[title]').tooltip
    container: 'body'
    placement: 'right'