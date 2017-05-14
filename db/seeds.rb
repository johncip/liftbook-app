# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_user_content(user)
  bp = Lift.create(user: user, name: 'Bench Press')
  Nickname.create(lift: bp, name: 'bp')
  Entry.create(lift: bp, sets: 5, reps: 5, weight: 135, units: :lb)
end

john = User.create(name: 'John', email: 'john@liftbook.io')
create_user_content(john)
