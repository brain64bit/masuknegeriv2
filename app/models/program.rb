class Program
  include Mongoid::Document
  field :name, type: String
  field :description, type: String

  has_many :subjects
  has_many :students
  has_many :exams

  class << self
    def ipa
      find_by(name:"IPA")
    end

    def ips
      find_by(name:"IPS")
    end

    def ipc
      find_by(name:"IPC")
    end
  end
end
