class Record < ApplicationRecord
    validates :candidate, {presence: true}
    validates :status, {presence: true}
    validates :user_id, {presence: true}

    def user
        return User.find_by(id: self.user_id)
    end
    
    def self.search(search)
        if search
            Record.where(['user_id LIKE ?', "%#{search}%"])
        else
            Record.all 
        end
    end
end
