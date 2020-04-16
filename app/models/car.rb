class Car < ApplicationRecord
#================= Associations ===================== 
  belongs_to :user

#================= Validations ===================== 
  validates :num_of_seats, presence: true, 

#================= Helpers ===================== 

  def make_and_model
    self.make + ' ' + self.model
  end
end
