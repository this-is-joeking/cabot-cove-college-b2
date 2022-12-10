class ResidentsController < ApplicationController
  def index
    @residents = Resident.all
    @avg_age = @residents.average_age
  end

  def show
    @resident = Resident.find(params[:id])
    @courses = @resident.courses
  end
end