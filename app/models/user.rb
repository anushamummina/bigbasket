class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :inventories, dependent: :destroy
  belongs_to :role

  def admin?
   	self.role.name == "Admin"
  end


  def customer?
   	self.role.name == "Customer"
  end
end
