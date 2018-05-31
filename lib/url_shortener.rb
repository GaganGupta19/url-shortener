module UrlShortener

  CHARSETS = {
      alphanum: ('a'..'z').to_a + (0..9).to_a,
      alphanumcase: ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
  }

  mattr_accessor :charset
  self.charset = :alphanum

  mattr_accessor :unique_key_length
  self.unique_key_length = 6

  def self.key_chars
    CHARSETS[charset]
  end

  def self.sanitize_url(original_url)
    sanitized_url = original_url.strip
    sanitized_url = sanitized_url.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
    sanitized_url.slice!(-1) if sanitized_url[-1] == "/"
    "http://#{sanitized_url}"
  end

  def self.get_uniq_key
    charset = key_chars
    (0...unique_key_length).map{ charset[rand(charset.size)] }.join
  end

  def self.create_url(host, uniq_key)
    "#{host}/#{uniq_key}"
  end
end