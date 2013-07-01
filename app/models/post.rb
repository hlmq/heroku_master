class Post < ActiveRecord::Base
  attr_accessible :text, :title
  has_many :comments, dependent: :destroy
  # the validates (with 's') let us strict the input values
  validates :title, presence: true, length: { minimum: 5 }
end
