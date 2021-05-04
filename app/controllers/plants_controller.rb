class PlantsController < ApplicationController

  before_action :set_plant, only: [:edit, :show, :destroy, :update]

  def index
    # @plants = Plant.all
    # Understand what this means for next time
    @plants = policy_scope(Plant).order(created_at: :desc)
  end

  def show
    authorize @plant
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
    authorize @plant
  end

  def update
    authorize @plant
    @plant.update(params_plant)
    @plant.save
  end

  def destroy
    authorize @plant
    @plant.delete
    redirect_to plants_path
  end

  private

  def params_plant
    params.require(:plant).permit(:name)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end

end
