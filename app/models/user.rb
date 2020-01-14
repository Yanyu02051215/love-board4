class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :questions, dependent: :destroy
 has_many :anwers, dependent: :destroy
 has_many :reactions, dependent: :destroy
 has_many :bookmarks, dependent: :destroy
 has_many :bookmark_questions, through: :bookmarks ,source: :questions

 mount_uploader :image, ImageUploader
end
