class News::CommentsController < ApplicationController
  before_action :find_single_news, only: %i[index create]
  before_action :find_comment, only: %i[destroy]

  def index
    @comments = Comment.all.order(updated_at: :desc)
    @user_comment = Comment.new
  end

  def create
    news_data = { news: @single_news }
    @user_comment = current_user.comments.new comment_paramn.merge news_data

    @redirect = comments_index_path({ id: @single_news.slug })
    msg = 'Comentario adicionado com sucesso'
    if @user_comment.save
      redirect_to @redirect, notice: msg
    else
      render :new
    end
  end

  def destroy
    if @single_comment.destroy
      redirect_to root_path, notice: 'Comentario excluido'
    else
      redirect_to root_path, alert: 'Você nao pode fazer isso'
    end
  end

  private

  def find_comment
    @single_comment = current_user.comments.find(params[:id])
  end

  def find_single_news
    @single_news = News.find_by(slug: params[:id])
  end

  def comment_paramn
    params.require(:comment).permit(:content)
  end
end