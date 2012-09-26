require 'spreadsheet'

desc "populate subjects for question"
task :subjects_populator => :environment do
	Subject.destroy_all
	file = File.join(Rails.root, 'doc','feature','kode-topik-soal-masuk-negeri.xls')
	data = Spreadsheet.open(file).worksheet(0)
	template = {
	  "Matematika Dasar" => [(2..16), "IPC"],
	  "Matematika IPA" => [(17..22), "IPA"],
	  "Fisika" => [(23..43), "IPA"],
	  "Kimia" => [(44..58), "IPA"],
	  "Biologi" => [(59..86), "IPA"],
	  "Bahasa Indonesia" => [(87..106), "IPC"],
	  "Sosiologi" => [(107..120), "IPS"],
	  "Sejarah" => [(121..141), "IPS"],
	  "Geografi" => [(142..159), "IPS"],
	  "Ekonomi" => [(160..182), "IPS"],
	  "Bahasa Inggris" => [(183..200), "IPC"],
	  "Tes Potensi Akademik" => [(201..210), "IPC"]
	}

	template.each do |k,v|
		prog = v.last
		program = Program.find_by(name:prog)
		parent = Subject.create(name:k.titleize, alias_name:k.downcase, program:program)
		puts "*** create subject parent : #{parent.name}"
		v.first.each do |i|
			topic = data.row(i)[1]
			code = data.row(i)[2]
			prog = data.row(i)[4]
			program = Program.find_by(name:prog)
			Subject.create(name:topic.titleize, alias_name:topic.downcase, code:code, parent:parent, program:program)
			puts "create subject children #{topic}, prog : #{prog}"
		end
	end
end