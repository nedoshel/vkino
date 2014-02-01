$(document)
  .on 'click', '.js-add-film-view', (e) ->
    e.preventDefault()
    route =  Routes.views_path( $(@).data('viewable-type'), $(@).data('viewable-id') )
    $.ajax route,
      type: 'POST'
      dataType: 'json'
      data: {}
      error: (jqXHR, textStatus, errorThrown) ->
          console.log textStatus
      success: (data, textStatus, jqXHR) ->
          $(".film[data-id=#{data.viewable_id}]").find(".js-views-count").text data.views_count

  .on 'click', '.js-remove-film-view', (e) ->
    e.preventDefault()
    route =  Routes.view_path( $(@).data('viewable-type'), $(@).data('viewable-id') )
    $.ajax route,
      type: 'DELETE'
      dataType: 'json'
      data: {}
      error: (jqXHR, textStatus, errorThrown) ->
          console.log textStatus
      success: (data, textStatus, jqXHR) ->
          $(".film[data-id=#{data.viewable_id}]").find(".js-views-count").text data.views_count
  .on 'click', '.js-colobox-image', (e) ->
    e.preventDefault()
    imgSrc = $(@).data "src"
    $.colorbox
      html: "<img src=\"#{imgSrc}\">"