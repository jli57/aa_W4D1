class Comment < ApplicationRecord

  validates :artwork_id, :user_id, :body, presence: true

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User,
    dependent: :destroy

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork,
    dependent: :destroy

end
