class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :periods
  has_many :projects, :through => :periods , :source => :projects
  has_many :assignments, :through => :projects , :source => :assignments

end
