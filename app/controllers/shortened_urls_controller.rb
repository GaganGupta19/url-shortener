class ShortenedUrlsController < ApplicationController
  before_action :sanitize_url, only: [:create]

  def index
    @shortened_urls = ShortenedUrl.all.select(:url, :unique_key)
  end


  def new
    @shortened_url = ShortenedUrl.new
  end

  def create
    @shortened_url = ShortenedUrl.find_or_create_by(url: @sanitized_url)
    respond_to do |format|
      if @shortened_url.present?
        format.html { redirect_to shortened_urls_path, notice: 'Shortened url was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @shortened_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_from_csv
    CSV.foreach(params[:csv].tempfile, headers: true) do |row|
      sanitized_url = UrlShortener.sanitize_url(row.to_h["url"])
      ShortenedUrl.find_or_create_by(url: sanitized_url)
    end
    redirect_to shortened_urls_path, notice: 'Shortened urls were successfully created.'
    # respond_to do |format|
    #   if @shortenf ed_url.present?
    #     format.html { redirect_to shortened_urls_path, notice: 'Shortened urls were successfully created.' }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @shortened_url.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def redirect_handler
    record = ShortenedUrl.find_by_unique_key(params[:unique_key])
    redirect_url = (record && record.url ? record.url : root_path)
    redirect_to redirect_url
  end

  private
    def shortened_url_params
      params.fetch(:shortened_url, {})
    end

    # cleaning the url
    def sanitize_url
      @sanitized_url = UrlShortener.sanitize_url(shortened_url_params[:url])
    end
end
