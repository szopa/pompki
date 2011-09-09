Factory.define :user do |f|
  f.email 'test@example.pl'
  f.password 'secret' 
  f.created_at Time.now
end
