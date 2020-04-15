class TripsController < ApplicationController
    before_action :find_trip, except: [:index, :new, :create]
    
    def index
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
            binding.pry
            redirect_to @trip
        else
            render 'new'
        end
    end

    def update
    end

    def destroy
    end

    private

    def trip_params
        params.require(:trip).permit(:location_id, :date, :description, :departure_time, :return_time)
    end

    def find_trip
        @trip = Trip.find(params[:id])
    end
end
