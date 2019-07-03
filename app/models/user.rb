class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, {presence: true}
  validates :branch, {presence: true}
  
  has_many :records
  has_many :targets
  
  def records
    return Record.where(user_id: self.id)
  end
  
  def total_sales
    return records.sum(:sales) 
  end

  def targets
    return Target.where(user_id: self.id)
  end

end
