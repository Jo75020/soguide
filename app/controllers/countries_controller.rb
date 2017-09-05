class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:show, :index]

  def create
    @country = Country.create(country_params)
    flash[:notice] = "country #{@country.name} has been created"
    redirect_to pages_add_country_path
  end

  def update
    @country.update(country_params)
    redirect_to country_path(@country)
  end


  def edit
  end

  def show
    @guides = Guide.where(pays: @country.name)
    @alert_message = "You are viewing #{@country.name}"
    @country_coordinates = { lat: @country.latitude, lng: @country.longitude }
  end

  def index
    unless params[:search] == ""
      @results = Country.search_name(params[:search])
    end
    if params[:search] == "" || params[:search].nil?
      @results = Country.where.not(latitude: nil, longitude: nil)
    end

    @countries_2 = Country.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@countries) do |country, marker|
      marker.lat country.latitude
      marker.lng country.longitude
      # marker.infowindow render_to_string(partial: "/countrys/map_box", locals: { country: country })
    end
  end

  def search
    @results = Country.search_name(params[:query])
  end

  private

  def country_params
    params.require(:country).permit(:name, :description, :photo, :photo_cache, :address, :full_description, :best_period, :latitude, :longitude)
  end

  def set_country
    @country = Country.find(params[:id])
  end

end
