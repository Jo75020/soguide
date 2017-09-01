class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def index
    @countries = Country.all

  end


  def add_country
    @country = Country.new
  end
end
