class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :clickbait?

BAIT = [ /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i]

    def clickbait?
        if BAIT.none? { |bait| bait.match title }
          errors.add(:title, "Title must be more clickbait-y-ish")
        end


      end
end
