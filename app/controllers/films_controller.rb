class FilmsController < InheritedResources::Base

  def parse
    @film = Kinopoisk::Movie.new(params[:url])
    render json: {
      title: @film.title, countries: @film.countries, year: @film.year, actors: @film.cast_members.first(6),
      slogan: @film.slogan, director: @film.director, budget: @film.budget.to_s.gsub(" ",""), director: @film.director,
      rating: @film.rating, duration: @film.duration, poster: @film.poster ? "http://st.kp.yandex.net#{@film.poster}" : nil
    }
  end

  def update
    update! do |format|
      if request.xhr?
        format.js { render json: @film }
      else
        format.html { redirect_to film_path(@film) }
      end
    end
  end

  private

    def permitted_params
      params.permit(film: [:url, :actor_list, :director_list, :image, :is_viewed, :remote_image_url, :title, :year, :slogan, :budget, :rating, :our_rating, :duration, country_ids: []])
    end

  protected

    def collection
      col = @films || end_of_association_chain
      col = col.viewed if params[:filter] == 'viewed'
      col = col.unviewed if params[:filter] == 'unviewed'
      col.includes(:countries).paginate page: params[:page], per_page: Setting.films_per_page
    end
end
