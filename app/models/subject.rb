class Subject
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slugify

  field :name, type: String
  field :alias_name, type: String
  field :code, type: String

  auto_increment :sequence
  
  has_many :children, :class_name => "Subject", :inverse_of => :parent
  belongs_to :parent, :class_name => "Subject", :inverse_of => :children, :index => true
  has_many :questions
  has_many :subject_records
  belongs_to :program

  default_scope asc(:sequence)
  scope :parents, where(parent_id:nil).asc(:created_at)

  class << self
    def program(name="ipc")
      program_ids = if name.eql?("ipc")
        [Program.ipa.id, Program.ips.id, Program.ipc.id]
      elsif ["ipa","ips"].include?(name)
        [Program.ipc.id, Program.send(name).id]
      end
      where(:program_id.in => program_ids)
    end
  end
  
  private
  def generate_slug
  	self.name.parameterize
  end
end
