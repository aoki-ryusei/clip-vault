class AddUniqueIndexCodeAndNameToStreamers < ActiveRecord::Migration[8.0]
  def change
    add_index :streamers, [:code, :name], unique: true
  end
end
