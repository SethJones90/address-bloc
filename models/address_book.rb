	require_relative "entry"
	require "csv"

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

	def import_from_csv(file_name)
		csv_text = File.read(file_name)
		csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

		csv.each do |row|
			row_hash = row.to_hash
			add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
		end
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