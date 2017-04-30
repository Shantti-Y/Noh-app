# REVIEW seed_fuに書き込むレコード群はクラス毎にファイルを分割した方がよろしいでしょうか？

User.seed do |s|
   s.id              = 1
   s.name            = "明石 和利"
   s.email           = "master@gmail.com"
   s.password_digest = User.digest('password')
   s.role            = 1
   s.style           = "金剛流"
end

User.seed do |s|
   s.id              = 2
   s.name            = "宮本　常間太郎"
   s.email           = "pupil@gmail.com"
   s.password_digest = User.digest('password')
   s.role            = 2
   s.style           = "金剛流"
end
