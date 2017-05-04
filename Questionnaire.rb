require 'csv'

class Analysis
	attr_reader :result

	def read_csv
		@result = CSV.open "Delanyo (1).csv"	
		return result
	end

	def csv(result)
			zero = Array.new
			#@result = CSV.open "Delanyo (1).csv"	
			result.each_with_index do |row,inx|	
					 zero[inx] = 0			
					 row.each_with_index do |column,i|						
						zero[inx] += column.to_i	if i > 3		
					end
			end
			return zero
	end

	def groupings(result)
		uni = Array.new
		result.each do |row|
			uni << row if row[2] == "University"
		end	
		return uni
	end

end

new_analysis = Analysis.new
result = new_analysis.read_csv
uni = new_analysis.groupings(result)
puts new_analysis.csv(uni)

