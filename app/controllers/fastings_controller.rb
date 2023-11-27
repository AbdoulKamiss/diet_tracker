class FastingsController < ApplicationController
    before_action :set_fasting, only: %i[ show edit update destroy ]

    def index
        @fastings = Fasting.all 
    end

    def new
        @fasting = Fasting.new
    end

    def create
        @fasting = Fasting.new(fasting_params)
        if @fasting.save
          flash[:notice] = 'Fasting was successfully created.'
          redirect_to fastings_url
        else
          render :new
        end
    end

    def show
    end
    
    def edit
    end

    def update
        if @fasting.update(fasting_params)
          flash[:notice] = 'Fasting was successfully updated.'
          redirect_to @fasting
        else
          render :edit
        end
    end
    
    def destroy
        @fasting.destroy
        flash[:notice] = 'Fasting was successfully destroyed.'
        redirect_to fastings_url
    end

    private
        def set_fasting
            @fasting = Fasting.find(params[:id])
        end
        def fasting_params
            params.require(:fasting).permit(:start_time, :end_time, :description)
        end
end
