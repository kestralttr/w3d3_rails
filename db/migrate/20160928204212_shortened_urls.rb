class ShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, unique: true, null: false
      t.string :short_url, unique: true
      t.string :user_id
      t.timestamps
    end
    add_index :shortened_urls, :long_url
    add_index :shortened_urls, :short_url
    add_index :shortened_urls, :user_id
  end
end
