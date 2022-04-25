bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec rackup --port 4567 --host 0.0.0.0