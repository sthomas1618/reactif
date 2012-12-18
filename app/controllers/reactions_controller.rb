class ReactionsController < ApplicationController

  def new
    @reaction = Reaction.new
  end

  def create
    @reaction = current_user.reactions.build(params[:reaction])
    if (@reaction.save)
      flash[:success] = "Created a Reaction"
      redirect_to @reaction
    else
      render 'new'
    end
  end

  def show
    @reaction = Reaction.find(params[:id])
    @reaction.increment(:views)
    @reaction.save
    @taggings = @reaction.taggings
    @tag      = @reaction.tags.build
    @comments = @reaction.comments
    @comment  = Comment.new(reaction_id: @reaction.id)
  end

  SEND_FILE_METHOD = :default

  def serve
    head(:not_found) and return if (reaction = Reaction.find_by_short_url(params[:id])).nil?

    path = reaction.gif
    #head(:bad_request) and return unless File.exist?(path)

    send_file_options = { disposition: 'inline', type: "image/gif" }

    case SEND_FILE_METHOD
      when :apache then send_file_options[:x_sendfile] = true
      when :nginx then head(x_accel_redirect: path.gsub(Rails.root, ''), content_type: send_file_options[:type]) and return
    end

    send_file(path, send_file_options)
  end
end
