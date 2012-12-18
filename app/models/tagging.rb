# == Schema Information
#
# Table name: taggings
#
#  id          :integer          not null, primary key
#  reaction_id :integer
#  tag_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tagging < ActiveRecord::Base
  attr_accessible :reaction_id, :tag_id
  belongs_to :reaction
  belongs_to :tag

  validates :reaction_id, presence: true
  validates :tag_id,  presence: true
end
