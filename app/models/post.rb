class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  field :content_bb, type: String
  field :type, type: String
  field :published, type: Boolean
  field :commentable, type: Boolean

  TYPE = %w{ news announcement }
end
#1160005616389