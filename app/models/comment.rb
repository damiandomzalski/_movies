class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :user_id, presence: true, uniqueness: { scope: :movie_id, message: "You can add only one comment per movie, delete the previous one if you want to add a new one" }
end
