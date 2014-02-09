# Настройки

class Setting
  class << self

    def films_per_page
      CONFIG[Rails.env]["films_per_page"]
    end

  end
end
