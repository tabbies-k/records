class Record < ApplicationRecord
    validates :candidate, {presence: true}
    validates :status, {presence: true}
    validates :user_id, {presence: true}

    belongs_to :user

    def user
        return User.find_by(id: self.user_id)
    end
    
end
