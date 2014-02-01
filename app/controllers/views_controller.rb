class ViewsController < ApplicationController

  def create
    @view = View.create view_params
  end

  private

  def view_params
    params.permit(view: [:viewable_type, :viewable_id])
  end
end
