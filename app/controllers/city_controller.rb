class CityController < ApplicationController
  def show
    @city= City.find_by(id: params[:id])
  end
end
