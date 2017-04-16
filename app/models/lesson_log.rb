class LessonLog < ApplicationRecord

   belongs_to :user
   belongs_to :lesson

   validates :user_id,        presence: true
   validates :lesson_id,      presence: true
   validates :points,         numericality: { # REVIEW points(進捗)の規定範囲(暫定)はこれでよいか
                                             greater_than_or_equal_to: 0,
                                             less_than_or_equal_to:    50
                                             }
   validates :lesson_date,    presence: true

   # REVIEW lesson_dateは手入力(自己申告制)？
end
