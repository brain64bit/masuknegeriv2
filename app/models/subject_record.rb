class SubjectRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :subject
  belongs_to :student, index:true
end
