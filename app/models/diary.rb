class Diary < ApplicationRecord
  belongs_to :user
  has_many :addings, dependent: :destroy
  has_many :keywords, through: :addings
  has_many :likes, dependent: :destroy
  has_many :laughs, dependent: :destroy
  has_many :cries, dependent: :destroy
  has_many :surprises, dependent: :destroy

  validates :title, presence: true
  validates :story, presence: true
end
