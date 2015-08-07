# Homepage (Root path)

get '/' do
  erb :index
end

get '/form' do
	erb :form
end

get '/repair-list' do
	@repair = Repair.all
	erb :repairList
end
	
#detail of the specific repair order
get '/repair/:id' do
	 @repair = Repair.find(params[:id])
	 @user = User.find(@repair.user_id)
	 @comment = Update.where(repairs_id: params[:id])
	 
	 erb :repairDetail
end

#phone is back from repair
get '/repair/:id/back-from-repair' do

	#send_message()

	@repair = Repair.find(params[:id])
	@repair.status = "Back From Repair"
	@repair.save	


	redirect "/repair/#{@repair.id}"
end

#close button
get '/repair/:id/close' do
	@repair = Repair.find(params[:id])
	@repair.status = "close"
	@repair.save
	
	redirect "/repair/#{@repair.id}"
end

#output the add comment section
get '/repair/:id/add-comment' do
	@repair = Repair.find(params[:id])
	@user = User.find(@repair.user_id)
	erb :addComment
end

#create the comment on database
post '/repair/:id/add-comment' do
	@repair = Repair.find(params[:id])
	@user = User.find(@repair.user_id)
	
	user = "admin"
	comment = params[:comment]
	update = @repair.updates.create ({
		user: user,
		comment: comment,
		repairs_id: params[:id]
		})
	erb :repairDetail
end


post '/form' do
	THnum = params[:THnum]
	firstName = params[:firstName]
	lastName = params[:lastName]
	dept = params[:dept]
	phone = params[:phone]
	problem = params[:problem]
	ticketNum = params[:ticketNum]
	GLnum = params[:GLnum]
	phoneNum = params[:phoneNum]
	IMEI = params[:IMEI]
	email = firstName+'.'+lastName+'@york.ca'

	user = User.find_by(email: email)
	#check if user alreadt exist
	repair = Repair.find_by(THnum: THnum)

	if (!user && !repair)
	user = User.create ({
		firstName: firstName,
		lastName: lastName,
		email: email,
		dept: dept,
		GLnum: GLnum})
	end
	
	if (!repair)
		repair = user.repairs.create ({
			THnum: THnum,
			phone: phone,
			problem: problem,
			ticketNum: ticketNum,
			IMEI: IMEI,
			phoneNum: phoneNum,
			status: "on repair"
			})
	end
	#session[:user_id] = user.id
	#for later when users are added

	redirect '/'
end



get '/search' do 
	search = params[:search]

	if searchBy == "TH number"
		@repair = Repair.find_by(THnum: search)
	elsif searchBy == "Phone Number"
		@repair = Repair.find_by(phoneNum: search)
	end
		
	
	redirect "/repair/#{@repair.id}"

end

def send_message
    Pony.mail(
      :from => "christinamelissa8@gmail.com",
      :to => 'christinamelissa8@gmail.com',
      :subject => "test",
      :body => "test",
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'christinamelissa8@gmail.com',
        :password             => 'Piksi990!',
        :authentication       => 'plain',
        :domain               => 'localhost.localdomain',
        :ssl 				  => true
      })
  end