class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :post
      t.integer :employee_type_id

      t.timestamps null: false
    end
  end
end
