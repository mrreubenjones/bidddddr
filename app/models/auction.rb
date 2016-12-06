class Auction < ApplicationRecord
  belongs_to :user
  has_many :bids, dependent: :destroy

  validates :title, presence: true
  validates :details, presence: true
  validates :date_ending, presence: true
  validates :reserve_price, presence: true

  include AASM

  aasm do
    state :draft, initial: true
    state :published
    state :reserve_met
    state :won
    state :cancelled
    state :reserve_not_met

    event :publish do
      transitions from: :draft, to: :published
    end

    event :met do
      transitions from: :published, to: :reserve_met
    end

    event :not_met do
      transitions from: :published, to: :reserve_not_met
    end

    event :win do
      transitions from: [:published, :reserve_met], to: :won
    end

    event :cancel do
      transitions from: [:draft, :published, :won], to: :cancelled
    end

    event :draft do
      transitions from: [:cancelled, :published], to: :draft
    end
  end

  def max_amount
    bids.max.amount
  end
end
