class SelectedPlantsController < ApplicationController
  before_action :set_selected_plant, only: %i[ show edit update destroy ]

  # GET /selected_plants
  def index
    @selected_plants = SelectedPlant.all
  end

  # GET /selected_plants/1
  def show
  end

  # GET /selected_plants/new
  def new
    @selected_plant = SelectedPlant.new
  end

  # GET /selected_plants/1/edit
  def edit
  end

  # POST /selected_plants
  def create
    @selected_plant = SelectedPlant.new(selected_plant_params)

    if @selected_plant.save
      redirect_to @selected_plant, notice: "Selected plant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /selected_plants/1
  def update
    if @selected_plant.update(selected_plant_params)
      redirect_to @selected_plant, notice: "Selected plant was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /selected_plants/1
  def destroy
    @selected_plant.destroy
    redirect_to selected_plants_url, notice: "Selected plant was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selected_plant
      @selected_plant = SelectedPlant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def selected_plant_params
      params.require(:selected_plant).permit(:user_id, :inaturalist_id)
    end
end
