class RestaurantsController < ApplicationController
  
  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to '/restaurants'
  end

end
