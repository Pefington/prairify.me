class AddProviderToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :provider, :integer
  end
end
