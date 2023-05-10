class ApplicationController < ActionController::Base
    # ユーザがログイン状態か否かを判定する関数。もしログインできなかった場合、sessionをnilにする
    # @return Optional<User>
    def check_user_auth(login_user = nil, input_password = nil)
        begin
            if login_user && input_password == nil
                raise ArgumentError.new("ログイン対象のユーザを指定した場合、検証するパスワードも引数に渡す必要があります")
            end

            if !login_user && (!session.key?(:user_id) || !session.key?(:user_password))
                raise StandardError.new("sessionの値が空になっています")
            end

            param_user_id = params[:user_id] ? params[:user_id] : params[:id]

            param_user_id = login_user ? login_user.id : param_user_id

            param_user_id = param_user_id ? param_user_id : session[:user_id]

            param_user_id = param_user_id.to_i

            if param_user_id != session[:user_id] && session[:user_id] != nil && login_user == nil
                raise StandardError.new("sessionの値が不正です")
            end

            user = login_user.nil? ? User.find(param_user_id) : login_user
            if user && user.authenticate(input_password ? input_password : session[:user_password])
                session[:user_id] = user.id

                if login_user
                    session[:user_password] = input_password
                end
    
                return user
            end

            set_session
        rescue => exception
            p exception.message
            set_session
            return nil
        end
    end

    def set_session(user_id = nil, user_password = nil)
        session[:user_id] = user_id
        session[:user_password] = user_password
    end
end
