# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#ShortenedUrl.create(long_url: 'www.google.com',short_url: 'www.goo.gl')
User.create(email: 'iwuzfirst@hotmail.com')
User.create(email: 'metoo@aol.com')
ShortenedUrl.create(user_id: User.first.id, long_url: 'www.twitter.com', short_url: 'j39hd902hf')
ShortenedUrl.create(user_id: User.last.id, long_url: 'www.youtube.com', short_url: '3l3h9nco9o')
ShortenedUrl.create(user_id: User.first.id, long_url: 'www.instagram.com', short_url: 'nfvuobe909')
Visit.create(user_id: 1, shortened_url_id: 1)
Visit.create(user_id: 2, shortened_url_id: 2)
Visit.create(user_id: 2, shortened_url_id: 2)
Visit.create(user_id: 1, shortened_url_id: 3)
Visit.create(user_id: 1, shortened_url_id: 3)
Visit.create(user_id: 1, shortened_url_id: 3)
Visit.create(user_id: 2, shortened_url_id: 1)
