class DishesController < ApplicationController
  def index
    @user = current_user
    @cat2 = Dish.where(user_id: @user.id, category_id: 2)
    @cat3 = Dish.where(user_id: @user.id, category_id: 3)
    @cat4 = Dish.where(user_id: @user.id, category_id: 4)
    @cat5 = Dish.where(user_id: @user.id, category_id: 5)
    @cat6 = Dish.where(user_id: @user.id, category_id: 6)
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
