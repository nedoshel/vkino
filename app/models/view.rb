class View < ActiveRecord::Base
  belongs_to :viewable, polymorphic: true, counter_cache: :views_count
end
