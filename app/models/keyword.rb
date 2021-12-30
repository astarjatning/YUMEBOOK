class Keyword < ApplicationRecord
  validates :word, length: { maximum: 255 }, presence: true, uniqueness: true
  validates :description, length: { maximum: 65535 }
  validates :furigana, length: { maximum: 255 }, presence: true

  def self.search(index)
    Keyword.where('furigana like ?', "#{index}%")
  end
end