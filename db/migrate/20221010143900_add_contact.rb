class AddContact < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :contact_number, :string
    add_column :users, :stripe_customer_id, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
