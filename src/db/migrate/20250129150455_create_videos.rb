class CreateVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :videos do |t|
      t.references :streamer, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.datetime :video_created_at
      t.datetime :video_published_at
      t.string :url
      t.string :thumbnail_url
      t.integer :view_count
      t.integer :duration

      t.timestamps
    end
  end
end
