class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, {presence: true}
  validates :branch, {presence: true}
  
  def records
    return Record.where(user_id: self.id)
  end

end
