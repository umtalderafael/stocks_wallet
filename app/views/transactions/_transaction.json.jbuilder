json.extract! transaction, :id, :date, :broker_id, :transaction_type_id, :user_id, :investment_id, :amount, :value, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
