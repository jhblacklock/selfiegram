class StaticController < ApplicationController
  def index
    return head :ok unless Rails.env.development?

  	render html: '<a href="/rails/info/routes">View Routes</a>'.html_safe
  end
end
