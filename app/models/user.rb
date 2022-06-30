# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  birthday               :datetime
#  education              :string
#  workplace              :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      # binding.pry
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"] ||
        data = session["devise.github_data"] && session["devise.github_data"]["info"]
        user.name = data["name"] if user.name.blank?
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook github]

  has_many :friend_invitations,
            foreign_key: :recipient_id,
            class_name: 'FriendRequest',
            dependent: :destroy

  has_many :friend_requests,
            foreign_key: :sender_id,
            dependent: :destroy
  
  has_many :friendships,
      ->(user) { unscope(:where).where('friend_a_id = ? OR friend_b_id = ?', user.id, user.id) },
      dependent: :destroy
end
