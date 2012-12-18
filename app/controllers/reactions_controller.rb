class ReactionsController < ApplicationController

  def new
    @reaction = Reaction.new
  end

  def create
    @reaction = Reaction.new(params[:reaction])
    if (@reaction.save)
      flash[:success] = "Created a Reaction"
      redirect_to root_path
    else
      render 'new'
    end
  end
end
