include ActionController::HttpAuthentication::Basic::ControllerMethods

class ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
    return if Rails.env.test?

    authenticate_or_request_with_http_basic do |user, password|
      user == 'truecar' && password == 'truecar'
    end
  end

  def paginate_options
    { page:     params[:page] || 1,
      per_page: params[:per_page] && params[:per_page].to_i < 50 ? params[:per_page] : 50 }
  end
end
