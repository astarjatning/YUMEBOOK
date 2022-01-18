class Diary < ApplicationRecord
  belongs_to :user
  has_many :addings, dependent: :destroy
  has_many :keywords, through: :addings

  validates :date, presence: true
end
