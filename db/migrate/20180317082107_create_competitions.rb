class CreateCompetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :competitions do |t|
      t.string :name
      t.string :image
      t.time :left_time
      t.integer :participants_number
      t.text :details

      t.timestamps
    end
  end
end
