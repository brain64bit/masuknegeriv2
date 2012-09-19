class Exam
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type, type: String
  field :date, type: Date
  field :start_time, type: DateTime
  field :finish_time, type: DateTime
  field :description, type: String
  field :simultaneously, type:Boolean #akbar

  has_many :questions
  belongs_to :program

  TYPE = {
  	"smptn":{correct:4, wrong:-1, unanswered:0},
  	"un":{correct:1, wrong:-1, unanswered:0}
  }

  validation_presence_of :type, :program_id, :start_time, :finish_time
  validation_inclusion_of :type, :in => Exam::TYPE.keys

  def un?
  	self.type.eql?("un")
  end

  def smptn?
  	self.type.eql?("smptn")
  end

  def active?
    (Time.now >= self.start_time) && (Time.now <= self.finish_time)
  end
end
