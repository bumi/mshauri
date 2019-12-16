class AllowBlankUsersEmails < ActiveRecord::Migration[6.0]
  def change
    remove_index :users, :email
    add_index :users, :email, unique: true, where: "email IS NOT NULL and email != ''"
  end
end
