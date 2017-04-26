class User < ApplicationRecord
   has_many :lesson_logs, dependent: :destroy
   has_many :comments,    dependent: :destroy

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[\w\d\-.]+\.[A-z]+\z/
   VALID_ROLE_KEYS   = ["master", "pupil"]

   validates :name,        presence: true
   validates :email,       presence: true,
                           format: { with: VALID_EMAIL_REGEX }
   validates :password,    presence: true,
                           allow_nil: true,
                           length: { minimum: 4 }
   has_secure_password
   validate  :pupil_belongs_to_master    # master_id用のバリデーション
   enum role: { master: 1, pupil: 2 }
   validates :role,        inclusion: { in: VALID_ROLE_KEYS }
   validates :style,       presence: true
   validate  :style_equal_to_master    # style用のバリデーション
   # REVIEW styleは"流儀カテゴリ"にあたります。
   #   流派は役職ごとに複数存在し、それぞれが独立しています。。
   # => ex. 能における役職がシテ方：　観世流、宝生流、金春流、金剛流、喜多流
   #                    　 ワキ方：　高安流、福王流、宝生流...etc
   #   業界の特性上、能楽師は一度属した流派から別の流派に動くことはないそうです...

   def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
   end

   def is_pupil?
      if self.pupil?
         return true
      elsif self.master?
         return false
      end
   end


   # masterとpupilsのアソシエーション(master : pupils = 1 : n)
   def pupils
      if !self.is_pupil?
         return User.where(master_id: self.id)
      end
   end

   def master
      if self.is_pupil?
         return User.find(self.master_id)
      end
   end

   private

      # 'role'が１(master)の場合、id入力を受け付けない
      def pupil_belongs_to_master
         if self.is_pupil? && !(User.find_by(id: self.master_id))
            errors.add(:master_id, "could not find the relative master.")
         elsif !self.is_pupil? && self.master_id != nil
            errors.add(:master_id, "can not be added because of its role 'master'.")
         end
      end

      # 弟子の流儀は師匠と合致していなければならない
      def style_equal_to_master
         if self.is_pupil? && self.style != self.master.style
            errors.add(:style, "can not be set a different style from master's.")
         end
      end
end
