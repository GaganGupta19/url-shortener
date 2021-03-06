module ShortenedUrlsHelper

  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end

  def create_url(host, uniq_key)
    "#{host}/#{uniq_key}"
  end
end
