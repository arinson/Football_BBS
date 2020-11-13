class Topic < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: "user"
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
