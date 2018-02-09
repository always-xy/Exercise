class JZipCode
	def find_by_code(code)
		sql = "SELECT * FROM zips WHERE code = ?"
		str = ""
		SQLite3::Database.open(@dbfile) do |db|
			db.execute(sql, code) do |row|
				str << sprintf("%s %s", row[0], row[4], << "\n")
			end
		end
	end
	str
end

def find_by_address(addr)
	sql = "SELECT * FROM zips WHERE alladdr LIKE ?"
	str = ""
	SQLite3::Database.open(@dbfile) do |db|
		db.execute(sql, "%#{addr}%") do |row|
			str << sprintf("%s %s", row[0], row[4]) << "\n"
		end
	end
	str
end
end