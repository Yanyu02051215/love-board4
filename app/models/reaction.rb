class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  delegate :question,to: :answer

  validates :body, { presence: true, length:{maximum: 100} }
end
