class User < ApplicationRecord

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[\w\d\-.]+\.[A-z]+\z/

   validates :name,        presence: true
                           # REVIEW lengthによる字数制限は必要か
   validates :email,       presence: true,
                           format: { with: VALID_EMAIL_REGEX }
                           # REVIEW lengthによる字数制限は必要か
   validates :password,    presence: true,
                           allow_nil: true
                           # REVIEW lengthによる字数制限は必要か
   has_secure_password
   validate :is_pupil?     # master_id用のバリデーション
   validates :role,        presence: true,
                           inclusion: { in: [1, 2] }
                           # REVIEW roleはenumとして定義した方が良いか
                           #( enum role: { master: 1, pupil: 2} )

   def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
   end

   private
      # 'role'が１(master)の場合、id入力を受け付けない
      def is_pupil?
         if self.role == 1 && self.master_id != nil
            errors.add(:master_id, "error")
         elsif self.role == 2 && !(User.find_by(id: self.master_id))
            errors.add(:master_id, "error")
         end
      end
end
