class CreateProjectUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :project_updates do |t|
      t.string :title
      t.string :description
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
