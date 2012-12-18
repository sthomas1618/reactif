class PagesController < ApplicationController

  def home
    @new_reactions = Reaction.find(:all, :limit => 5, :order=> 'created_at desc')
  end
end