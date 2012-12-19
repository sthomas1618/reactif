class PagesController < ApplicationController

  def home
    @popular_reactions = Reaction.find(:all, :limit => 5, :order=> 'views desc')
    @new_reactions = Reaction.find(:all, :limit => 5, :order=> 'created_at desc')
  end
end