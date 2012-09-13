class School
  include Mongoid::Document
  field :name, type: String
  field :students_count, type: Integer

  validates_presence_of :name
  validates_format_of :name, :with => /^[\w\s]+$/
  validates_length_of :name, :minimum => 5

  has_many :students
end
