class DailyScore
  include Mongoid::Document
  field :score, type: Integer
  field :date, type: Date

  belongs_to :student

  index({score:1, date:1}, {unique:true})
end
