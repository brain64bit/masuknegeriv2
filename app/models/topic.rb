class Topic
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slugify

  field :name, type: String
  field :alias_name, type: String

  #relationship
  has_many :questions
  belongs_to :subject

  private
  def generate_slug
  	self.name.parameterize
  end
end
