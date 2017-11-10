class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable


  has_many :helpchats
  belongs_to :operator

  before_save do
    unless helpchats.in_queue
      self.helpchats.build(name: DateTime.now.to_s, state: "in_queue")
    end
  end
end
