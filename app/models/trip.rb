class Trip < ApplicationRecord
  #================ ASSOCIATIONS =================================
  has_many :driver_relationships
  has_many :drivers, through: :driver_relationships, source: :user
  has_many :passenger_relationships
  has_many :passengers, through: :passenger_relationships, source: :user

  belongs_to :location
end
