require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get ("/") do
 erb(:elephant)
end

get("/giraffe") do
  "Hopefully this gets out without restarting the server"
end

get("/dice/2/6") do
  number_1= rand(1..6)
  number_2= rand(1..6)
  sum= number_1+ number_2
  @outcome= "Your rolled a #{number_1} and a  #{number_2} for a total of #{sum}."
  erb(:two_six)
end

get ("/dice/2/10") do
  number_1= rand(1..10)
  number_2= rand(1..10)
  sum= number_1 + number_2
  @outcome= "Your rolled a #{number_1} and a  #{number_2} for a total of #{sum}."
  erb(:two_ten)
end

get ("/dice/1/20") do
  number_1= rand(1..20)
  @outcome= "You rolled a #{number_1}"
  erb (:one_twenty)

  
end

get ("/dice/5/4") do
  number_1 = rand(1..4)
  number_2 = rand(1..4)
  number_3 = rand(1..4)
  number_4 = rand(1..4)
  number_5 = rand(1..4)
  sum = number_1 + number_2 + number_3 + number_4 + number_5
  @outcome = "You rolled a #{number_1}, a #{number_2}, a #{number_3}, a #{number_4}, and a #{number_5} for a total of #{sum}"
  erb (:five_four)

  
end
