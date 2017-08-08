class Tagging < ActiveRecord::Base
  belongs_to :post
  has_many :tags,:through => :taggings
end
