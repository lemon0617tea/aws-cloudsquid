class Post < ApplicationRecord
    # postは一つのUserに所属しています
    belongs_to :user
    
        with_options presence: true do
        validates :name
        validates :body
        validates :youtube_url
    end
end
