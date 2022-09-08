class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.belongs_to :project, index: true
      t.integer :inaturalist_id
      
      t.timestamps
    end
  end
end
