$(document)
  # submit ajax form
  .on "click", '.ajax-form [type="checkbox"]', (e) ->
    $(@).closest('.ajax-form').submit()
    if $(".js-is-viewed-filter").data("filter")
      $(@).closest('.film').remove()

  # Фильтр просмотреных
  .on 'click', '.js-is-viewed-filter', (e) ->
    if $(@).data("filter") == "viewed"
      location.href = Routes.films_path()
    else
      location.href = Routes.filter_films_path(filter: "viewed")

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

          # Режиссер
          if data.director
            $('#film_director_list').val data.director

          # Актеры
          if data.actors
            $('#film_actor_list').val data.actors
