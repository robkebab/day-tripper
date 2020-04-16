class User < ApplicationRecord
#===================== ASSOCIATIONS ===============================================
    has_many :driver_relationships, dependent: :destroy
    has_many :driver_trips, through: :driver_relationships, source: :trip
    has_many :passenger_relationships, dependent: :destroy
    has_many :passenger_trips, through: :passenger_relationships, source: :trip

    has_many :cars, dependent: :destroy

#========================= Validations ==============================================
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true

    def full_name
        self.first_name + " " + self.last_name
    end

    def all_trips #refactor using AREL query methods
        trips = []
        trips << self.driver_trips
        trips << self.passenger_trips
        trips.flatten
    end

    def trip_count
        all_trips.count
    end

    def is_organizer?(trip)
        self == trip.drivers.first
    end

    def is_driver?(trip)
        trip.drivers.include?(self)
    end

    def is_passenger?(trip)
        trip.passengers.include?(self)
    end

    def has_car?
        !self.cars.empty?
    end
end
