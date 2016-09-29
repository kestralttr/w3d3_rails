class Visit < ActiveRecord::Base

  def self.record_visit!(user, shortened_url)
    Visit.create!(user_id: user.id, shortened_url: shortened_url.id)
  end

end
