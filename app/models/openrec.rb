class Openrec < ApplicationRecord
    
    # postは一つのUserに所属しています
    belongs_to :user
    
        with_options presence: true do
        validates :name
        validates :body
        validates :openrec_url
    end
end
