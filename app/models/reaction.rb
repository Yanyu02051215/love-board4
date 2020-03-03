class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  validates :body, { presence: true, length:{maximum: 100} }
end
