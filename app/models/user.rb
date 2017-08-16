class User < ApplicationRecord
attr_accessor :remember_token
 before_save { self.email = email.downcase }
 validates :name,  presence: true, length: { maximum: 20}
 VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
 validates :email, presence: true, length: { maximum: 30 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
 has_secure_password
 validates :password, presence: true, length: { minimum: 6 }


 # 返回一个随机令牌
  def User.new_token
    SecureRandom.urlsafe_base64
  end


  # 为了持久保存会话，在数据库中记住用户
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
end
