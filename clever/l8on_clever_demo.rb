require 'clever-ruby'

Clever.configure do |config|
  config.api_key = ENV['CLEVER_API_KEY'] || 'DEMO_KEY'
end

class CleverStatistics
	def self.get_mean_student_count_per_section
		sections = Clever::Section.all
		
		return 0.0 if sections.empty?
		
		sections.inject(0.0) { |total_student_count, section| total_student_count + section.students.size }.to_f / sections.size
	end
end

print "The mean number of students per secton in " + Clever.api_key + " is " + CleverStatistics.get_mean_student_count_per_section.to_s + "\n"

