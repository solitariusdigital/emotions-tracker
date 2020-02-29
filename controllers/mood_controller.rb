
# create mood
post '/mymoods' do
  
  create_moods(params[:name], params[:image_url], params[:thoughts], params[:comments], params[:activities], session[:user_id], params[:emotions])

  redirect '/mymoods'
end

# '/mood/:id/edit'
get '/mood/:id/edit' do

  result = find_mood_by_id( params[:id] )
  @mood = result[0]
  
  erb :"moods/edit_mood"
end

# edit mood
patch '/mood/:id' do
    
  update_mood(params[:name], params[:image_url], params[:thoughts], params[:comments], params[:activities], params[:emotions], params[:id])
  
  redirect '/mymoods'
end

# new mood
get '/mood/new' do
  redirect 'login' unless logged_in?

  erb :"moods/new_mood"
end

# 
get '/mymoods' do
  redirect 'login' unless logged_in?

  results = all_moods(session[:user_id])
  @all_moods = results

  result = current_user(session[:user_id])
  @user = result[0]

  erb :"moods/my_mood"
end

get '/mood/:id' do
  
  result = find_mood_by_id(params[:id])
  @mood = result

  erb :"moods/mood"
end

# delete m ood
delete '/mood/:id' do
  
  sql = "delete from moods where id = #{ params[:id] };"
 
  run_sql(sql) 

  redirect '/mymoods'
end
# log out
get '/session' do
  session[:user_id] = nil

  redirect '/'
end