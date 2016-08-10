class Account < ActiveRecord::Base
  belongs_to :user

  SSN_REGEX = /([0-9]{6})+(-[0-9]{3})+[A-Z]/
  POSTAL_REGEX = /[0-9]{5}/

  validates :social_security,	presence: true, format: SSN_REGEX

	validates	:phone_number,
						:birth_date,
						:iban,
						:swift,
						:address,
						presence: true

	validates :postal_code, presence: true, format: POSTAL_REGEX
	validates	:city, presence: true

end
