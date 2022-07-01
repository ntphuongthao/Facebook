class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'

  belongs_to :commentable, polymorphic: true

  has_many :likes,
            as: :likable,
            dependent: :destroy
end
