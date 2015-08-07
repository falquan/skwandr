class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :name
      t.datetime :occurance
      t.integer :duration

      t.timestamps null: false
    end
  end
end
