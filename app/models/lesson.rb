class Lesson < ApplicationRecord
   has_many :lesson_logs, dependent: :destroy

   validates :title,       presence: true
   # REVIEW descriptionにバリデーションは必要か
   #        今後の進捗次第でLesson中フィールドが変化(サムネとかの追加?)すると思いますので
   #        今は手を付けないでおこうと思います。
end
