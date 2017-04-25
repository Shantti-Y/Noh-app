class Lesson < ApplicationRecord
   has_many :lesson_logs, dependent: :destroy

   validates :title,       presence: true
   # REVIEW descriptionにバリデーションは必要か
   #        今後の進捗次第でLesson中フィールドが変化(サムネとかの追加?)すると思いますので
   #        今は手を付けないでおこうと思います。

   validates :genre,       presence: true
   # REVIEW genreは"習い曲カテゴリ"にあたります。
   # => 曲のカテゴリについて説明
   #　　　能は、演目のシテ(主人公)がどのようなキャラなのかで
   # =>  曲のカテゴリが大きく分かれる。
   #     例： シテ方が"鬼"を演ずる場合、その演目カテゴリは
   # =>  "五番目物"と呼ばれる。
end
