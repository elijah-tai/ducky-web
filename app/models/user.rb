class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :pins, dependent: :destroy

  validates :name, presence: true
  validates :phone, length: { is: 10 }
  validates :phone, numericality: { only_integer: true } 


end
