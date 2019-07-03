class Record < ApplicationRecord
    validates :candidate, {presence: true}
    validates :status, {presence: true}
    validates :user_id, {presence: true}

    belongs_to :user
    has_many :entries

    def user
        return User.find_by(id: self.user_id)
    end
    
    def entries
        return Entry.where(candidate_id: self.candidate_id)
    end
    
end
