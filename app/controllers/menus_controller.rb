class MenusController < ApplicationController
  def index
    @menus = Menu.all
    @menu = Menu.new
  end
end
