class Entry < ApplicationRecord
    
    belongs_to :user

    def user
        return User.find_by(id: self.user_id)
    end
    
    def record
        return Record.find_by(candidate_id: self.candidate_id)
    end
    
    def caliculation
        if rank == "A"
            expected_sales*1
        elsif rank == "B"
            (expected_sales*0.9).round
        elsif rank == "C"
            (expected_sales*0.6).round
        elsif rank == "D"
            (expected_sales*0.3).round
        else expected_sales*0
        end
    end

end
