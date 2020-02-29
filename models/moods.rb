require 'pry'

# create moods table
def create_moods(name, image_url, thoughts, comments, activities, user_id, emotions)
    # raise emotions.to_s
    sql = <<~SQL
        insert into moods 
        (name, image_url, thoughts, comments, activities, user_id, emotions)
        values 
        ($1, $2, $3, $4, $5, $6, $7);
    SQL
    # raise sql
    run_sql(sql, [name, image_url, thoughts, comments, activities, user_id, "{#{emotions.map {|e| "\"#{e}\"" }.join(', ')}}"])
end

# read/access
def find_mood_by_id(id)
    sql = "select * from moods where id = $1;"
    run_sql(sql, [id])
end
  
def all_moods(user_id)
    sql = "select * from moods where user_id = $1;"
    run_sql(sql, [user_id])
end

# edit/update
def update_mood(name, image_url, thoughts, comments, activities, emotions, id)
    sql = <<~SQL
      update moods 
      set 
      name = $1, image_url = $2, 
      thoughts = $3, comments = $4,
      activities = $5, emotions = $6, id = $7 where id = $7;
    SQL
    run_sql(sql, [name, image_url, thoughts, comments, activities, emotions, id])
end