class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  field :code
  field :question_body_bb
  field :question_body
  field :answer
  field :discussion_body_bb
  field :discussion_body

  #relationship
  has_many :levels
  belongs_to :subject
  belongs_to :subject_matter

  index({code:1},{unique:true})

  def compile_bb
    self.question_body = self.question_body_bb.bbcode_to_html if self.question_body_bb
    self.discussion_body = self.discussion_body_bb.bbcode_to_html if self.discussion_body_bb
  end
end
