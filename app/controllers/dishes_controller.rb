class DishesController < ApplicationController
  def index
    @dishes = Dish.all
  end
  
  def new
    @dish = Dish.new
  end

  def create
    Dish.create(dish_params)
    redirect_to '/dishes'
  end

  private
  def dish_params
    params.require(:dish).permit(:dish, :category_id, :remark).merge(user_id: current_user.id)
  end
end
