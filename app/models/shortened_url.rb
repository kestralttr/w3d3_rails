class ShortenedUrl < ActiveRecord::Base
  validates :long_url, presence: true, uniqueness: true

  def self.random_code
    while true
      new_short_url = SecureRandom::urlsafe_base64
      return new_short_url if ShortenedUrl.exists?(short_url: '#{new_short_url}') == false
    end
  end

  def self.create_for_user_and_long_url!(user,long_url)
    ShortenedUrl.create!(user_id: user.id, long_url: long_url, short_url: self.random_code)
  end

  belongs_to(:submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: 'User')

  has_many(:visitors,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: 'Visit')

  has_many(:visits)

  def num_clicks
    visits.count #Visit.all.select {|v| v.shortened_url_id == self.id}.count
  end

  def num_uniques
    Visit.all.select(:shortened_url_id).distinct.select {|v| v.shortened_url_id == self.id}.count
    #Visit.all.distinct.select {|v| v.shortened_url_id == self.id}.count - 1
  end

  def num_recent_uniques  #still needs work
    Visit.all.select(:created_at).select{|c_a| (Time.now-c_a)/60 < 10}
  end

  # def num_uniques
  #   Visit.all.select(:shortened_url_id).distinct.select {|v| v.shortened_url_id == self.id}.count
  #   #Visit.all.distinct.select {|v| v.shortened_url_id == self.id}.count - 1
  # end


end
