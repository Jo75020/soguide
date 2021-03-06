class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: [:show, :index]

  def create
    @country = Country.new(country_params)
    @country.save!
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
    @reviews = Review.all
    @alert_message = "You are viewing #{@country.name}"
    @country_coordinates = { lat: @country.latitude, lng: @country.longitude }

  end

  def index

    unless params[:search] == ""
      @results = Country.search_name(params[:search])
        if @results == []
        @results = Country.where.not(latitude: nil, longitude: nil)
      end
    end
    if params[:search] == "" || params[:search].nil?
      @results = Country.all
    end
  end

  def search
    @results = Country.search_name(params[:query])
  end

  private

  def country_params
    params.require(:country).permit(:name, :description, :address, :full_description, :best_period, :best_moment_picture, photos: [])

  end

  def set_country
    @country = Country.find(params[:id])
  end

end
