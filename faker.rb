require 'faker'
require 'as-duration'

gender = ["Male", "Female"]
occupation = ["University","University","University","University","Professional Worker", 
					"Senior High", "Professional Worker", "Professional Worker","University"]
meridain_indicator = ["AM","PM","PM"]
#age


person = Array.new
2.times do
	info = Array.new
	1.times do
		#info << Faker::Time.between(30.days.ago, Date.today, :all).to_s
		t = Time.gm(2017, 5, rand(1..31), rand(1..12), rand(1..60), rand(1..60) )
		t = t.strftime('/%Y')+ t.strftime('/%m')+ t.strftime('/%d')+ " "  + t.strftime('%X') + " " 
		 + meridain_indicator[rand(0..2)] + " "  + "GMT"
		info << t
		info << gender[rand(0..1)]
		occu = occupation[rand(0..8)]
		info << occu

		if occu == "University"
			info << rand(18..25).to_s
		elsif occu== "Professional Worker"
			info << rand(20..65).to_s
		else 
			info << rand(15..19).to_s		
		end

		50.times do
			info << rand(1..5).to_s
		end
		
	end
	info = info.collect(&:inspect).join(',')
	open('test.txt','a') do |f|
		f.puts info
	end
	
end
print person[1].to_s

