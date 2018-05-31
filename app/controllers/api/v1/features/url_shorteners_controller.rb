class Api::V1::Features::UrlShortenersController < Api::V1::BaseController

  def index
    json_response(ShortenedUrl.get_records(request.host), :ok)
  end

  def create
    sanitized_url = UrlShortener.sanitize_url(url_shortener_params[:url])
    result = ShortenedUrl.find_or_create_by(url: sanitized_url)
    json_response( result.create_json_object(request.host), :ok)
  end

  private
    def url_shortener_params
      params.require(:url_shortener).permit(:url)
    end
end