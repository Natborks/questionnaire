require 'csv'

class Analysis
	attr_accessor :result, :uni, :high_school, :professional, :creative

	#read csv into array
	def read_csv(filename)
		@result = CSV.open filename
	end

	#trim unwanted parts(age,occupation etc)
	def trim(result)
		t_result = Array.new
		
		result.each_with_index do |row,inx|
			subArray = Array.new
			next if inx == 0
			row.each_with_index do |column, indx|
				 if  indx == 2	
				 	subArray.push(column)
				 elsif indx >3
				 	subArray.push(column.to_i)
				 end
			end
			t_result.push(subArray)
		end

		return t_result
	end

	#do analysis
	def analyze(result)
		reve = Array.new
		
		occu = String.new


		result.each_with_index do |row,inx|
			new_zero = Array.new
			rev = Array.new
			zero = Array.new(11) { |i| i = 0  }
				row.each_with_index do |column,index|
					occu = column if index == 0
					next if index == 0
					case index 
						when 1,2
							zero[0] += reverse(column) 
						when 3,4,5,6,7,8,9,10,11,12,13,18,19
							zero[1] += reverse(column) 
						when 14,15,16,17
							zero[2] += column
						when 20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37
							zero[3] += reverse(column) 
						when 38,39,41,42,44
							zero[4] += reverse(column) 
						when 40,43,45,46
							zero[5] += reverse(column)
						when 47,48, 51,53
							zero[6] += column
						when 49,50,52
							zero[7] += reverse(column) 
						when 54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71
							zero[8]+= reverse(column) 
						when 72,73
							zero[9] += reverse(column)
						else
							zero[10] += column							
					end

				end
				
				for i in 0..11
					puts occu
					puts  zero[i]
				end

				new_zero = ((zero[0]/1.0) + ((zero[1]+zero[2])/17.0) +(zero[3]/18.0) +((zero[4]+zero[5])/9.0) +((zero[6]+zero[7])/7.0) +(zero[8]/18.0) + (zero[9]/2.0) + (zero[10]/5.0)) 
				rev << occu 
				rev << new_zero.round(3).to_s 

				reve << rev
		end
		return reve
	end

	#reverse method
	def reverse(num)
		case num
		when 1
			num = 5
		when 2
			num = 4
		when 3
			num = 3
		when 4
			num = 2
		when 5
			num = 1
		end
	end

	#perform calculations on various grouping of results
	def csv(result)
			zero = Array.new
			result.each_with_index do |row,inx|	
					 zero[inx] = 0			
					 row.each_with_index do |column,i|						
						zero[inx] += column.to_i	if i > 3		
					end
			end
			return zero
	end

	#group array of results 
	def groupings(result,col)
		@uni,@high_school,@professional,@creative = Array.new,Array.new, Array.new, Array.new
		result.each_with_index do |row,index|
			next if index == 0 && col > 0
			if col == 0
				if row[col] == "University" && col == 0
					@uni << row[1] 
				elsif 	row[col] == "Senior High" && col == 0
					@high_school << row[1]
				elsif row[col] == "Creative Genius" && col == 0
					@creative << row[1]
				else
					@professional << row[1]
				end
			else
				if row[col] == "University" 
					@uni << row
				elsif 	row[col] == "Senior High"
					@high_school << row
				elsif row[col] == "Creative Genius" 
					@creative << row
				else
					@professional << row
				end
			end
		end	
	end

end


new_analysis = Analysis.new

#open creativity for reading
#new_analysis.read_csv("Untitled form (2).csv")

#open emotional for reading
new_analysis.read_csv("Delanyo (3).csv")

#group results
new_analysis.groupings(new_analysis.result,2)

open('results.txt','a') do |f|
	
137.times { f.print "="}
f.puts "\n"
f.puts "Emotional intelligence questionnaire "
137.times { f.print "="}
f.puts "\n"
f.puts "\n"

f.puts "UNIVERSITY: #{new_analysis.csv(new_analysis.uni)}"
f.puts "\n"
f.puts "\n"

f.puts "SENIOR HIGH: #{new_analysis.csv(new_analysis.high_school)}"
f.puts "\n"
f.puts "\n"

f.puts "PROFESSIONAL WORKER: #{new_analysis.csv(new_analysis.professional)}"
f.puts "\n"
f.puts "\n"

f.puts "CREATIVE GENIUS: #{new_analysis.csv(new_analysis.creative)}"
f.puts "\n"
f.puts "\n"

end

open('results.txt','a') do |f|

137.times { f.print "="}
f.puts "\n"
f.puts "The Creativity Styles Questionnaire--Revised "
137.times { f.print "="}

#open creativity for reading
new_analysis.read_csv("Untitled form (3).csv")

#trim and analyze creativity
trimmed = new_analysis.trim(new_analysis.result)
analyzed = new_analysis.analyze(trimmed)

#group results
new_analysis.groupings(analyzed,0)


f.puts "\n"
f.puts "\n"

f.puts "UNIVERSITY: #{new_analysis.uni}"
f.puts "\n"
f.puts "\n"

f.puts "SENIOR HIGH: #{new_analysis.high_school}"
f.puts "\n"
f.puts "\n"

f.puts "PROFESSIONAL WORKER: #{new_analysis.professional}"
f.puts "\n"
f.puts "\n"

f.puts "CREATIVE GENIUS: #{new_analysis.creative}"
f.puts "\n"
f.puts "\n"


end
