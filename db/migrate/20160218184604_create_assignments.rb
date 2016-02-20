class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.date :submission_date
      t.string :grade
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
