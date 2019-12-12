class ChangeAdminColumnInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :admin, false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
