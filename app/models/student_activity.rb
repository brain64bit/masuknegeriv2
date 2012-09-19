class StudentActivity
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type
  field :question_ids, type:Array
  field :answers, type:Array
  field :exam_id
  field :start_time, type:DateTime
  field :finish_time, type:DateTime

  belongs_to  :student
end
