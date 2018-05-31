class Api::V1::BaseController < ActionController::API
  before_action :set_headers
  include ResponseHelper
  include ExceptionHandler

  def set_headers
    response.headers['Content-Type'] = 'application/json'
  end
end