class ProfileController < ApplicationController
  before_action :set_avatar, only: %i[edit update index]

  def index
    @news_belong_to_user = News.all.limit(4)
  end

  def edit; end

  def update
    if current_user.nickname.include? @user.nickname
      if @user.update(avatar_params)
        msg = 'informaçoẽs atualizadas com sucesso'
        redirect_to profile_index_path(@user.nickname), notice: msg
      end
    else
      redirect_to root_path, alert: 'Vocẽ não tem permissão bonitão'
    end
  end

  private

  def avatar_params
    params.require(:user).permit(:avatar, :bio, :facebook,
                                  :twitter, :instagram, :theme)
  end

  def set_avatar
    @user = User.find_by(nickname: params[:nickname])
  end
end
