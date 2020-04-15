class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.references :user, null: false, foreign_key: true
      t.string     :make
      t.string     :model
      t.integer    :year
      t.string     :color
      t.string     :license
      t.integer    :num_of_seats

      t.timestamps
    end
  end
end
