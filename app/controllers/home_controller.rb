class HomeController < ApplicationController
  def index
    @films = Film.has_image.first(5)
  end
end
