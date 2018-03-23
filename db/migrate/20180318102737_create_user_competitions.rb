class CreateUserCompetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_competitions do |t|
      t.integer :user_id
      t.integer :competition_id
      t.text  :answer

      t.timestamps
    end
  end
end
