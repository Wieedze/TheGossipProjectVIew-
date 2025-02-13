class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  has_many :comments
  validates :password, presence: true, length: { minimum: 6 }


  has_many :gossips
  has_many :sent_messages, foreign_key: "sender", class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: "recipient", class_name: "PrivateMessage"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :first_name, with: /^[^0-9`!@#\$%\^&*+_=]+$/, multiline: true
  validates_format_of :last_name, with: /^[^0-9`!@#\$%\^&*+_=]+$/, multiline: true

  validates :description, presence: true
  validates_length_of :description, minimum: 10, maximum: 100, message: "Doit etre compris entre 10 et 100 charactere"

  validates :age, presence: true
  validates_numericality_of :age, only_integer: true

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
