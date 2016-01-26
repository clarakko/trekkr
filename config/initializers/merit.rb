# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
badge_id = 0
[{
  id: (badge_id = badge_id+1),
  name: 'first-trek',
  description: 'You took your first step!'
}, {
  id: (badge_id = badge_id+1),
  name: 'fifth-trek',
  description: '5 treks down!'
}, {
  id: (badge_id = badge_id+1),
  name: 'tenth-trek',
  description: 'A decathlete whose only event is trekking!'
}, {
  id: (badge_id = badge_id+1),
  name: '25th-trek',
  description: 'That\'s like, almost a month of treks!'
}, {
  id: (badge_id = badge_id+1),
  name: '50th-trek',
  description: 'Silver trekker!'
}, {
  id: (badge_id = badge_id+1),
  name: '100th-trek',
  description: 'You are hereby promoted to Centurion!'
}, {
  id: (badge_id = badge_id+1),
  name: 'Speed Demon',
  description: 'Woah, nice jets! Looks like you got faster on a trek.'
}, {
  id: (badge_id = badge_id+1),
  name: 'White Mountain Summiter',
  description: ''
}].each do |attrs|
  Merit::Badge.create! attrs
end

# Merit::Badge.create!(
#   id: 1,
#   name: "first-trek",
#   description: "First trek completed!"
# )
