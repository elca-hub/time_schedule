class ApplicationController < ActionController::Base
    # ユーザの認証トークンを再設定し、期間を更新。また、生成された認証トークンをセッションに保存する。
    # @param user: 認証トークンを再設定するユーザ
    def update_auth_token(user)
        auth_token = SecureRandom.uuid

        user.auth_token = auth_token
        # トークン有効期間は1分
        user.auth_token_expiration = Time.now + 60

        user.save

        session[:auth_token] = auth_token
    end

    # ユーザのログインを行う。
    # @param user_name: ユーザ名
    # @param input_password: パスワード
    # @return Userが見つかった場合はそのUser、見つからなかった場合はnil
    def user_login(user_name, input_password)
        user = User.find_by_name(user_name)

        if user && user.authenticate(input_password)
            user.password = input_password # これがないとupdate_auth_token内のuser.saveが正しく動作しない
            update_auth_token(user)
            return user
        end

        return nil
    end

    # ユーザのログアウトを行う。
    def user_logout
        session[:auth_token] = nil
    end

    # ユーザの認証を行う。
    # @return 認証に成功した場合は認証したUser、失敗した場合はnil
    def authenticate_user
        param_user_id = params[:user_id] ? params[:user_id] : params[:id]

        if param_user_id == nil
            p "ユーザIDが指定されていません"
            return nil
        end

        access_user = User.find(param_user_id.to_i) # アクセスしようとしているユーザ

        if access_user == nil
            p "指定されたユーザが存在しません"
            return nil
        end

        user_auth_token = access_user.auth_token # アクセスしようとしているユーザの認証トークン
        user_auth_token_expiration = access_user.auth_token_expiration # アクセスしようとしているユーザの認証トークンの有効期限

        if user_auth_token == nil || user_auth_token_expiration == nil || session[:auth_token] == nil
            p "認証トークンが存在しません"
            return nil
        end

        if user_auth_token_expiration.to_fs(:time) < Time.zone.now.to_fs(:time) || user_auth_token != session[:auth_token]
            p "認証トークンが不正です"
            return nil
        end

        session[:auth_token] = user_auth_token

        return access_user
    end

    def set_session(user_id = nil, user_password = nil)
        session[:user_id] = user_id
        session[:user_password] = user_password
    end

    def after_sign_in_path_for(resource)
        "/users/show"
    end
end
