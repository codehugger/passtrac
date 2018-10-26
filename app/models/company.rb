class Company < ApplicationRecord
  has_many :assets, dependent: :destroy
end
