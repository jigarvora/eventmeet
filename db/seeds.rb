# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  # SQLite
  ActiveRecord::Base.connection.execute("DELETE FROM #{table}") unless table == "schema_migrations"
end

Event.delete_all
launch = Event.create(title: "Jigar & Ishaan App Launch Party",
  description: 
    %{<p>
        This party is to celebrate the launch of a billion dollar app created by Jigar & Ishaan.
      </p>},
  loc_city:   'Sunnyvale',
  visibility: 0,
  date: DateTime.new(2015, 7, 7))

User.delete_all
launch.users.create(name: "Jigar Vora",
  email: 'jigar@gmail.com',
  birthday: DateTime.new(2000, 01, 01),
  gender: 0)

launch.users.create(name: "Ishaan Sutaria",
  email: 'ishaan@gmail.com',
  birthday: DateTime.new(2001, 01, 01),
  gender: 0)
