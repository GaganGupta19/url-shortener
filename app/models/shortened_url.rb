class ShortenedUrl < ApplicationRecord
  before_create :generate_token
  validates_presence_of [:url, :unique_key]
  validates_uniqueness_of :unique_key

  def generate_token
    custom_key = nil
    begin
      unique_key = custom_key || UrlShortener.get_uniq_key
      custom_key = nil
    end while self.class.exists?(unique_key: unique_key) && custom_key.blank?
    self.unique_key = unique_key
  end

  def self.get_records(host)
    select(:url, :unique_key).map{ |u| u.create_json_object(host) }
  end

  def create_json_object(host)
    {url: url, short_url: UrlShortener.create_url(host, unique_key)}
  end
end