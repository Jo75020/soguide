class Api::V1::CountriesController < Api::V1::BaseController
  def index
    respond_with Country.all
  end

end
