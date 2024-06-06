class DishesController < ApplicationController
  before_action :set_dish, only: [:edit, :update]

  def index
    @user = current_user
    @cat2 = Dish.where(user_id: @user.id, category_id: 2)
    @cat3 = Dish.where(user_id: @user.id, category_id: 3)
    @cat4 = Dish.where(user_id: @user.id, category_id: 4)
    @cat5 = Dish.where(user_id: @user.id, category_id: 5)
    @cat6 = Dish.where(user_id: @user.id, category_id: 6)
    @cat7 = Dish.where(user_id: @user.id, category_id: 7)
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

  def edit
  end

  def update
    if @dish.update(dish_params)
      redirect_to dishes_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    dish = Dish.find(params[:id])
    dish.destroy if current_user == dish.user
    redirect_to dishes_path
  end

  private
  def dish_params
    params.require(:dish).permit(:dish, :category_id, :remark).merge(user_id: current_user.id)
  end

  def set_dish
    @dish = Dish.find(params[:id])
  end
end
