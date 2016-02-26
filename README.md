# simulator
elevator simulator

bundle install
rails g rspec:install
rake db:create
rspec


REST API
-------------------------

POST /buildings {building:{name:'x', floor_count:1, elevator_count:1}}
