class NewsController < ApplicationController
  before_action :set_news_with_user, only: %i[edit update destroy]
  def index
    @news = News.all
  end

  def new
    @new = News.new
  end

  def create
    @new = current_user.news.new(news_params)
    msg = 'Noticia criada com sucesso'
    return redirect_to @new if @new.save notice: msg

    render :new
  end

  def destroy
    @new.destroy
    redirect_to @new, notice: 'Notícia foi destruida com sucesso.'
  end

  def show
    @new = News.friendly.find(params[:id])
    @comments = @new.comments
  end

  def edit; end

  def update
    @new.update(news_params)
    redirect_to @new, notice: 'Notícia foi atualizada com sucesso.'
  end

  private

  def set_news_with_user
    @new = current_user.news.friendly.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :description, :sectionHeading,
                :blockquote, :imgFluid, :font, :fontLink, :image, :archive)
  end
end
