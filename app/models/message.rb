class Message < ApplicationRecord
  belongs_to :helpchat
  belongs_to :customer
  belongs_to :operator
end
