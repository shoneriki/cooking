class PortionsController < ApplicationController
  def new
    @dish = Dish.find(params[:dish_id])
    @portion = Portion.new
  end

  def create
    @dish = Dish.find(params[:dish_id])
    @portion = Portion.new(portion_params)
    if @portion.save
      redirect_to dish_path(@dish)
    else
      render dish_path(@dish)
    end
  end

  private

  def portion_params
    params.require(:portion).permit(:description, :ingredient_id)
  end
end
