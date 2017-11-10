class Operator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  #has_many :customers
  #has_many :helpchats, through: :customers
  has_many :helpchats
  has_many :customers, through: :helpchat
end
