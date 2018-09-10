class Artwork < ApplicationRecord
  validates :title, :artist_id, :image_url, presence: true
  validates [:artist_id, :title], uniqueness: true

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User
end
