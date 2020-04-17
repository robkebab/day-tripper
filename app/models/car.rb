class Car < ApplicationRecord
#================= Associations ===================== 
  belongs_to :user

#================= Validations ===================== 
  validates :num_of_seats, presence: true, numericality: { only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 8}

#================= Helpers ===================== 

  def make_and_model
    self.make + ' ' + self.model
  end
end
