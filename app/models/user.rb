# == Schema Information
# Schema version: 20110208193820
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  authentication_token :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :timeoutable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :token_authenticatable,
         :trackable,
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_and_belongs_to_many :roles

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
