class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.movie_id = @movie.id
    flash.keep
    if @comment.save
      redirect_to @movie
    else
      redirect_to @movie, :flash => { :error => @comment.errors.full_messages.join('') }
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "Comment deleted"
      redirect_to @movie
    end
  end

end
