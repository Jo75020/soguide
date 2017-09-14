class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :a_savoir]

  def home
    unless params[:search] == ""
      @results = Country.search_name(params[:search])
    end
    if params[:search] == "" || params[:search].nil?
      @results = Country.where.not(latitude: nil, longitude: nil)
    end
    @reviews = Review.all
  end

  def index
    @countries = Country.all

  end

  def a_savoir
  end


  def add_country
    @country = Country.new
  end

  def update_country
    @country = Country.find(params[:id])
  end

end
