class User < ApplicationRecord
  has_secure_password
  has_many :auctions, dependent: :nullify
  has_many :bids, dependent: :nullify

  before_validation :downcase_email

  validates :email, presence: true,
                    uniqueness: true,
                    format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}".strip.squeeze(' ').titleize
  end

  private

  def downcase_email
    email.downcase! if email.present?
  end
end
