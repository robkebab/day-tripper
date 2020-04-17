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
    self.location.name + " " + '|' + " " + self.date_display
  end

  def organizer_full_name
    self.drivers.first.full_name
  end

  def total_seats
    total = 0
    self.cars.each do |car|
     total += car.num_of_seats 
    end
    total
  end

  def available_seats
    total_seats - (self.passengers.count + self.drivers.count)
  end
  # def cars
  #   self.driver_relationships.map {|dr| dr.car }
  # end

  def date_display
    self.date.strftime("%A, %d %b %Y")
  end
end
