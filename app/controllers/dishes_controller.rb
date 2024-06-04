class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end
  
  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to dishes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def dish_params
    params.require(:dish).permit(:dish, :category_id, :remark).merge(user_id: current_user.id)
  end
end
