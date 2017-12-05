class Subscriber < ApplicationRecord
  # TODO add support for International numbers
  VALID_PHONE_NUMBER_REGEX = /\+\d{11}/

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

  validates :phone_number, presence: true, length: { is: 12 }, format: { with: VALID_PHONE_NUMBER_REGEX }, uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
