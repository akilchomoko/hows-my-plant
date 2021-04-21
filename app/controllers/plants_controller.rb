class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(params_plant)
    @plant.user = current_user
    if @plant.save
      redirect_to plants_path
    else
      render :new
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant.update(params_plant)
    @plant.save
  end

  def destroy
    @plant.delete
    redirect_to plants_path
  end

  private

  def params_plant
    params.require(:plant).permit(:name)
  end
end
