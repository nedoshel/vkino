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

  .on 'click', '.js-film-url' , (e) ->
    url = $('#film_url').val()
    e.preventDefault()
    if url.length
      $.ajax Routes.parse_films_path(),
        type: 'GET'
        dataType: 'json'
        data: { url: url }
        error: (jqXHR, textStatus, errorThrown) ->
          console.log textStatus
        success: (data, textStatus, jqXHR) ->
          # Название
          if data.title
            $('#film_title').val data.title

          # Год
          if data.year
            $('#film_year').val data.year

          # Страны
          if data.countries
            options = []
            for countryName in data.countries
              for country in $('#film_country_ids').find("option:contains(#{countryName})")
                options.push $(country).attr "value"  if $(country).text().length == countryName.length
          if options
            $("select.chosen-select").val(options)
            $("select.chosen-select").trigger 'chosen:updated'

          # Слоган
          if data.slogan
            $('#film_slogan').val data.slogan

          # Бюджет
          if data.budget
            $('#film_budget').val data.budget

          # Рейтинг
          if data.rating
            $('#film_rating').val data.rating

          # Длительность
          if data.duration
            $('#film_duration').val data.duration

          # Бюджет
          if data.budget
            $('#film_budget').val parseInt(data.budget.replace(/\s+/g,""))

          # Постер
          if data.poster
            $('#film_remote_image_url').val data.poster

          # Постер
          if data.director
            $('#film_directors').val data.director




