class User < ActiveRecord::Base
	has_many :projects
	acts_as_follower
	acts_as_followable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => ":style/missing_avatar.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  #validates :first_name, presence: true
  #validates :last_name, presence: true
  #validates :birth_date, presence: true
  #validates :birth_place, presence: true
  #validates :pays, presence: true
  #validates :address, presence: true
  #validates :phone, presence: true
  #validates :skype, presence: true
  #validates :contribution, presence: true

  CONTRIBUTION_FREQUENCIES = ["mensuelle", "trimestrielle", "annuelle"]
  GENDERS = ["feminin", "masculin"]

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

  def self.genders
    GENDERS.map do |gender|
      [I18n.t("genders.#{gender}"), gender]
    end
  end

end
