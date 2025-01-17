class Post < ActiveRecord::Base
    validates :title, presence: true 
    validate :click_bait
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}


    def click_bait 
        if !title.nil? && (!title.include?("You Won't" || "Secret" || "Top" || "Guess")) 
             errors.add(:clickbait, "Not clickbaity")
          end
    end 
end
