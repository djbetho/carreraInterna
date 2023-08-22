class Btouser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reactions 

  has_many :offers 

  has_one_attached :avatar
  
  enum role: { standar: 0, admin:1}

end
