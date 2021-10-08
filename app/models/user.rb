class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :trackable  

  validates :name, :born_at, presence: true

  validate :email_valid? 

  has_many :transactions, dependent: :restrict_with_exception
  

  private

  INVALID_CARACTERS = [' ', '!', '#', '$', '%', '&', '*', '(', ')', '+', '=', ':', ';', ',', '<', '>', '?', '/', '{', '}', '\[', '\]', '\\', ',', '"', '`', '~', '@@', '..', 'ç', 'á', 'é', 'í', 'ó', 'ú', 'â', 'ô', 'ê', 'ã', 'õ'].freeze

  INVALID_HOSTS = %w[gmail.com.br hotmail.com.br].freeze

  def email_valid?  
     errors.add(:email, 'host invalido!') if INVALID_HOSTS.any? { |w| email.strip.include?(w) }
  end

end 