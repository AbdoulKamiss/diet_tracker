class WeightsController < ApplicationController
    before_action :set_weight, only: %i[ show edit update destroy ]

    def index
        @weights = Weight.all 
    end

    def new
        @weight = Weight.new
    end

    def create
        @weight = Weight.new(weight_params)
        if @weight.save
          flash[:notice] = 'Weight was successfully created.'
          redirect_to weights_url
        else
          render :new
        end
    end

    def show
    end
    
    def edit
    end

    def update
        if @weight.update(weight_params)
          flash[:notice] = 'Weight was successfully updated.'
          redirect_to @weight
        else
          render :edit
        end
    end
    
    def destroy
        @weight.destroy
        flash[:notice] = 'Weight was successfully destroyed.'
        redirect_to weights_url
    end

    private
        def set_weight
            @weight = Weight.find(params[:id])
        end
        def weight_params
            params.require(:weight).permit(:name, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
        end
end
