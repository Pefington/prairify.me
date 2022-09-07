class CreateJoinTableProjectPlants < ActiveRecord::Migration[7.0]
  def change
    create_table :join_table_project_plants do |t|
      t.belongs_to :project, index: true
      t.timestamps
    end
  end
end
