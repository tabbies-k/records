class Target < ApplicationRecord
    validates :year, {presence: true}
    validates :year, {presence: true}
    validates :year, {presence: true}
    
    def user
        return User.find_by(id: self.user_id) 
    end
    
    def records
        return Record.where(user_id: self.user_id)
    end
    
    def total_sales
        return records.sum(:sales) 
    end

end
