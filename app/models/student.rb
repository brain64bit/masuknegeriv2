class Student
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slugify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## model field
  field :name, type:String
  field :sex, type:String
  field :birthdate, type:Date
  field :school_name

  ## omniauth
  field :provider
  field :uid

  validates_presence_of :name
  validates_presence_of :school_name
  validates_format_of :school_name, :with => /\A(SMA|SMAN|SMK|SMKN)\s(\w)+$/, :message => "Harus diawali SMA|SMAN|SMK|SMKN"


  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String

  # relation
  has_many :student_activities
  has_many :subject_records
  belongs_to :school
  belongs_to :program

  class << self
    def from_omniauth(auth)
      find_or_create_by(auth.slice) do |student|
        student.name = auth.name
        student.email = auth.email
      end
    end

    def new_with_session(params, session)
      if session["devise.student_attributes"]
        new(session["devise.student_attributes"], without_protection:true) do |student|
          student.attributes = params
          student.valid?
        end
      else
        super
      end
    end
  end

  private
  def generate_slug
    self.name.parameterize
  end
end
