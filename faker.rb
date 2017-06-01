require 'faker'
require 'as-duration'

gender = ["Male", "Female"]
occupation = ["University", "Senior High", "Professional Worker", "Creative Genius"]
#occupation = ["Senior High", "Creative Genius"]
#occupation = ["University", "Professional Worker"]
meridain_indicator = ["AM","PM","PM"]

person = Array.new
215.times do
	info = Array.new
	info1 = Array.new
	gend = String.new; age = String.new
	1.times do
		#info << Faker::Time.between(30.days.ago, Date.today, :all).to_s
		t = Time.new(2017, 5, rand(1..30), rand(1..12), rand(1..59), rand(1..59)  )
		t = t.strftime('/%Y')+ t.strftime('/%m')+ t.strftime('/%d') + " "+ t.strftime('%T') + " " + meridain_indicator[rand(0..2)] + " "  + "GMT"
		info << t
		info1 << t

		gend = gender[rand(0..1)]
		info << gend
		info1 << gend

		occu = occupation[rand(0..3)]
		info << occu
		info1 << occu
		#age
		if occu == "University"
			age = rand(18..25).to_s
			info << age
			info1 << age
		elsif occu== "Professional Worker"
			age = rand(20..50).to_s
			info << age
			info1 << age
		elsif occu== "Creative Genius"
			age = rand(16..30).to_s
			info << age
			info1 << age
		else 
			age = rand(16..19).to_s
			info << age
			info1 << age		
		end
		#items
		50.times do
			info << rand(1..5).to_s
		end

		78.times do
			if occu == "Creative Genius"
				num = [1,2,2,3,3,3,4,4,4,4,5,5,5,5,5].sample
				info1 << num.to_s
			else
				info1 << rand(1..5).to_s
			end
		end
		
	end
	info = info.collect(&:inspect).join(',')
	info1 = info1.collect(&:inspect).join(',')
	open('Delanyo (3).csv','a') do |f|
	#	f.puts info
	end

	open('Untitled form (3).csv','a') do |f|
	#	f.puts info1.to_s
	end
	
end
print person[1]


