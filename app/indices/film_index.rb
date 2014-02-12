ThinkingSphinx::Index.define :film, with: :active_record do
  indexes title, sortable: true
end
