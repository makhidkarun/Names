# Provides his and her first and last names.
class Name
  
	def first_name(gender)
		genders = ['male', 'female']
		unless genders.include?(gender)
			return "Unknown"
		end
    begin 
      require "sqlite3"
      db = SQLite3::Database.open "names.db"
      first_name_query = db.prepare "SELECT * from humaniti_#{gender}_first ORDER BY RANDOM() LIMIT 1"
      first_name_result = first_name_query.execute
      first_name = first_name_result.first
    ensure
      first_name_query.close if first_name_query
      db.close if db
    end
    return first_name[0].to_s
  end

  def last_name()
    begin 
      require "sqlite3"
      db = SQLite3::Database.open "names.db"
      last_name_query = db.prepare "SELECT * from humaniti_last ORDER BY RANDOM() LIMIT 1"
      last_name_result = last_name_query.execute
      last_name = last_name_result.first
    ensure
      last_name_query.close if last_name_query
      db.close if db
    end
    return last_name[0].to_s
  end
end

namer = Name.new()
puts "#{namer.first_name('male')} and #{namer.first_name('female')} #{namer.last_name}"
