class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.belongs_to :project, foreign_key: true, null: false
      t.integer :inaturalist_id, null: false

      t.timestamps
    end
  end
end
