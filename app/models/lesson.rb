class Lesson < ApplicationRecord
   has_many :lesson_logs, dependent: :destroy

   validates :title,       presence: true
   # REVIEW descriptionにバリデーションは必要か
   #        今後の進捗次第でLesson中フィールドが変化(サムネとかの追加?)すると思いますので
   #        今は手を付けないでおこうと思います。

   validates :genre,       presence: true
   # REVIEW genreは"習い曲カテゴリ"にあたります。
   # => 曲のカテゴリについて
   #　　　能は、演目のシテ方(主人公)がどのようなキャラかで曲のカテゴリが大きく分かれます。
   #      全部で5つ(神、男、女、狂、鬼)に分かれており、それぞれ「一番目、二番目...」という風に番号が
   #      割り振られています。
end
