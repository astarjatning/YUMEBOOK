class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :diaries, dependent: :destroy

  enum role: { general: 0, admin: 1 }

  validates :name, presence: true, length: {maximum: 255}
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
end
