class Target < ApplicationRecord
    validates :year, {presence: true}
    validates :year, {presence: true}
    validates :year, {presence: true}
    
    def user
        return User.find_by(id: self.user_id) 
    end

end
