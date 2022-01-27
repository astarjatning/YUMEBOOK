class Diary < ApplicationRecord
  belongs_to :user
  has_many :addings, dependent: :destroy
  has_many :keywords, through: :addings

  validates :title, presence: true
  validates :story, presence: true
end
