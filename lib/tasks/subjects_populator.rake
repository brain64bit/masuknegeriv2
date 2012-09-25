require 'spreadsheet'

desc "populate subjects for question"
task :subjects_populator => :environment do
	file = File.join(Rails.root, 'doc','feature','kode-topik-soal-masuk-negeri.xls')
	data = Spreadsheet.open(file).worksheet(0)
	template = {
	  "Matematika Dasar" => (2..16),
	  "Matematika IPA" => (17..22),
	  "Fisika" => (23..43),
	  "Kimia" => (44..58),
	  "Biologi" => (59..86),
	  "Bahasa Indonesia" => (87..106)
	  "Sosiologi" => (107..120),
	  "Sejarah" => (121..141),
	  "Geografi" => (142..159),
	  "Ekonomi" => (160..182),
	  "Bahasa Inggris" => (183..200),
	  "Tes Potensi Akademik" => (201..210)
	}

	template.each do |k,v|
		parent = Subject.create(name:k.titleize, alias_name:k.downcase)
		puts "*** create subject parent : #{parent.name}"
		v.each do |i|
			topic = data.row(i)[1]
			code = data.row(i)[2]
			Subject.create(name:topic.titleize, alias_name:topic.downcase, code:code, parent:parent)
			puts "create subject children #{topic}"
		end
	end
end