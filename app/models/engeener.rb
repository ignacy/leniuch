require 'digest/sha1'


class Engeener < ActiveRecord::Base

  validates_presence_of :nzwisko
  validates_uniqueness_of :nzwisko

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  def validate
    errors.add_to_base("Missing password") if hashed_password.blank?
  end

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

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = Engeener.encrypted_password(self.password, self.salt)
  end

  private

  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt  # 'wibble' makes it harder to guess
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

end
