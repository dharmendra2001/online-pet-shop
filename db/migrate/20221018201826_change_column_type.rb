class ChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :pets, :age, :string
    change_column :pets, :height, :string
    change_column :pets, :weight, :string
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
