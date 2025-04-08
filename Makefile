render-build:
		bundle install
		bundle exec rails assets:precompile
		bundle exec rails assets:clean
		bundle exec rails db:migrate
		bundle exec rails db:seed

install:
		bin/setup

test:
		bin/rails test

render-start:
		bin/rails server

lint:
		bundle exec rubocop
		bundle exec slim-lint app/views/

lint-fix:
		bundle exec rubocop -A

.PHONY: test