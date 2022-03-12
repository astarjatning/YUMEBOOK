class Diary < ApplicationRecord
  belongs_to :user
  has_many :keywords, through: :addings
  has_many :likes, dependent: :destroy
  has_many :laughs, dependent: :destroy
  has_many :cries, dependent: :destroy
  has_many :surprises, dependent: :destroy
  has_many :paws, dependent: :destroy
  has_many :diary_tags, dependent: :destroy
  has_many :tags, through: :diary_tags

  validates :title, presence: true
  validates :story, presence: true

  def save_tag(sent_tags)
    exist_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    older_tags = exist_tags - sent_tags
    new_tags = sent_tags - exist_tags

    older_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_diary_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_diary_tag
    end
  end
end
