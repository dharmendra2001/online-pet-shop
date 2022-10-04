class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :petname
      t.string :food
      t.integer :weight
      t.integer :height
      t.integer :age
      t.string :description
      t.string :precaution
      t.string :image
      t.string :medical
      t.timestamps
    end
  end
end
