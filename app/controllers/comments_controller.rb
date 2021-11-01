class News::CommentsController::Comments < ApplicationController
  before_action :find_comment, only: %i[index new]

  def index
    @comments = Comment.all
  end

  def create
    byebug
    # @current_user_comment = current_user.comments.new(comment_paramn)
    # if @current_user_comment.save 
    #   msg = 'Comentario adicionado com sucesso'
    #   redirect_to @comments, notice: msg
    # end 
  end

  def new
    @current_user_comment = Comment.new
  end

  private

  def find_comment
    @comments = News.friendly.find(params[:id])
  end

  def comment_paramn
    params.require(:comment).permit(:content, :news_id, :user_id)
  end
end
