module ErrorMessage
    extend ActiveSupport::Concern

    def set_view_error(type, title, message)
        session[:error_hash] = {type: type, title: title, message: message}
    end

    def get_view_error
        res = session[:error_hash]
        session[:error_hash] = nil

        return res
    end
end