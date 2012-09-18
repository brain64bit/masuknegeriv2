class Program
  include Mongoid::Document
  field :name, type: String

  has_many :subjects
  has_many :students
  has_many :exams
end
