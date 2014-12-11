class Comment < ActiveRecord::Base
  belongs_to :user
  validates :boby, presence: true, length: { maximum: 2000 }
end