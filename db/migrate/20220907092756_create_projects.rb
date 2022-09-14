class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :place_name
      t.datetime :begin
      t.datetime :finish
      t.belongs_to :user, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
