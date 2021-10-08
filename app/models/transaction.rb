class Transaction < ApplicationRecord
  belongs_to :broker
  belongs_to :transaction_type
  belongs_to :user
  belongs_to :investment
end
