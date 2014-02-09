class HomeController < ApplicationController
  def index
    @films = Film.viewed.distinct.has_image.order(:views_count).reverse_order
  end
end
