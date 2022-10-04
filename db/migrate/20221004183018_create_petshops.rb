class CreatePetshops < ActiveRecord::Migration[7.0]
  def change
    create_table :petshops do |t|
      t.string :shopname
      t.belongs_to :user
      t.timestamps
    end
  end
end
