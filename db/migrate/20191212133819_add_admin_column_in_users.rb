class AddAdminColumnInUsers < ActiveRecord::Migration[6.0]
  def change
    def change
      add_column :users, :admin, :boolean, default: false
    end
  end
end
