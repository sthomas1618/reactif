# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  remarks          :string(255)
#  reacting_with_id :integer
#  user_id          :integer
#  reaction_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :reaction_id, :remarks
  belongs_to :reaction
  belongs_to :user

  validates :remarks, presence: true
  validates :reaction_id, presence: true
  validates :user_id, presence: true
end
