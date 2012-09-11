class Level
  include Mongoid::Document
  field :name, type: String
  LEVELS = %w{
  	kelas_1
		kelas_2
		kelas_3
		kelas_4
		kelas_5
		kelas_6
		kelas_7
		kelas_8
		kelas_9
		kelas_10
		kelas_11
		kelas_12_IPC
		kelas_12_IPA
		kelas_12_IPS
  }
  validates_presence_of :name
  validates_inclusion_of :name, :in => LEVELS
  validates_uniqueness_of :name

end
