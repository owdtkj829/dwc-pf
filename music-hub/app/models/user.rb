class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, uniqueness: { case_sensitive: :false }, length: { maximum: 20 }, presence: true
  validates :introduction,length:{maximum:150}, presence: true
  validates :email, presence: true

  attachment :image

  has_many :artists
  has_many :events, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recommends, dependent: :destroy
  has_many :myrecommends, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  # ユーザーをフォローする
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    self.followings.include?(other_user)
  end
end
