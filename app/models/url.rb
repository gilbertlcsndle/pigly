class Url < ApplicationRecord
  VALID_URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(\/.*)?\z/ix
  validates :original_url, format: { with: VALID_URL_REGEX }, presence: true
  before_create :generate_short_url

  private

    def generate_short_url
      begin
        self.short_url = SecureRandom.alphanumeric(6)
      end while Url.find_by(short_url: short_url)
    end
end
