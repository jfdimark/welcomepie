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
  attr_accessible :occupation_list, :gender_list, :moving_from_list, :moving_to_list, :family_type_list, :age_bracket_list, :interest_list, :about_me, :username, :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  acts_as_taggable
  acts_as_taggable_on :occupation, :gender, :moving_from, :moving_to, :family_type, :age_bracket, :interests
  scope :by_join_date, order("created_at DESC")

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
