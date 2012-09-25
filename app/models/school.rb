class School
  include Mongoid::Document
  field :name, type: String
  field :students_count, type: Integer

  school_names = %w{SMA SMAN SMK SMKN}
  validates_presence_of :name
  validates_format_of :name, :with => /\A(SMA|SMAN|SMK|SMKN)\s(\w)+$/, :message => "Harus diawali SMA|SMAN|SMK|SMKN"
  validates_length_of :name, :minimum => 5

  has_many :students
end
