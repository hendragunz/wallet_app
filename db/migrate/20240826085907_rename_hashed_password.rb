class RenameHashedPassword < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :hashed_password, :password_digest
  end
end
