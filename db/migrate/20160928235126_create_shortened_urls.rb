class CreateShortenedUrls < ActiveRecord::Migration
  def change
    remove_column :shortened_urls, :user_id
    add_column :shortened_urls, :user_id, :integer
  end
end
