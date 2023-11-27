class MealFoodsController < ApplicationController
  before_action :set_meal_food, only: %i[ show edit update destroy ]
  before_action :set_meal
  
    def index
      @meal_foods = MealFood.all
    end
  
    def show
    end
  
    def new
      @meal_food = MealFood.new
    end
  
    def create
      @meal_food = MealFood.new(meal_food_params)
  
      if @meal_food.save
        redirect_to @meal, notice: 'Meal_food was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @meal_food.update(meal_food_params)
        redirect_to @meal, notice: 'Meal_food was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @meal_food.destroy
      redirect_to @meal, notice: 'Meal_food was successfully destroyed.'
    end
  
    private
  
    def set_meal_food
      @meal_food = MealFood.find(params[:id])
    end

    def set_meal
      @meal = Meal.find(params[:meal_id])
    end
  
    def meal_food_params
      params.require(:meal_food).permit(:meal_id, :food_id, :quantity)
    end
end
