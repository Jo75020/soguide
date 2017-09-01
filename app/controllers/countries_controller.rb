class CountriesController < ApplicationController

  def create
    @country = Country.create(country_params)
    flash[:notice] = "country #{@country.name} has been created"
    redirect_to pages_add_country_path
  end

  def show
    @country = Country.find(params[:id])
    @guides = Guide.where(country: @country.name)
    @alert_message = "You are viewing #{@country.name}"
    @country_coordinates = { lat: @country.latitude, lng: @country.longitude }
  end

  def index
    @countries = Country.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@countries) do |country, marker|
      marker.lat country.latitude
      marker.lng country.longitude
      # marker.infowindow render_to_string(partial: "/countrys/map_box", locals: { country: country })
    end
  end


  def country_params
    params.require(:country).permit(:name, :description, :photo, :photo_cache, :address)
  end

end
