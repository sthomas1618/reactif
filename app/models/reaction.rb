# == Schema Information
#
# Table name: reactions
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  context          :string(255)
#  views            :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  gif_file_name    :string(255)
#  gif_content_type :string(255)
#  gif_file_size    :integer
#  gif_updated_at   :datetime
#  gif_fingerprint  :string(255)
#  short_url        :string(255)
#

class Reaction < ActiveRecord::Base
  attr_accessible :title, :context, :gif

  belongs_to :user
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  after_create { |reaction|
    reaction.short_url = reaction.id.to_s(36)
    reaction.save
  }

  has_attached_file :gif, :styles => {
                            large: "400x400>",
                            medium: "300x300>",
                            small: "100x100>",
                            thumb: "32x32#" }

  validates :title, presence: true, length: { maximum: 250 }
  validates_attachment :gif, presence: true,
    :content_type => { content_type: "image/gif" }
  validates :gif_fingerprint, uniqueness: true
end
