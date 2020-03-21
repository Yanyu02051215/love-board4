class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :title, presence: true
  validates :body, { presence: true, length:{maximum: 255} }

  #ランキング機能の為
  is_impressionable
  
end
