class Connotation < ApplicationRecord
  has_many :meanings, dependent: :destroy
  has_many :keywords, through: :meanings

  validates :connotation, presence: true, length: { maximum: 255 }
end
