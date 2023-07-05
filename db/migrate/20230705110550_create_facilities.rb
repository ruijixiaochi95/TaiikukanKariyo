class CreateFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :facilities do |t|
      t.string :name, nul: false
      t.boolean :is_open, nul: false, default: false
      t.integer :gym_id

      t.timestamps
    end
  end
end
