#= require jquery
#= require jquery_ujs
#= require js-routes
#= require bootstrap_and_overrides
#= require turbolinks
#= require chosen-jquery
#= require colorbox-rails
#= require_tree .

$(document).on 'ready page:load', ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'Ничего не найдено...'
    width: '100%'
    inherit_select_classes: true