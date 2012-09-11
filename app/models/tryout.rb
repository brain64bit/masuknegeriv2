class Tryout
  include Mongoid::Document
  field :name, type: String
  field :tryout_type, type: String
  field :day
  field :session
  field :start_time, :type => DateTime
  field :finish_time, :type => DateTime
  
  TYPE = %w{UN SMPTN}

  validates_presence_of :name, :tryout_type
  validates_inclusion_of :tryout_type, :in => TYPE

  def un_type?
  	self.tryout_type.eql?(TYPE.first)
  end

  def smptn_type?
  	self.tryout_type.eql?(TYPE.last)
  end

end
