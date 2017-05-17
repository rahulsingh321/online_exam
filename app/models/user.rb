class User < ApplicationRecord
  has_secure_password     # secure password
  
  validate_presence_of :email
  validate_presence_of :name
  validates_format_of  :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, if: lambda {self.email.present? and self.new_record?}
  
  validates :email, 
                   uniqueness: { case_sensitive: false }, if: lambda { self.email.present? }
                   
  validates :mobile, presence: true,
                     numericality: true,
                     uniqueness: { case_sensitive: false },
                     length: { minimum: 10, maximum: 10 }, if: lambda { self.role == 2 }

end
