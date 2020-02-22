require 'sqlite3'

if File.exists?("maindata2.db")
	File.delete("maindata2.db")
end 

db = SQLite3::Database.new("maindata2.db")

db.execute <<-SQL
	CREATE TABLE users (
	id integer PRIMARY KEY,
	email varchar,
	password varchar);
SQL

db.execute("INSERT INTO users(email,password) values(?,?);",["bob@sample.com","pass123"])
db.execute("INSERT INTO users(email,password) values(?,?);",["john@sample.com","pass123"])
db.execute("INSERT INTO users(email,password) values(?,?);",["mary@sample.com","pass123"])

my_array = db.execute("SELECT * FROM users;")

puts my_array
