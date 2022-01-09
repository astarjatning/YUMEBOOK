class Keyword < ApplicationRecord
  has_many :addings, dependent: :destroy
  has_many :diaries, through: :addings
  has_many :meanings, dependent: :destroy
  has_many :connotations, through: :meanings

  validates :word, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :description, length: { maximum: 65535 }
  validates :furigana, length: { maximum: 255 }, presence: true

  def self.search(index)
    Keyword.where('furigana like ?', "#{index}%")
  end
end
