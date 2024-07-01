class MenusController < ApplicationController
  def index
    @menus = Menu.all
    @menu = Menu.new
  end

  def new
    @menu = Menu.new
  end

  def create
    binding.pry
    @menu = Menu.create(menu_params)
    # if @menu.save
      redirect_to root_path
    # else
      # render :new, status: :unprocessable_entity
    # end
  end
  
  private

  def menu_params
    params.require(:menu).permit(:start_day).merge()
  end
end
