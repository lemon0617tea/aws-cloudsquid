class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  # Userはたくさんのpost,playを持っています
  has_many :plays, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :openrecs, dependent: :destroy
  validates :username, presence: true
end
