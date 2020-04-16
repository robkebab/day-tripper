class TripsController < ApplicationController
    before_action :authorize
    before_action :find_trip, except: [:index, :new, :create]
    before_action :users_cars, only: [:edit, :new]
    
    def index
        @trips = Trip.all
    end

    def show
        @current_user = current_user
    end

    def new
        @trip = Trip.new
    end

    def edit
    end

    def create
        @trip = Trip.new(trip_params(:location_id, :date, :description, :departure_time, :return_time))
    
        if @trip.save
          @dr = DriverRelationship.create(trip: @trip, user: current_user)
            @dr.update(trip_params(:car_id))
            redirect_to @trip
        else
            render 'new'
        end
    end

    def update
        if @trip.update(trip_params)
            redirect_to @trip
        else
            render 'edit'
        end
    end

    def add_passenger
        PassengerRelationship.create(user: current_user, trip: @trip) 
        redirect_to trip_path(@trip)
    end

    def add_driver
        @dr = DriverRelationship.new(user: current_user, trip: @trip) 
        @dr.update(trip_params(:car_id))
        redirect_to trip_path(@trip)
    end

    def destroy_passenger
        @pr = PassengerRelationship.find_by(user: current_user, trip: @trip)
        @pr.destroy
        redirect_to @trip
    end

    def destroy_driver
        @dr = DriverRelationship.find_by(user: current_user, trip: @trip)
        @dr.destroy
        redirect_to @trip
    end

    def destroy
        @trip.destroy
        redirect_to home_path
    end

    private

    def users_cars
        @cars = current_user.cars
    end

    def trip_params(*args)
        params.require(:trip).permit(*args)
    end

    def find_trip
        @trip = Trip.find(params[:id])
    end
end
