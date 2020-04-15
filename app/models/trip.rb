class Trip < ApplicationRecord
#================ ASSOCIATIONS =================================
  has_many :driver_relationships, dependent: :destroy
  has_many :drivers, through: :driver_relationships, source: :user
  has_many :passenger_relationships, dependent: :destroy
  has_many :passengers, through: :passenger_relationships, source: :user

  has_many :cars, through: :driver_relationships
  belongs_to :location

#================ HELPERS =======================================

  def display
    self.location.name + " " + '|' + " " + self.date.to_s
  end

  def organizer_full_name
    self.drivers.first.full_name
  end

  # def cars
  #   self.driver_relationships.map {|dr| dr.car }
  # end
end
