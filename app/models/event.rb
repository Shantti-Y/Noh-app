class Event < ApplicationRecord
   belongs_to :lesson

   before_create :increment_event_id

   validates :event_date,     presence: true    # 公演の日程
   validates :title,          presence: true    # 公演の演題
   validates :lesson_id,      presence: true    # 公演内の演目(プログラム)
   validates :location,       presence: true    # 会場
   serialize :location,       Hash
   # REVIEW locationには(key: 会場、　value: サイトのurl)を載せます。

   # TODO before_createのタイミングでstart_timeのコンバートが必要
   # =>   詳細データはスクレイピングで所得したい

   private
      def increment_event_id
         if Event.find_by(title: self.title)
            self.event_id = Event.find_by(title: self.title).event_id + 1
         else
            self.event_id = 1
         end
      end

end
