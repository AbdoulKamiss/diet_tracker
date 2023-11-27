class CaloriesController < ApplicationController
    before_action :set_calorie, only: %i[ show edit update destroy ]

    def index
        @calories = Calorie.all 
    end

    def new
        @calorie = Calorie.new
    end

    def create
        @calorie = Calorie.new(calorie_params)
        if @calorie.save
          flash[:notice] = 'Calorie was successfully created.'
          redirect_to calories_url
        else
          render :new
        end
    end

    def show
    end
    
    def edit
    end

    def update
        if @calorie.update(calorie_params)
          flash[:notice] = 'Calorie was successfully updated.'
          redirect_to @calorie
        else
          render :edit
        end
    end
    
    def destroy
        @calorie.destroy
        flash[:notice] = 'Calorie was successfully destroyed.'
        redirect_to calories_url
    end

    private
        def set_calorie
            @calorie = Calorie.find(params[:id])
        end
        def calorie_params
            params.require(:calorie).permit(:name, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
        end
end
