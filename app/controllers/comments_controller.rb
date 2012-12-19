class CommentsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
    @reaction = Reaction.find(params[:reaction_id])
    if reaction_route?(params[:comment][:remarks])
      @comment = @reaction.comments.build(params[:comment])
      route = Rails.application.routes.recognize_path(params[:comment][:remarks])
      if route[:action] == "show"
        reacting_with = Reaction.find(route[:id])
      else
        reacting_with = Reaction.find_by_short_url(route[:id])
      end
      if reacting_with
        @comment.reacting_with_id = reacting_with.id
      end
    else
      @comment = @reaction.comments.build(params[:comment])
    end
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

  def uri?(string)
    uri = URI.parse(string)
    %w( http https ).include?(uri.scheme)
    rescue URI::BadURIError
      false
    rescue URI::InvalidURIError
      false
  end

  def reaction_route?(string)
    route = Rails.application.routes.recognize_path(string)
    if (route[:controller] == "reactions" &&
      (route[:action] == "show" || route[:action] == "serve"))
      true
    else
      false
    end
    rescue ActionController::RoutingError
      false
  end
end