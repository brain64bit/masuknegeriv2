class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  field :code
  field :question_body_bb
  field :question_body
  field :answer_key
  field :discussion_body_bb
  field :discussion_body
  field :level, :type => Integer
  field :valuation, :type => Hash, :default => {correct:4, wrong:-1, unanswered:0}

  #relationship
  has_many :answers
  belongs_to :subject, index:true
  belongs_to :exam, index:true
  belongs_to :contributor, index:true

  index({code:1},{unique:true})

  # callbacks
  before_save :set_valuation

  def compile_bb
    self.question_body = self.question_body_bb.bbcode_to_html if self.question_body_bb
    self.discussion_body = self.discussion_body_bb.bbcode_to_html if self.discussion_body_bb
  end

  def smptn_question?
    self.exam.present? and self.exam.un?
  end

  def un_question?
    self.exam.present? and self.exam.smptn?
  end

  def exercise_question
    self.exam.blank?
  end

  def set_valuation
    if self.smptn_question?
      self.valuation = Exam["smptn"]
    elsif self.un_question?
      self.valuation = Exam["un"]
    end       
  end

  def validate?(other_answer)
    self.answer_key.downcase.eql?(other_answer)
  end
end
