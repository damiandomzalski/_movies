class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :user_id, presence: true, uniqueness: { scope: :movie_id, message: "You can add only one comment per movie, delete the previous one if you want to add a new one" }
  validates_presence_of :user_id, :movie_id, :content


  def self.top_commenters
    Comment.select("user_id, count(user_id) as count").group(:user_id).where("created_at >= ?", 1.week.ago.utc).order("count DESC").limit(10)
  end
end
