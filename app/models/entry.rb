class Entry < ApplicationRecord
    
    belongs_to :user

    def user
        return User.find_by(id: self.user_id)
    end
    
    def record
        return Record.find_by(candidate_id: self.candidate_id)
    end
    
end
