source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# デフォルトで配備してあるgem群
gem 'rails',                   '~> 5.0.2'
gem 'sqlite3'
gem 'puma',                    '~> 3.0'
gem 'sass-rails',              '~> 5.0'
gem 'uglifier',                '>= 1.3.0'
gem 'coffee-rails',            '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks',              '~> 5'
gem 'jbuilder',                '~> 2.5'
gem 'seed-fu',                 '~> 2.3'                     # seed.rbをより扱いやすく(主にidの割り振りによる管理？)
gem 'font-awesome-rails',      '~> 4.7'                     # font-awesomeを扱うヘルパー
gem 'css3-progress-bar-rails', '~> 0.5.1'                   # プログレスバーを表示、扱うヘルパー
gem 'carrierwave',             '~> 0.11.2'                  # 画像アップロード用ヘルパー
gem 'simple_enum',             '~> 2.3'                     # enumを扱うヘルパー
# gem 'redis', '~> 3.0'
# gem 'therubyracer', platforms: :ruby
# gem 'capistrano-rails', group: :development

# 後から追加したgem群
gem 'bcrypt',              '~> 3.1.7'                    # 文字列(主にパスワード)のハッシュ化

group :development, :test do
  # Add for debug (change from default gem: byebug)
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  # デフォルトで配備
  gem 'web-console',             '>= 3.3.0'
  gem 'listen',                  '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen',   '~> 2.0.0'
end

group :test do
   # 後から追加
   gem 'rails-controller-testing',    '0.1.1'            # assigns関数の追加
   gem 'minitest-reporters',          '~> 1.1.9'         # テスト結果をプログレスバーで表示
end

# デフォルトで配備
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
