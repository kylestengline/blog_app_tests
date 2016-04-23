class Article < ApplicationRecord
  # ensures that there is a title and body when creating articles.
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
  # if article gets deleted, then the dependent comment will get deleted as well.
  has_many :comments, dependent: :destroy

  default_scope { order(created_at: :desc) }
end
