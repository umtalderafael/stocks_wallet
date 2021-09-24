class User < ApplicationRecord
 validates :name, :email, presence: true
 validate :email_valid?

 private

 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

 INVALID_CARACTERS = [' ', '!', '#', '$', '%', '&', '*', '(', ')', '+', '=', ':', ';', ',', '<', '>', '?', '/', '{', '}', '\[', '\]', '\\', ',', '"', '`', '~', '@@', '..', 'ç', 'á', 'é', 'í', 'ó', 'ú', 'â', 'ô', 'ê', 'ã', 'õ'].freeze

 INVALID_HOSTS = %w[gmail.com.br hotmail.com.br].freeze

 def email_valid?
   return false if email.blank?

   if email =~ VALID_EMAIL_REGEX
     errors.add(:email, 'caracter invalido!') if INVALID_CARACTERS.any? { |w| email.strip.include?(w) }
     errors.add(:email, 'host invalido!') if INVALID_HOSTS.any? { |w| email.strip.include?(w) }
   else
     errors.add(:email, 'Formato invalido!')
   end
 end
end