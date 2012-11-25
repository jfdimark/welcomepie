  class User < ActiveRecord::Base

    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships
    has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
    has_many :inverse_friends, through: :inverse_friendships, source: :user
    has_many :pending_friends, through: :friendships, source: :friend, conditions: "confirmed = 0"

    rolify
    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    # Setup accessible (or protected) attributes for your model
    attr_accessible :role_ids, as: :admin
    attr_accessible :name, :email, :password, :password_confirmation, :remember_me
    attr_accessible :occupation_list, :gender_list, :moving_from_list, :moving_to_list, :family_type_list, :age_bracket_list, :interest_list, :about_me, :username, :avatar
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    acts_as_taggable
    acts_as_taggable_on :occupation, :gender, :moving_from, :moving_to, :family_type, :age_bracket, :interests
    scope :by_join_date, order("created_at DESC")

  def friends?(friend)
    friendships.find_by_friend_id(friend.id)
  end

  def self.request(user, friend)
    unless user == friend or Friendship.exists?(user, friend)
      transaction do
        create(:user => user, :friend => friend, :status => 'pending')
        create(:user => friend, :friend => user, :status => 'requested')
      end
    end
  end

  def self.accept(user, friend)
    transaction do
      accepted_at = Time.now
      accept_one_side(user, friend, accepted_at)
      accept_one_side(friend, user, accepted_at)
    end
  end

  def self.accept_one_side(user, friend, accepted_at)
    request = find_by_user_id_and_friend_id(user, friend)
    request.status = 'accepted'
    request.accepted_at = accepted_at
    request.save!
  end

  private

    def self.tag_tokens(query)
      tags = User.categories.where("name like ?", "%#{query}%")
      if tags.empty?
        [{id: "#{query}", name: "#{query}"}]
      else
        tags
      end
    end

  end
