class ProfileController < ApplicationController
   before_action :set_avatar, only: %i[edit update index]
  def index
    @news_belong_to_user = News.all.limit(4)
  end

  def edit;end

  def update
    if @user.update(avatar_params) 
      redirect_to "/profile/#{@user.nickname}", notice: 'Avatar atualizado com sucesso'
    else
      render :edit
    end 
  end

  private

  def avatar_params
     params.require(:user).permit(:avatar)
  end

  def set_avatar
    @user = User.find_by(nickname: params[:nickname])
  end
end
