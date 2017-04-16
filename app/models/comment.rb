class Comment < ApplicationRecord
   belongs_to :user
   belongs_to :lesson_log

   validates :user_id,        presence: true
   validates :lesson_log_id,  presence: true
   validates :comment,        presence: true
end
