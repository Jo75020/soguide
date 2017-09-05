class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :a_savoir]

  def home
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
