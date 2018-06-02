class Api::V1::Features::UrlShortenersController < Api::V1::BaseController
  before_action :sanitize_url, only: [:create]

  def index
    json_response(ShortenedUrl.get_records(request.host), :ok)
  end

  def create
    result = ShortenedUrl.find_or_create_by(url: @sanitized_url)
    json_response( result.create_json_object(request.host), :ok)
  end

  # for searching the origin url
  def show
    result = ShortenedUrl.find_by(unique_key: params[:unique_key])
    if result
      json_response(result.create_json_object(request.host), :ok)
    else
      json_response({message: 'Not found'}, :not_found)
    end
  end

  def destroy
    result = ShortenedUrl.find_by(unique_key: params[:unique_key])
    if result
      result.delete
      json_response({message: 'Successfully Deleted'}, :ok)
    else
      json_response({message: 'Not found'}, :not_found)
    end
  end

  private
    def url_shortener_params
      params.require(:url_shortener).permit(:url)
    end

    # cleaning the url
    def sanitize_url
      @sanitized_url = UrlShortener.sanitize_url(url_shortener_params[:url])
    end
end