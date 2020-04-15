class DriverRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  belongs_to :car
end
