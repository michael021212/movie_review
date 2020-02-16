class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  GENRES = [{id:28, name: "アクション"}, {id:12, name: "アドベンチャー"}, {id:16, name: "アニメ"}, {id:35, name: "コメディ"}, {id:80, name: "クライム"},
            {id:99, name: "ドキュメンタリー"}, {id:18, name: "ドラマ"}, {id:10751, name: "家族向け"}, {id:14, name: "ファンタジー"}, {id:36, name: "歴史"},
            {id:27, name: "ホラー"}, {id:10402, name: "音楽"}, {id:9648, name: "ミステリー"}, {id:10749, name: "ロマンス"}, {id:878, name: "SF"},
            {id:53, name: "スリラー"}, {id:10752, name: "戦争"}, {id:37, name: "西部劇"}]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :sex, :birthday])
  end
end
