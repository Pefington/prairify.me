class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :place_id
      t.datetime :begin
      t.datetime :finish
      t.belongs_to :user, index: true
      
      t.timestamps
    end
  end
end
