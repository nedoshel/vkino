class ViewsController < ApplicationController

  def create
    view = View.create view_params
    render json: { views_count: view.viewable.reload.views_count, viewable_id: view.viewable_id }
  end

  def destroy
    viewable = class_eval(params[:viewable_type]).find_by_id params[:viewable_id]
    viewable.views.last.try(:destroy)
    render json: { views_count: viewable.reload.views_count, viewable_id: viewable.id }
  end

  private

  def view_params
    params.permit(:viewable_type, :viewable_id)
  end
end
