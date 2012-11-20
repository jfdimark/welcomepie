class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :occupation, :gender, :moving_from, :moving_to, :family_type, :age_bracket, :interests, :about_me, :username, :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  acts_as_taggable
  acts_as_taggable_on :occupation, :gender, :moving_from, :moving_to, :family_type, :age_bracket, :interests
  scope :by_join_date, order("created_at DESC")


end
