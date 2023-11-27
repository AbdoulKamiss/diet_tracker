class FoodsController < ApplicationController
    before_action :set_food, only: %i[ show edit update destroy ]

    def index
        @foods = Food.all 
    end

    def new
        @food = Food.new
    end

    def create
        @food = Food.new(food_params)
        if @food.save
          flash[:notice] = 'Food was successfully created.'
          redirect_to foods_url
        else
          render :new
        end
    end

    def show
    end
    
    def edit
    end

    def update
        if @food.update(food_params)
          flash[:notice] = 'Food was successfully updated.'
          redirect_to @food
        else
          render :edit
        end
    end
    
    def destroy
        @food.destroy
        flash[:notice] = 'Food was successfully destroyed.'
        redirect_to foods_url
    end

    private
        def set_food
            @food = Food.find(params[:id])
        end
        def food_params
            params.require(:food).permit(:name, :calories, :protein, :carbohydrates, :fat)
        end
end
