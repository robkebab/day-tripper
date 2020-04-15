class AddCarColumnToDriverRelationships < ActiveRecord::Migration[6.0]
  def change
    add_reference :driver_relationships, :car, foreign_key: true
  end
end
