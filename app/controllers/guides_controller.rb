class GuidesController < ApplicationController
skip_before_action :authenticate_user!, only: [:show, :index]

  def show
  @message = Message.new
  @user = current_user
  @review = Review.new
  @guide = Guide.find(params[:id])
  @trips = Trip.where(guide_id: @guide)
  @countries = Country.where(name: @guide.pays)
  @reviews = Review.where(guide_id: @guide.id, checked: true)
  @countries.each do |country|
    @guides = Guide.where(pays: country.name)
  end
  end

  def create
    @guide = Guide.create(guide_params)
    @user = User.create(user_params)
  end


  def check_in
      @guide = Guide.find(params[:guide_id])
      @user = current_user
      @message = params[:message][:body]
      GuideMailer.guide_check_in(@guide, @user, @message).deliver_now
  end


  private


  def user_params
    params.require(:guide).permit(:first_name, :last_name, :email, :mobile_phone, :phone, :regions, :guide_type, :experience, :structure, :structure_website, :license, :language, :soguide_description, :main_review, :soguide_url, :pays, :secondary_email, :pays_2, :facebook_profil_url, :facebook_profil_page, :gender)
  end

  def guide_params
    params.require(:guide).permit(:first_name, :last_name, :email, :mobile_phone, :phone, :regions, :guide_type, :experience, :structure, :structure_website, :license, :language, :soguide_description, :main_review, :soguide_url, :pays, :secondary_email, :pays_2, :facebook_profil_url, :facebook_profil_page, :gender, :guide_type_second, :language_third, :language_fourth, :language_fifth, :guide_type_third)
  end
end
