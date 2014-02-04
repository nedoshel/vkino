class FilmsController < InheritedResources::Base
  actions :all

  def index
  end

  def parse
    @film = Kinopoisk::Movie.new(params[:url])
    render json: {
      title: @film.title, countries: @film.countries, year: @film.year,
      slogan: @film.slogan, director: @film.director, budget: @film.budget.to_s.gsub(" ",""),
      rating: @film.rating, duration: @film.duration, poster: @film.poster ? "http://st.kp.yandex.net#{@film.poster}" : nil
    }
  end

  private

  def permitted_params
    params.permit(film: [:url, :image, :remote_image_url, :title, :year, :slogan, :director_id, :budget, :rating, :our_rating, :duration, country_ids: []])
  end
end
