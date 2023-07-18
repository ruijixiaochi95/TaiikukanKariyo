class AddGymManagerToGyms < ActiveRecord::Migration[6.1]
  def change
    add_column :gyms, :gym_manager_id, :integer
  end
end