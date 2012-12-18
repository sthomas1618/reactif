class Reaction < ActiveRecord::Base
  attr_accessible :title, :context

  validates :title, presence: true, length: { maximum: 250 }

end