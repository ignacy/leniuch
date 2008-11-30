require 'digest/sha1'

# This is engeener object it describes team members
# fields:
# :nzwisko
# :imie
# :status
# :email
# for details check migration 001
class Engeener < ActiveRecord::Base

  validates_presence_of :nzwisko, :imie
  validates_uniqueness_of :nzwisko

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  protected
  # Validaation helper
  def validate
    errors.add_to_base("Missing password") if hashed_password.blank?
  end

  # Login. Usues application controller functionality
  def self.authenticte(nzwisko, password)
    engeener = self.find_by_nzwisko(nzwisko)
    if engeener
      expected_password = encrypted_password(password, engeener.salt)
      if engeener.hashed_password != expected_password
        engeener = nil
      end
    end
    engeener
  end

  # TODO: May I use attr, here??
  def password
    @password
  end

  # Setter
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = Engeener.encrypted_password(self.password, self.salt)
  end

  private
  #Hashes password
  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt  # 'wibble' makes it harder to guess
    Digest::SHA1.hexdigest(string_to_hash)
  end

  #Creates new salt for hashing
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

end
