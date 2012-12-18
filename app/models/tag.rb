# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings
  has_many :reactions, through: :taggings

  before_save { |tag| tag.name = name.downcase }

  WHOLE_WORD_REGEX = /\A\w+\Z/
  validates :name, presence: true, format: { with: WHOLE_WORD_REGEX }

  def to_param
    name
  end
end
