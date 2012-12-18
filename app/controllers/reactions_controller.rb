class ReactionsController < ApplicationController

  def new
    @reaction = Reaction.new
  end

  def create
    @reaction = current_user.reactions.build(params[:reaction])
    if (@reaction.save)
      flash[:success] = "Created a Reaction"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @reaction = Reaction.find(params[:id])
    @reaction.increment(:view_count)
    @reaction.save
  end
end
