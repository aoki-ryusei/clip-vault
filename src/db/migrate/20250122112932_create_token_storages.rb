class CreateTokenStorages < ActiveRecord::Migration[8.0]
  def change
    create_table :token_storages do |t|
      t.string :token
      t.datetime :expired_at

      t.timestamps
    end
  end
end
