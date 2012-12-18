class TaggingsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: [:create, :destroy]

  def create
    @tag = Tag.find_or_create_by_name(params[:tag][:name])
    @tagging = @reaction.taggings.build(tag_id: @tag.id)
    if @tagging.save
      redirect_to reaction_path(@reaction)
    else
      render 'reaction/show'
    end
  end

  def destroy
    @tagging = @reaction.taggings.find(params[:id])
    @tagging.destroy
    redirect_to reaction_path(params[:reaction_id])
  end

  private

  def correct_user
    @reaction = @current_user.reactions.find_by_id(params[:reaction_id])
    redirect_to root_url if @reaction.nil?
  end
end