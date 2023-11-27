class WorkoutsController < ApplicationController
    before_action :set_workout, only: %i[ show edit update destroy ]

    def index
        @workouts = Workout.all 
    end

    def new
        @workout = Workout.new
    end

    def create
        @workout = Workout.new(workout_params)
        if @workout.save
          flash[:notice] = 'Workout was successfully created.'
          redirect_to workouts_url
        else
          render :new
        end
    end

    def show
    end
    
    def edit
    end

    def update
        if @workout.update(workout_params)
          flash[:notice] = 'Workout was successfully updated.'
          redirect_to @workout
        else
          render :edit
        end
    end
    
    def destroy
        @workout.destroy
        flash[:notice] = 'Workout was successfully destroyed.'
        redirect_to workouts_url
    end

    private
        def set_workout
            @workout = Workout.find(params[:id])
        end
        def workout_params
            params.require(:workout).permit(:name, :duration, :date)
        end
end
