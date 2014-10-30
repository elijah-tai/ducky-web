# app/controllers/admin_controller.rb

# explicitly require the Mandrill API
require 'mandrill'

# send a new message
m = Mandrill::API.new

message = { 
:subject=> "Menu for #{@meal_plan.title} is up", 
:from_name=> "Ducky",
:from_email=>"getduckyapp@gmail.com",
:to=>User.to_mandrill_to(User.paid), 
:html=>render_to_string('user_mailer/meal_plan_email', :layout => false), 
:merge_vars => User.to_mandrill_merge_vars(User.paid),
:preserve_recipients => false
} 

sending = m.messages.send message