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
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friend_invitations,
            foreign_key: :recipient_id,
            class_name: 'FriendRequest',
            dependent: :destroy

  has_many :friend_requests,
            foreign_key: :requester_id,
            dependent: :destroy
  
  has_many :friendships,
      ->(user) { unscope(:where).where('friend_a_id = ? OR friend_b_id = ?', user.id, user.id) },
      dependent: :destroy
end
