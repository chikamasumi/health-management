class Inquiry < ApplicationRecord
  belongs_to :user
  def self.search(keyword)
    #includes(:user).where("users.last_name LIKE ?", "%#{keyword}").or(includes(:user).where(title: keyword)).or(includes(:user).where(users: {first_name: keyword }))
    includes(:user).where("users.last_name LIKE ?", "%#{keyword}").or(includes(:user).where(users: {first_name: keyword })).or(includes(:user).where(title: keyword))

  end
end
