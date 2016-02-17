class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.date :published_on
      t.text :content

      t.timestamps null: false
    end
  end
end
