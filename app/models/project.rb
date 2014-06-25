class Project < ActiveRecord::Base
	belongs_to :user
	acts_as_followable

  has_attached_file :cover, :styles => { :medium => "650x433#", :thumb => "300x200#" }, :default_url => ":style/missing_cover.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

	validates :funding, presence: true
	validates :budget, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :pays, presence: true
  validates :deadline, presence: true



	def total_funding
		contribution_per_head*followers_count
	end

	def contribution_per_head
		funding
	end

	def funded_portion
		total_funding*100/budget
	end

  def affordable(user)
    user.saldo >= self.funding 
  end

	def coming_deadline
    deadline && deadline >= Time.now
  end

  def past_deadline
    !coming_deadline
  end

  def time_left_display
    if time_left_in_days >= 30
      time_left_in_months
    elsif time_left_in_hours >= 72 
      time_left_in_days
    elsif ((deadline - Time.now) / 1.hour) < 1
      time_left_in_minutes
    else 
      time_left_in_hours
    end
  end

  def time_left_in_minutes
    ((deadline - Time.now) / 60).round
  end

  def time_left_in_hours
    ((deadline - Time.now) / 1.hour).round
  end

  def time_left_in_days
    ((deadline - Time.now) / 1.day).round
  end

  def time_left_in_months
    ((deadline - Time.now) / 1.month).round
  end
end
