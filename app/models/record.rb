class Record < ApplicationRecord
    validates :candidate, {presence: true}
    validates :client, {presence: true}
    validates :status, {presence: true}
    validates :user_id, {presence: true}

    def user
        return User.find_by(id: self.user_id)
    end

end
