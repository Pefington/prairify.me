class CreateSelectedPlants < ActiveRecord::Migration[7.0]
  def change
    create_table :selected_plants do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :inaturalist_id, null: false
      t.string :scientific_name, null: false
      t.string :english_name
      t.string :common_name
      t.string :picture_url, null: false
      t.string :wiki

      t.timestamps
    end
  end
end
