# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

rapt_user = User.create({:username => "rapt", :email => "admin@raptgame.com", :password => "rapt123", :password_confirmation => "rapt123"}) unless User.first

rapt_user = User.first
Dir.foreach("#{RAILS_ROOT}/../official_levels") do |f|
  next if f == '.' or f == '..'
  data = ''
  File.open("#{RAILS_ROOT}/../official_levels/#{f}", "r") { |fs| data = fs.read }
  title = f.split('.').first
  puts title
  level = rapt_user.levels.build({:title => title, :data => data})
  level.title = title
  level.save
end

puts rapt_user.levels.count