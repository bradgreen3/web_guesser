require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  user_input = params['guess']
  message = message_setter(user_input)
  color = set_color(message)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => color}
end

def set_color(message)
  case message
    when "Way too high!" then "red"
    when "Way too low!" then "red"
    when "Too high!" then "#ffe6e6"
    when "Too low!" then "#ffe6e6"
    when "You got it right!" then "green"
  end
end

def message_setter(user_input)
  if (user_input.to_i - 5) > SECRET_NUMBER
    "Way too high!"
  elsif (user_input.to_i + 5) < SECRET_NUMBER
    "Way too low!"
  elsif user_input.to_i > SECRET_NUMBER
    "Too high!"
  elsif user_input.to_i < SECRET_NUMBER
    "Too low!"
  elsif user_input.to_i == SECRET_NUMBER
    "You got it right!"
  end

end
