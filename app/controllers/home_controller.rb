class HomeController < ApplicationController
  def index
    @news = News.all.limit 3
  end

  def users
    @users = User.all
  end
end
