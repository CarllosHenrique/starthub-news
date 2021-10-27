class HomeController < ApplicationController
  def index
    @news = News.all.limit(3)
  end

  def profile
    @nickname = params[:nickname]
    @profile = User.find_by(nickname: @nickname)

    @news_belong_to_user = News.all.limit(4)
  end

  def users
    @users = User.all
  end
end
