class SchoolsController < ApplicationController
  before_action :school, only: [:show, :edit, :update, :destroy]

  def index
    @schools = School.all
  end

  def show 
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    if @school = School.create(school_params)
      redirect_to school_path(@school)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @school.update(school_params)
      redirect_to school_path(@school)
    else
      render :edit
    end
  end

  def destroy
    @school.destroy
    redirect_to schools_path
  end

  private

    def school
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :level)
    end

end
