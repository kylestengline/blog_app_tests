class Article < ApplicationRecord
  # ensures that there is a title and body when creating articles.
  validates :title, presence: true
  validates :body, presence: true

  default_scope { order(created_at: :desc) }
end
