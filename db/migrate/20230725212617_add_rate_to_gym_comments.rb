class AddRateToGymComments < ActiveRecord::Migration[6.1]
  def change
    add_column :gym_comments, :rate, :float
  end
end
