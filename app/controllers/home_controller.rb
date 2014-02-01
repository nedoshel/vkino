class HomeController < ApplicationController
  def index
    @films = Film.joins(:views).distinct.has_image.order(:views_count).reverse_order
  end
end
