def create_user_content(user)
  bp = Lift.create(user: user, name: 'Bench Press')
  Nickname.create(lift: bp, name: 'bp')
  Entry.create(lift: bp, sets: 5, reps: 5, weight: 135, units: :lb)
end

john = User.create(name: 'John', email: 'john@liftbook.io')
create_user_content(john)
