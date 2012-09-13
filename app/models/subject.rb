class Subject
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slugify

  field :name, type: String
  field :alias_name, type: String
  has_many :topics
  has_many :questions

  private
  def generate_slug
  	self.name.parameterize
  end
end
