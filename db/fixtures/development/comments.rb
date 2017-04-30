
Comment.seed do |s|
   s.id            = 1
   s.user_id       = User.find(1).id   # masterのid
   s.lesson_log_id = LessonLog.last.id
   s.comment       = "大変よくできました。"
end
