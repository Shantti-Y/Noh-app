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

   validates :location,     presence: true
   serialize :characters,   Hash
   # REVIEW charactersは"演目の登場人物"です。
   #        Hash形式をとりました(key：登場人物名、　value：演目における役回り、人物の説明)
   #                           (ex: 演目「橋弁慶」レコード中　{"牛若丸" => "五条の橋で弁慶を待ち受け、対峙する。"})
   # =>     キー値が日本語になってしまいすが何か暫定で考えられるエラー(もしくは訂正事項)などございますか？
end
