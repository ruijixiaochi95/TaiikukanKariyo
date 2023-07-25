class AddUserToGyms < ActiveRecord::Migration[6.1]
  def change
    add_column :gyms, :user_id, :integer, foreign_key: true
  end
end
