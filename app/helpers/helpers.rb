class Helpers
  class << self
    def find_user(params)
      return User.find_by(username: params[:username], password: params[:password])
    end

    def current_user(session)
      return User.find(session[:id])
    end

    def is_logged_in?(session)
      return !!session[:id]
    end

  end

end
