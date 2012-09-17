class Salute
  include Mongoid::Document
  include Mongoid::Timestamps

  field :salutes_count,  :type => Integer, :default => 0
  field :salutor, :type  => Array, :default => [] 
end
