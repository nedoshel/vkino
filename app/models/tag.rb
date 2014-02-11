class Tag < ActsAsTaggableOn::Tag

  scope :actors, -> { joins(:taggings).where(taggings: { context: "actors"}).distinct }
  scope :directors, -> { joins(:taggings).where(taggings: { context: "directors"}).distinct }

  has_many :films, through: :taggings, uniq: true, source: :taggable, source_type: 'Film'
end
