class User < ApplicationRecord
#===================== ASSOCIATIONS ===============================================
    has_many :driver_relationships
    has_many :driver_trips, through: :driver_relationships, source: :trip
    has_many :passenger_relationships
    has_many :passenger_trips, through: :passenger_relationships, source: :trip

    has_many :cars

#========================= Validations ==============================================

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
end
