class PortionsController < ApplicationController
  def new
    @dish = Dish.find(params[:dish_id])
    @portion = Portion.new
  end

  def create
    @dish = Dish.find(params[:dish_id])
    @portion = Portion.new(portion_params)
    @portion.dish = @dish
    if @portion.save
      redirect_to dish_path(@dish)
    else
      render dish_path(@dish)
    end
  end

  def destroy
    @portion= Portion.find(params[:id])
    @portion.destroy
    redirect_to dish_path(@portion.dish)
  end

  private

  def portion_params
    params.require(:portion).permit(:description, :ingredient_id)
  end
end
