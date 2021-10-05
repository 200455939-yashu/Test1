class College < ApplicationRecord
	has_many :domains

	 self.per_page = 15
end
