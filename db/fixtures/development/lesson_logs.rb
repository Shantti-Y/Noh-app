
today = Date.today

# 各Lessonに1レコードずつlog追加
i = 1
Lesson.all.each do |lesson|
   LessonLog.seed do |s|
      s.id          = i
      s.user_id     = User.find(2)   # pupilのid
      s.lesson_id   = lesson.id
      s.points      = 25
      s.lesson_date = today - i
   end
   i += 1
end

# idが最新のLessonに最新Log追加
LessonLog.seed do |s|
   s.id          = i + 1
   s.user_id     = User.find(2)   # pupilのid
   s.lesson_id   = Lesson.find(6).id
   s.points      = 40
   s.lesson_date = today
end
