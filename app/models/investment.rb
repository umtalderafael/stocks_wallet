class Investment < ApplicationRecord

  belongs_to :investment_type
  has_many :fundamental_infos

  after_initialize :set_default_country

  private

  def set_default_country
    self.country_code = 'BR' if country_code.blank? 
  end

end