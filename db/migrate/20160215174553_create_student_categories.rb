class CreateStudentCategories < ActiveRecord::Migration
  def change
    create_table :student_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
