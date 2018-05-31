class Api::V1::BaseController < ActionController::API
  before_action :set_headers
  include Helpers::ResponseHelper
  include Helpers::ExceptionHandler

  def set_headers
    response.headers['Content-Type'] = 'application/json'
  end
end