class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color 
      t.string :name, null: false
      t.string :sex, limit: 1, inclusion: ["M", "F"]
      t.text :description 
      t.timestamps 
    end
  end
end