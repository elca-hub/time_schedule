module ErrorMessage
    extend ActiveSupport::Concern

    def set_view_error(type, title, message)
        type_list = ["success", "info", "warning", "danger"]

        
        if !type_list.include?(type)
            raise StandardError.new("エラーの種類が不正です。")
        end

        session[:error_hash] = {type: type, title: title, message: message}
    end

    def get_view_error
        res = session[:error_hash]
        session[:error_hash] = nil

        return res
    end
end