class PlantsController < ApplicationController

  def destroy
    @plot = Plot.find(params[:plot_id])
    # require "pry"; binding.pry
    @plot.plants.destroy(plant_params)
    redirect_to plots_path
  end

private

  def plant_params
    params.permit(:name, :description, :harvest)
  end
end
