class CreateAssignmentTasks < ActiveRecord::Migration
  def change
    create_table :assignment_tasks do |t|
      t.string :title
      t.text :description
      t.references :assignment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
