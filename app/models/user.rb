class User < ApplicationRecord
  belongs_to :user_classification
  has_many :orders, dependent: :destory

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_ZIPCODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  VALID_NUMBER_REGEX = /\A[0-9]+\z/.freeze
  validates :password, presence: true, length: { minimum: 6, maximum: 15 }, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name, presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :zipcode, presence: true, length: { maximum: 7 }, format: { with: VALID_ZIPCODE_REGEX }
  validates :prefecture, presence: true, length: { maximum: 5 }, format: { with: ZENKAKU_REGEX }
  validates :municipality, presence: true, length: { maximum: 10 }, format: { with: ZENKAKU_REGEX }
  validates :address, presence: true, length: { maximum: 15 }, format: { with: ZENKAKU_REGEX }
  validates :apartments, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 128 }, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true, length: { maximum: 15 }, uniqueness: true, format: { with: VALID_NUMBER_REGEX }
  validates :company_name, presence: true, length: { maximum: 128 }
  validates :delete_flag, inclusion: { in: [true, false] }

end
