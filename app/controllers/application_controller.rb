class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # before_filter :force_www!

  def after_sign_in_path_for(resource)
    admin_clients_path
  end

protected

def force_www!
  if Rails.env.production? and request.host[0..3] != "www."
    redirect_to "#{request.protocol}www.#{request.host_with_port}#{request.fullpath}", :status => 301
  end
end

end
