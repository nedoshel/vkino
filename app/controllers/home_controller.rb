class HomeController < ApplicationController
  def index
    @films = Film.has_image
  end
end
