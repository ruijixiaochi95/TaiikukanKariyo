class CreateGyms < ActiveRecord::Migration[6.1]
  def change
    create_table :gyms do |t|
      t.string :name, nul: false
      t.string :postal_code, nul: false
      t.string :address, nul: false
      t.string :phone_number, nul: false
      t.text :caption, nul: false
      t.boolean :is_open, nul: false, default: false

      t.timestamps
    end
  end
end
