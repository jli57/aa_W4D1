# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create( [

  {username: 'Dali'},
  {username: 'Van Gogh'},
  {username: 'DaVinci'},
  {username: 'Jingna'}
  ]);

artworks = Artwork.create([
  {title: 'Untitled', artist_id: users.first.id, image_url: "https:\/\/i.imgur.com/u4qSjQL.jpg"},
  {title: 'Untitled', artist_id: users.second.id, image_url: "https:\/\/i.imgur.com/u4qSjQL.jpg"},
  {title: 'Untitled', artist_id: users.last.id, image_url: "https:\/\/i.imgur.com/u4qSjQL.jpg"},
  {title: 'Melting Clocks', artist_id: users.first.id, image_url: "https:\/\/i.imgur.com/u4qSjQL.jpg"},
  {title: 'Sunrise', artist_id: users.second.id, image_url: "https:\/\/i.imgur.com/u4qSjQL.jpg"},
  {title: 'Drifting Castles', artist_id: users.third.id, image_url: "https:\/\/i.imgur.com/u4qSjQL.jpg"},
  {title: 'Man', artist_id: users.last.id, image_url: "https:\/\/i.imgur.com/u4qSjQL.jpg"},
  {title: 'Red and Blue', artist_id: users.last.id, image_url: "https:\/\/i.imgur.com/u4qSjQL.jpg"}
]);

ArtworkShare.create([
  {artwork_id: artworks.first.id, viewer_id: users.last.id},
  {artwork_id: artworks.first.id, viewer_id: users.second.id},
  {artwork_id: artworks.first.id, viewer_id: users.third.id},
  {artwork_id: artworks.second.id, viewer_id: users.second.id},
  {artwork_id: artworks.second.id, viewer_id: users.first.id},
  {artwork_id: artworks.second.id, viewer_id: users.last.id},
  {artwork_id: artworks.third.id, viewer_id: users.first.id}
]);
