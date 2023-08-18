class Player < ApplicationRecord
    has_many :comments, dependent: :destroy
    
    has_many :battings, dependent: :destroy

    has_many :bowlings, dependent: :destroy

    # def display_name
    #     "#{playername} (#{id})"
    #   end
   
   
    def self.ransackable_attributes(auth_object = nil)
        ["battingstyle", "birthplace", "born", "bowling", "created_at", "id", "nickname", "playername", "role", "style", "updated_at"]
    end
    
    def self.ransackable_associations(auth_object = nil)
    ["comments"]
    end
end
