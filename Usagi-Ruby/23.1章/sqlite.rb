SQLite3::Database.open "mydb.db" do |db|
  db.execute("SELECT * FROM ADDRBOOK") do |rows|
  	p rows
  end
end