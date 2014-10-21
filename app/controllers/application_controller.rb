class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  # attr_accessor :webinar

  def ping
    name = params[:full_name].try(:split) || ["bob", "tester"]
    first_name = name[0]
    last_name  = name[1]
    
    email = params[:email]

    WEBINAR.create_registrant('5405158842181492738', 
      {:firstName => first_name, 
        :lastName => last_name, 
           :email => email
      })

    render nothing: true
  end

end
