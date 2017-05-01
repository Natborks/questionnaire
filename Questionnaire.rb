require 'csv'

class Analysis
	attr_reader :result

	def read_csv
		CSV.foreach('Delanyo (1).csv')	do |row|
			row.inspect #if row[0][0] > 1
		end	
	end
end

new_analysis = Analysis.new
puts new_analysis.read_csv

