class CreateBuys < ActiveRecord::Migration[7.0]
  def change
    create_table :buys do |t|
      t.belongs_to :user
      t.belongs_to :pet 
      t.timestamps
    end
  end
end
