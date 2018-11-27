class Url < ApplicationRecord
  VALID_URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(\/.*)?\z/ix
  validates :original_url, format: { with: VALID_URL_REGEX }, presence: true,
    uniqueness: true
end
