class User < ApplicationRecord
  belongs_to :user_classification

  validates :password, presence: true, length: { maximum: 64 }
  validates :last_name, presence: true, length: { maximum: 16 }
  validates :first_name, presence: true, length: { maximum: 16 }
  validates :zipcode, presence: true, length: { maximum: 16 }
  validates :prefecture, presence: true, length: { maximum: 16 }
  validates :municipality, presence: true, length: { maximum: 16 }
  validates :address, presence: true, length: { maximum: 32 }
  validates :apartments, presence: true, length: { maximum: 32 }
  validates :email, presence: true, length: { maximum: 128 }, uniqueness: true
  validates :phone_number, presence: true, length: { maximum: 16 }, uniqueness: true
  validates :company_name, presence: true, length: { maximum: 128 }
  validates :delete_flag, inclusion: { in: [true, false] }

end
