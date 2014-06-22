class User < ActiveRecord::Base
	has_many :projects
	acts_as_follower
	acts_as_followable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  CONTRIBUTION_FREQUENCIES = ["mensuelle", "trimestrielle", "annuelle"]

  def name_or_fullname
  	name.present? ? name : "#{first_name} #{last_name}"
  end

  def saldo
    if total_contribution
      total_contribution - global_funding
    else
      0
    end
  end

  def global_funding
    global_funding = 0
    following_projects.each do |project|
      global_funding += project.funding.to_i
    end
    global_funding
  end

  def nonvalidated
    !validated
  end

  def self.contribution_frequencies
    CONTRIBUTION_FREQUENCIES.map do |contribution_frequency|
      [I18n.t("contribution_frequencies.#{contribution_frequency}"), contribution_frequency]
    end
  end

end
