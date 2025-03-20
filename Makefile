render-build:
		bundle install
		bundle exec rails assets:precompile
		bundle exec rails assets:clean
		bundle exec rails db:migrate

render-start:
		bin/rails server

test:
		bin/rails test

.PHONY: test