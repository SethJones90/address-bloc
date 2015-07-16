	require_relative "entry.rb"

class AddressBook
	attr_accessor :entries

	def initialize
		@entries = []
	end

	def add_entry(name, phone, email)

		index = 0
		@entries.each do |entry|

			if name < entry.name
				break
			end

			index += 1

		end

		@entries.insert(index, Entry.new(name, phone, email))

	end
	def remove_entry(email)
  		@entries.delete_if {|entry| entry.email == email}
	end

	def get_entry_by_number(index)
		entries[index.to_i]

	end

	def has_entries?
		entries.size > 0
	end

	def count
		entries.size
	end
end