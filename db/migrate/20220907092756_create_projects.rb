class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :place_name, null: false
      t.string :country, null: false
      t.datetime :begin
      t.datetime :finish
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
