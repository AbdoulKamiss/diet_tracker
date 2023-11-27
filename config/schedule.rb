# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
every 1.day, at: '8:00 am' do
    runner "Meal.create(name: 'Petit Déjeuner')"
    runner "Meal.create(name: 'Déjeuner')"
    runner "Meal.create(name: 'Dîner')"
    runner "Meal.create(name: 'Collation')"
end

every :monday, at: '6:00 am' do
    runner "Weight.create(name: 'Poids de la semaine')"
end

every 2.hours do
    runner "Meal.create(name: 'Johnny')"
    runner "Weight.create(name: 'Johnny')"
end

every 5.minutes do
    runner "Workout.create(name: 'Test')", :environment => "development"
end
  
  
  
