class Contact < ActiveRecord::Base
	validates :name, :phone, presence: true
	validates :name, length: { in: 3..160 }
	validates :phone, length: { in: 8..11 },  numericality: { only_integer: true }
end
