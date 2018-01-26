require "rails_helper"

describe "Top 10 commenters requests", type: :request do
  describe "Top commenters list" do
    it "displays right title" do
      visit "/comments/top_commenters"
      expect(page).to have_selector("h1", text: "Top 10 commenters")
    end
  end
end
