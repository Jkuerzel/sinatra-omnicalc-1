require "sinatra"
require "sinatra/reloader"

get("/") do

  erb(:square)  

end

get("/square/new") do

  erb(:square)

end

get("/square/results") do

  @number=params.fetch("number").to_f
  @result=@number**2
  erb(:square_result)

end

get("/square_root/new") do

  erb(:square_root)  

end

get("/square_root/results") do

  @number=params.fetch("number").to_f
  @result=@number**(0.5)

  erb(:square_root_result)
end

get("/payment/new") do

  erb(:payment)
end

get("/payment/results") do
  @user_apr=params.fetch("user_apr").to_f
  @user_mpr=params.fetch("user_apr").to_f/1200
  @user_months=params.fetch("user_years").to_i*12
  @user_pv=params.fetch("user_pv").to_f

  @numerator=@user_mpr*@user_pv
  @denominator=1-(1+@user_mpr)**(-1*@user_months)
  @price=@numerator/@denominator

  erb(:payment_result)
end

get("/random/new") do

  erb(:random)

end

get("/random/results") do

  @user_min=params.fetch("user_min").to_f
  @user_max=params.fetch("user_max").to_f

  @random_number=rand(@user_min..@user_max)
  erb(:random_result)

end
