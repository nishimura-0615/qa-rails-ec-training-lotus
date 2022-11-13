class Purchase < ApplicationRecord
  belongs_to :product, dependent: :destroy
end
