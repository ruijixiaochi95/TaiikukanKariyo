class AddUsageFeeToGyms < ActiveRecord::Migration[6.1]
  def change
    add_column :gyms, :usage_fee, :integer
  end
end
