class User < ApplicationRecord
#===================== ASSOCIATIONS ===============================================
    has_many :driver_relationships, dependent: :destroy
    has_many :driver_trips, through: :driver_relationships, source: :trip
    has_many :passenger_relationships, dependent: :destroy
    has_many :passenger_trips, through: :passenger_relationships, source: :trip

    has_many :cars, dependent: :destroy

#========================= Validations ==============================================

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true

    def full_name
        self.first_name + " " + self.last_name
    end

    def all_trips
        trips = []
        trips << self.driver_trips
        trips << self.passenger_trips
        trips.flatten
    end

    def trip_count
        all_trips.count
    end
end
