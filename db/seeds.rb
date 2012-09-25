# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
{
	"IPA" => "Ilmu Pengetahuan Alam",
	"IPS" => "Ilmu Pengetahuan Sosial",
	"IPC" => "Ilmu Pengetahuan Campuran"
}.each do |k,v|
	Program.create(name:k, description:v)
end