class FilmsController < InheritedResources::Base
  actions :all

  def index
  end

  private

  def permitted_params
    params.permit(film: [:image, :title, :year, :slogan, :director_id, :budget, :rating, :our_rating, :duration, country_ids: []])
  end
end
