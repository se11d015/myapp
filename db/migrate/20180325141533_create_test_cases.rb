class CreateTestCases < ActiveRecord::Migration[5.1]
  def change
    create_table :test_cases do |t|
      t.integer :competition_id
      t.string :test_case

      t.timestamps
    end
  end
end
