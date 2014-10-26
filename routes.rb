get '/' do
  erb :lobby
end

get '/result' do
  Server.loan = Loan.new params
  Server.loan.calculate
  erb :result
end
