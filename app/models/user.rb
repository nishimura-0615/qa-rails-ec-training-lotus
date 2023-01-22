class User < ApplicationRecord
  belongs_to :user_classification
  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_ZIPCODE_REGEX = /\A\d{3}-\d{4}\z/
  VALID_NUMBER_REGEX = /\A[0-9]+\z/
  has_secure_password
  validates :password, presence: true, length: { minimum: 6, maximum: 15 }, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name, presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :zipcode, presence: true, length: { maximum: 8 }, format: { with: VALID_ZIPCODE_REGEX }
  validates :prefecture, presence: true, length: { maximum: 5 }
  validates :municipality, presence: true, length: { maximum: 10 }
  validates :address, presence: true, length: { maximum: 15 }
  validates :apartments, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 128 }, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true, length: { maximum: 15 }, uniqueness: true, format: { with: VALID_NUMBER_REGEX }
  validates :company_name, presence: true, length: { maximum: 128 }
  validates :delete_flag, inclusion: { in: [true, false] }

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = "password"
      user.first_name = "ゲスト"
      user.last_name = "ユーザー"
      user.user_classification_id = 1
      user.zipcode = "123-4567"
      user.prefecture = "東京都"
      user.municipality = "千代田区"
      user.address = "代々木2丁目5-1"
      user.apartments = "代々木ビル5F"
      user.phone_number = "000000000011"
      user.company_name = "株式会社tech"
      user.delete_flag = false
    end
  end
end
