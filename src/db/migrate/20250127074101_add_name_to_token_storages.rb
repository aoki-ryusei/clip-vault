class AddNameToTokenStorages < ActiveRecord::Migration[8.0]
  def change
    add_column :token_storages, :name, :string, after: :id
  end
end
