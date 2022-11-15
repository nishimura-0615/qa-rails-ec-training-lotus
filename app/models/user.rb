class User < ApplicationRecord
  belongs_to :user_classification

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password, presence: true, length: { minimum: 6, maximum: 15 }, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name, presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :zipcode, presence: true, length: { maximum: 7 }, format: { with: /\A[0-9]+\z/ }
  validates :prefecture, presence: true, length: { maximum: 5 }
  validates :municipality, presence: true, length: { maximum: 10 }
  validates :address, presence: true, length: { maximum: 15 }
  validates :apartments, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 128 }, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true, length: { maximum: 15 }, uniqueness: true, format: { with: /\A[0-9]+\z/ }
  validates :company_name, presence: true, length: { maximum: 128 }
  validates :delete_flag, inclusion: { in: [true, false] }

end
