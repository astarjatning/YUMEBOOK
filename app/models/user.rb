class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :diaries, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :laughs, dependent: :destroy
  has_many :griefs, dependent: :destroy

  enum role: { general: 0, admin: 1 }

  validates :name, presence: true, length: {maximum: 255}
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: {minimum: 6}, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  def liked?(diary)
    likes.where(diary_id: diary.id).exists?
  end

  def laughed?(diary)
    laughs.where(diary_id: diary.id).exists?
  end

  def griefed?

end
