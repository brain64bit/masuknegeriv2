class Subject
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slugify

  field :name, type: String
  field :alias_name, type: String
  
  has_many :children, :class_name => "Subject", :inverse_of => :parent
  belongs_to :parent, :class_name => "Subject", :inverse_of => :children, :index => true
  has_many :questions

  private
  def generate_slug
  	self.name.parameterize
  end
end
