class UserClassification < ApplicationRecord
  has_many :users, dependent::destory

  validates :user_classification_name, presence: true, length: { maximum: 32 }
end
