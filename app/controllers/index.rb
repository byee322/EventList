get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
	@event = Event.new
	erb :new_event
end

post '/events/create' do
	@event = Event.create(params[:user])
	if @event.valid?
    @event.save
    session[:event_id] = @event.id
    redirect "/"
  else
    erb :new_event
  end
end
