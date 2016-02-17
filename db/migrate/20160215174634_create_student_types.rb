class CreateStudentTypes < ActiveRecord::Migration
  def change
    create_table :student_types do |t|
      t.string :name
      t.references :student_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
