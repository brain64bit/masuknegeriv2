class ReportMessage
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embedded_in :report
  field :message
end
