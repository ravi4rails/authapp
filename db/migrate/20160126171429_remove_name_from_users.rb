class RemoveNameFromUsers < ActiveRecord::Migration
  def change
    add_column :users, :date_of_birth, :string
    add_column :users, :contact_1, :string
    add_column :users, :contact_2, :string
    add_column :users, :address, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
  end
end
