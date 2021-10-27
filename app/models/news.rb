class News < ApplicationRecord
  has_one_attached :image
  has_one_attached :archive
  belongs_to :user

  validates :title, presence: true, length: { minimum: 10, maximum: 100 }
  validates :description, presence: true, length: { minimum: 50 }
  validates :sectionHeading, length: { maximum: 100 }
  validates :blockquote, length: { maximum: 200 }
  validates :font, presence: true, length: { minimum: 2, maximum: 20 }
  validates :fontLink, presence: true, length: { minimum: 10 }

  extend FriendlyId
  friendly_id :title, use: :slugged
end
