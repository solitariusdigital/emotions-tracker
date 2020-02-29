
def create_users(name, dob, sex, origin, email, password)
    
  digested_password = BCrypt::Password.create(password)

  sql = <<~SQL
      insert into users 
      (name, dob, sex, origin, email, password_digest)
      values 
      ($1, $2, $3, $4, $5, $6);
  SQL
  run_sql(sql , [name, dob, sex, origin, email, digested_password])
end

def logged_in?
  if session[:user_id]
    return true
  else
    return false
  end
end

def login_user(email)
  sql = "select * from users where email = $1;"
  run_sql(sql, [email])
end

def current_user(id)
  sql = "select * from users where id = $1;"
  run_sql(sql, [id])
end