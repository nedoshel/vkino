class FilmsController < InheritedResources::Base
  actions :all

  def parse
    @film = Kinopoisk::Movie.new(params[:url])
    render json: {
      title: @film.title, countries: @film.countries, year: @film.year, actors: @film.cast_members,
      slogan: @film.slogan, director: @film.director, budget: @film.budget.to_s.gsub(" ",""), director: @film.director,
      rating: @film.rating, duration: @film.duration, poster: @film.poster ? "http://st.kp.yandex.net#{@film.poster}" : nil
    }
  end

  private

    def permitted_params
      params.permit(film: [:directors, :url, :image, :remote_image_url, :title, :year, :slogan, :director_id, :budget, :rating, :our_rating, :duration, country_ids: []])
    end

  protected

    def collection
      @projects ||= end_of_association_chain.paginate page: params[:page], per_page: Setting.films_per_page
    end
end
