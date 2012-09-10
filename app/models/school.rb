class School
  include Mongoid::Document
  field :name, type: String
  field :students_count, type: Integer
  field :address, type: String
end
