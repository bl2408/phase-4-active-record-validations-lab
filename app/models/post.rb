class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    validate :check_for_clickbait


    def check_for_clickbait
        titleIncludes = [ 
            /Won't Believe/i,
            /Secret/i,
            /Top \d/i,
            /Guess/i
        ]

        if titleIncludes.none? { | ti | ti.match title }
            errors.add(:title, "Must be clickbait!")
        end
    end
end
