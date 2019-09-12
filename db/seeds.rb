# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "#"*100
p "Admin Creation"
p "email: amita.verma@navaratan.com"
p "password: admin123"
p "name: Admin"
p "#"*100
admin = Admin.create({
					name: 'admin',
					email: 'gajendarkodela@gmail.com',
					password: 'admin123',
          max_leaves: 20
				})
