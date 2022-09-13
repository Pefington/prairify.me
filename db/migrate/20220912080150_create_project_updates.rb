class CreateProjectUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :project_updates do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
