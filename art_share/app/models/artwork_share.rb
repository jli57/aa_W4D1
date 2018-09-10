class ArtworkShare < ApplicationRecord
  validates [:artwork_id, :viewer_id], uniqueness: true
  validates :artwork_id, :viewer_id, presence: true

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :user
end