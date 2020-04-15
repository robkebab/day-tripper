class CarsController < ApplicationController
    before_action :find_car, except: [:new, :index, :create]

    def index
        @cars = current_user.cars
    end

    def show
    end

    def new
        @car = Car.new
    end

    def edit
    end

    def create
        @car = Car.new(car_params)
        @car.user = current_user
        if @car.save
            redirect_to @car
        else
            render 'new'
        end
    end

    def update
        if @car.update(car_params)
            redirect_to @car
        else
            render 'edit'
        end
    end

    def destroy
        @car.destroy
        redirect_to cars_path
    end

    private

    def car_params
        params.require(:car).permit(:make, :model, :year, :color, :license, :num_of_seats)
    end

    def find_car
        @car = Car.find(params[:id])
    end
end
