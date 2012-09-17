class Report
  include Mongoid::Document
  include Mongoid::Timestamps

  field :solved, type: Boolean, :default => false

  embeds_many :report_messages
  
  attr_accessor :message
end
