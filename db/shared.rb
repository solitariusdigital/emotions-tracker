require 'pg'
require 'bcrypt'

def run_sql(sql, args = [])
  conn = PG.connect(ENV['DATABASE_URL'] || {dbname: 'emotions'})
  results = conn.exec_params(sql, args)
  conn.close
  results
end