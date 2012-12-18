class CommentsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
    @reaction = Reaction.find(params[:reaction_id])
    @comment = @reaction.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Commented!"
      redirect_to @reaction
    else
      render 'reactions/show'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @reaction
  end

  private

  def correct_user
    @comment = current_user.comments.find_by_id(params[:id])
    redirect_to root_url if @comment.nil?
  end
end