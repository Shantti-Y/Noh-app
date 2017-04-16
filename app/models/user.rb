class User < ApplicationRecord

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[\w\d\-.]+\.[A-z]+\z/
   VALID_ROLE_KEYS   = ["master", "pupil"]

   validates :name,        presence: true
   validates :email,       presence: true,
                           format: { with: VALID_EMAIL_REGEX }
   validates :password,    presence: true,
                           allow_nil: true,
                           length: { minimum: 4 }
   has_secure_password
   validate  :is_pupil?    # master_id用のバリデーション
   enum role: { master: 1, pupil: 2 }
   validates :role,        inclusion: { in: VALID_ROLE_KEYS }

   def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
   end


   # TODO アソシエーションの要領で{ belongs_to: User.master, has_many: User.pupils }がしたい
   #      ex. first_pupil.master.name や first_master.pupils.countなど

   private
      # 'role'が１(master)の場合、id入力を受け付けない
      def is_pupil?
         if self.master? && self.master_id != nil
            errors.add(:master_id, "can not be added because of its roke 'master'.")
         elsif self.pupil? && !(User.find_by(id: self.master_id))
            errors.add(:master_id, "could not find the relative master.")
         end
      end
end
