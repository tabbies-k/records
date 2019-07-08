class Entry < ApplicationRecord
    
    belongs_to :record, optional: true

    default_scope -> { order(record_id: :asc) }

    def record
        return Record.find_by(id: self.record_id)
    end

    def user
        return User.find_by(id: self.record.user_id)
    end
    
    def caliculation
        if expected_sales
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

end
