class Car < ApplicationRecord
  belongs_to :user

  def make_and_model
    self.make + ' ' + self.model
  end
end
