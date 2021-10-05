module CollegesHelper

require 'net/http'
require 'json'



	def load_data()
		url = 'https://raw.githubusercontent.com/Hipo/university-domains-list/master/world_universities_and_domains.json'
		uri = URI(url)
		response = Net::HTTP.get(uri)
		json = JSON.parse(response)


		json.each do |college|
			if college['country'].downcase == "united states" || college['country'].downcase ==  'canada'

				@college = College.new(name: college['name'], country: college['country'])
				 	if @college.save
						college['web_pages'].each do |web_page|
						@domain = Domain.new(title: web_page, college_id: @college.id)
						if @domain.save
							 	puts "College and domains are successfully created"
						end
					end
				end

			end
		end

	end

end
