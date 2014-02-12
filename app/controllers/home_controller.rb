class HomeController < ApplicationController
  def index
    @films = Film.viewed.distinct.has_image.order(:views_count).reverse_order
  end

  def search
    @films = []
    @films = Film.search params[:q] if params[:q]
  end
end
