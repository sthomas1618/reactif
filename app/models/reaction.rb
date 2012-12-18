class Reaction < ActiveRecord::Base
  attr_accessible :title, :context, :gif

  has_attached_file :gif, :styles => {
                            large: "400x400>",
                            medium: "300x300>",
                            small: "100x100>",
                            thumb: "32x32#" }

  validates :title, presence: true, length: { maximum: 250 }
  validates_attachment :gif, :presence => true,
    :content_type => { :content_type => "image/gif" }
end