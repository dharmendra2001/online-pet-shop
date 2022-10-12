class ExtraColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :price, :integer
    add_column :pets, :status, :integer, :default =>0
    add_column :pets, :pet_type, :string
    add_column :buys, :amount, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
