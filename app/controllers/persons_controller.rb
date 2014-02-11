class PersonsController < InheritedResources::Base
  defaults resource_class: Tag, collection_name: 'tags', instance_name: 'tag'

  private

    def permitted_params
      params.permit( tag: [:name, film_ids: []])
    end

  protected

    def collection
      col = @tags || end_of_association_chain
      col = col.actors if params[:filter] == 'actors'
      col = col.directors if params[:filter] == 'directors'
      col.includes(:taggings).paginate page: params[:page], per_page: Setting.films_per_page
    end

end
