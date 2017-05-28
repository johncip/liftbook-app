def create_user_content(user)
  bench = Lift.create!(
    user: user
  )
  workout = Workout.create!(
    user: user,
    name: 'Chest Day',
    date: Date.new(2017, 5, 13)
  )
  workout.entries.create!(
    lift: bench,
    sets: 5,
    reps: 5,
    weight: 135,
    units: :lb
  )
end


john = User.create!(
  name: 'John',
  email: 'john@liftbook.io'
)
create_user_content(john)
