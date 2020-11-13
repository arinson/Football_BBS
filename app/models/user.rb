class User < ApplicationRecord
  has_many :topics, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_topics, through: :likes, source: "topic"
  has_many :comments, dependent: :destroy

  validates :username, presence: true, length: { maximum: 20 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader
end
