class Answer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :answer
  field :score, :type => Integer
  field :start_time, :type => DateTime
  field :finish_time, :type => DateTime
  field :working_time => Float

  # relation
  belongs_to :student
  belongs_to :question

  def set_working_time
  	self.working_time = start_time - finish_time
  end
end
