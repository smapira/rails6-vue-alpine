# starter-rails6-vue

## Spec

- Ruby 2.7.1
- Ruby on Rails 6.0.3.2
- Webpacker 5.1.1

## History Command lines

```bash
rails new starter-rails6-vue -B --webpacker=vue --skip-test
bundle config set path 'vendor/bundle'
bundle install -j 4
bundle update webpacker # to ~> 5.x
rails webpacker:install
rails webpacker:install:vue
rails webpacker:install:typescript
rails generate controller hello_vue index
```

## Usage
1. bundle exec rails credentials:edit
2. set firebase api information in Dockerfile 
3. docker-compose up
4. open http://0.0.0.0:3000
