class Helpchat < ApplicationRecord
  enum state: [:in_queue, :active, :completed]

  belongs_to :customer
  belongs_to :operator
  has_many :messages
end
