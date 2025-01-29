class CreateStreamers < ActiveRecord::Migration[8.0]
  def change
    create_table :streamers do |t|
      t.string :code
      t.string :name
      t.string :description
      t.string :email
      t.string :profile_image_url
      t.datetime :account_created_at

      t.timestamps
    end
  end
end
