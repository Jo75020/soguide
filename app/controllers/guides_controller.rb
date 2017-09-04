class GuidesController < ApplicationController

  def show
  @guide = Guide.find(params[:id])
  end

  def create
    @guide = Guide.create(guide_params)
    @user = User.create(user_params)
  end

  def user_params
    params.require(:guide).permit(:first_name, :last_name, :email, :mobile_phone, :phone, :regions, :guide_type, :experience, :structure, :structure_website, :license, :language, :soguide_description, :main_review, :soguide_url, :pays)
  end

  def guide_params
    params.require(:guide).permit(:first_name, :last_name, :email, :mobile_phone, :phone, :regions, :guide_type, :experience, :structure, :structure_website, :license, :language, :soguide_description, :main_review, :soguide_url, :pays)
  end
end
