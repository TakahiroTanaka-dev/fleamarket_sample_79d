class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#\z%&'*+\/=?\A_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_REGEX = /\A([ァ-ン]|ー)+\z/
  VALID_POSTAL_REGEX = /\A\d{7}\z/
  VALID_PHONE_REGEX = /\A\d{10}\z|^\d{11}\z/
end
