class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: {maximum: 250 }
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category." }
  validate :clickbait

  CLICKBAIT = [
    /Won't Believe/,
    /Secret/,
    /Top [0-9]/,
    /Guess/
  ]

  def clickbait
  if CLICKBAIT.none? { |record| record.match title }
    errors.add(:title, "Not Clickbait-y Enough!")
   end
  end


end
