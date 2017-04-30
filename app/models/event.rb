class Event < ApplicationRecord
   belongs_to :lesson

   # REVIEW すべてのフィールドにpresenceバリデをかけました。
   validates :event_id,       presence: true
   validates :event_date,     presence: true
   validates :start_time,     presence: true
   validates :title,          presence: true
   validates :lesson_id,      presence: true
   validates :location,       presence: true
   serialize :location,       Hash
   # REVIEW locationには(key: 会場、　value: サイトのurl)を載せます。

   # TODO before_createのタイミングでstart_timeのコンバートが必要
   # =>   詳細データはスクレイピングで所得したい
end
