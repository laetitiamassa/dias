class User < ActiveRecord::Base
	has_many :projects
	acts_as_follower
	acts_as_followable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name_or_fullname
  	name.present? ? name : "#{first_name} #{last_name}"
  end
end
