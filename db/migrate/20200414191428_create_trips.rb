class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.references :location, null: false, foreign_key: true
      t.text :description
      t.date :date
      t.time :departure_time
      t.time :return_time

      t.timestamps
    end
  end
end
