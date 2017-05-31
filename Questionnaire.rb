require 'csv'

class Analysis
	attr_reader :result, :uni, :high_school, :professional

	#read csv into array
	def read_csv
		@result = CSV.open "Untitled form (2).csv"
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
		rev = Array.new
		result.each_with_index do |row,inx|
			new_zero = Array.new
			zero,zero1,zero2,zero3,zero4,zero5,zero6,zero7,zero8,zero9,zero10 = 0,0,0,0,0,0,0,0,0,0,0
				row.each_with_index do |column,index|
					next if index == 0
					case index 
						when 1,2
							zero += reverse(column) 
						when 3,4,5,6,7,8,9,10,11,12,113
							zero1 += reverse(column) 
						when 18,19
							zero2 += reverse(column) 
						when 20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37
							zero3 += reverse(column) 
						when 38,39
							zero4 += reverse(column) 
						when 41,42
							zero5 += reverse(column) 
						when 44
							zero6 += reverse(column) 
						when 49,50,52
							zero7 += reverse(column) 
						when 54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71
							zero8 += reverse(column) 
						when 72,73
							zero9 += reverse(column)
						else
							zero10 += column							
					end

				end
				new_zero = (zero/2.0)+(zero1/11)+(zero2/2)+(zero3/18)+(zero4/2)+(zero5/2)+(zero6/1.0)+(zero7/3.0)+(zero8/18)+(zero9/2.0)+(zero10/17)
				rev << new_zero
		end
		print rev
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
	def groupings(result)
		@uni,@high_school,@professional = Array.new,Array.new, Array.new
		result.each_with_index do |row,index|
			next if index == 0
			if row[2] == "University"
				@uni << row 
			elsif 	row[2] == "Senior High School"
				@high_school << row
			else
				@professional << row
			end
		end	
	end

end

new_analysis = Analysis.new
new_analysis.read_csv
trimmed = new_analysis.trim(new_analysis.result)
new_analysis.analyze(trimmed)
#puts "university:\n#{new_analysis.csv(new_analysis.uni)}\n\n"
#puts "Senior High School:\n#{new_analysis.csv(new_analysis.high_school)}\n\n"
#puts "Professional Worker:\n#{new_analysis.csv(new_analysis.professional)}\n\n"
