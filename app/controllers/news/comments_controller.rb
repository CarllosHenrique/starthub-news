class News::CommentsController < ApplicationController
  before_action :find_single_News, only: %i[index create]

  def index
    @comments = Comment.all.order(updated_at: :desc)
    @current_user_comment = Comment.new
  end

  def create

    news_data = { news: @single_news }
    @current_user_comment = current_user.comments
                                        .new(comment_paramn.merge news_data )

    if @current_user_comment.save 
      msg = 'Comentario adicionado com sucesso'
      redirect_to comments_index_path({id: @single_news.slug}), notice: msg
    end 
  end

  private

  def find_single_News
    @single_news = News.find_by(slug: params[:id])
  end

  def comment_paramn
    params.require(:comment).permit(:content)
  end
end