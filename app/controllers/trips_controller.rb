class TripsController < ApplicationController
    before_action :find_trip, except: [:index, :new, :create]
    
    def index
        @trips = Trip.all
    end

    def show
    end

    def new
        @trip = Trip.new
    end

    def edit
    end

    def create
        @trip = Trip.new(trip_params)

        if @trip.save
          @dr = DriverRelationship.create(trip: @trip, user: current_user)
            #binding.pry
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

    def destroy
        @trip.destroy
        redirect_to home_path
    end

    private

    def trip_params
        params.require(:trip).permit(:location_id, :date, :description, :departure_time, :return_time)
    end

    def find_trip
        @trip = Trip.find(params[:id])
    end
end
