class ShortenedUrl < ApplicationRecord
  before_create :generate_token

  def generate_token
    custom_key = nil
    begin
      unique_key = custom_key || UrlShortener.get_uniq_key
      custom_key = nil
    end while self.class.exists?(unique_key: unique_key) && custom_key.blank?
    self.unique_key = unique_key
  end

end