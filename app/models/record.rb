class Record < ApplicationRecord
    validates :candidate, {presence: true}
    validates :status, {presence: true}
    validates :user_id, {presence: true}

    belongs_to :user
    has_many :entries
    accepts_nested_attributes_for :entries

    def user
        return User.find_by(id: self.user_id)
    end
    
    def entries
        return Entry.where(record_id: self.id)
    end
    
end
