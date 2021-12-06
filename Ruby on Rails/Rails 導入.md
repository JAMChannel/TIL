
rails new作成
```
rails _6.0.0_ new アプリケーション名 -d mysql --skip-coffee --skip-turbolinks
```

## 導入時オススメ
config application.rb
```
config.generators do |g|
  # css,jsのファイルは作成せず
  g.assets false
  # コントローラー作成時にconfig/routes.rbが書き換えられないようにする。
  g.skip_routes false
  # テストファイルは作成せず
  g.test_framework false
  # ヘルパーファイルも作成せず
  g.helper false
end
```

gemfile
```
group :development, :test do
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end
```

