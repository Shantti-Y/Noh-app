# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
<<<<<<< HEAD
=======

master = User.create!(
                     name: '明石　和利',
                     email: 'master@gmail.com',
                     password_digest: User.digest('password'),
                     role: 1,
                     style: '金剛流'
                     )

pupil = User.create!(
                     name: '宮本　常間太郎',
                     email: 'pupil@gmail.com',
                     password_digest: User.digest('password'),
                     role: 2,
                     master_id: master.id,
                     style: '金剛流'
                     )

f_benkei = Lesson.create!(
                           title: "船弁慶",
                           description: "平家追討に功績をあげた源義経でしたが、
                           頼朝に疑惑を持たれ、鎌倉方から追われる身となります。
                           義経は、弁慶や忠実な従者とともに西国へ逃れようと、摂津の国
                           大物の浦へ到着します。義経の愛妾、静（しずか）も一行に伴って
                           同道していましたが、女の身で困難な道のりをこれ以上進むことは
                           難しく、弁慶の進言もあって、都に戻ることになりました。
                           別れの宴の席で、静は舞を舞い、義経の未来を祈り、再会を願いながら、
                           涙にくれて義経を見送ります。(以下略)",
                           genre: '五番目物'
                           )
shou =     Lesson.create!(
                           title: "猩々",
                           description: "中国のかね金山（きんざん）※の麓、揚子（ようず）の里に、
                           高風（こうふう）という大変親孝行の男が住んでいました。ある晩のこと、
                           高風は、揚子の市でお酒を売れば、富み栄えることができるという夢を見ます。
                           夢のお告げに従って、お酒の商売をしたところ、高風はだんだんとお金持ちに
                           なっていきました。(以下略)",
                           genre: '五番目物'
                           )
h_benkei = Lesson.create!(
                           title: "橋弁慶",
                           description: "比叡山の僧、武蔵坊弁慶は、祈願のため五条の天神
                           （または北野天神、あるいは十禅寺）に参詣をしようと思っていたところ、
                           従者から、五条の橋に化け物のような人斬りが出るので、止めるよう進言されます。
                           いったんは思いとどまった弁慶ですが、怖気づいたと思われてはならないと、
                           怪しい人斬りを退治することを決意し、夜になるのを待ちます。(以下略)",
                           genre: '二番目物'
                           )
okina =    Lesson.create!(
                           title: "翁",
                           description: "「翁」は、「能にして能にあらず」といわれ、
                           まさに別格の一曲です。どのカテゴリーにも属さず、物語めいたものはありません。
                           神聖な儀式であり、演者は神となって天下泰平、国土安穏を祈祷する舞を舞います。
                           (以下略)",
                           genre: '一番目物'
                           )
ishi =     Lesson.create!(
                           title: "殺生石",
                           description: "玄翁という高僧が下野国那須野の原（今の栃木県那須郡那須町）
                           を通りかかります。ある石の周囲を飛ぶ鳥が落ちるのを見て、玄翁が
                           不審に思っていると、ひとりの女が現れ、その石は殺生石といって近づく生き物を
                           殺してしまうから近寄ってはいけないと教えます。玄翁の問いに、
                           女は殺生石の由来を語ります。(以下略)",
                           genre: '五番目物'
                           )

today = Date.today
l1 = LessonLog.create!(
                  user_id: pupil.id,
                  lesson_id: f_benkei.id,
                  points: 32,
                  lesson_date: today - 1.week
                  )
l2 = LessonLog.create!(
                  user_id: pupil.id,
                  lesson_id: shou.id,
                  points: 23,
                  lesson_date: today - 5.days
                  )
l3 = LessonLog.create!(
                  user_id: pupil.id,
                  lesson_id: h_benkei.id,
                  points: 12,
                  lesson_date: today - 3.days
                  )
l4 = LessonLog.create!(
                  user_id: pupil.id,
                  lesson_id: f_benkei.id,
                  points: 45,
                  lesson_date: today - 1.day
                  )
l5 = LessonLog.create!(
                  user_id: pupil.id,
                  lesson_id: ishi.id,
                  points: 32,
                  lesson_date: today
                  )

Comment.create!(
                  user_id:       master.id,
                  lesson_log_id: l1.id,
                  comment: "大変よくできました"
               )
>>>>>>> 52cdb7e... 演目の舞台(loction)と登場人物(characters)=>Lesson 追加
