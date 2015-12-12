class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orderitems, :dependent => :destroy
  has_many :products, through: :orderitems

  validate :has_orderitem, on: :create
  validates :status, presence: true
  validates :status, inclusion: { in: %w(pending) }, on: :create
  validates :status, inclusion: { in: %w(paid) }, on: :pay
  validates :status, inclusion: { in: %w(complete) }, on: :ship
  validates :status, inclusion: { in: %w(cancelled) }, on: :cancel
  validates :cc_name, presence: true, on: :pay
  validates :email_address, presence: true, on: :pay
  validates :mailing_address, presence: true, on: :pay
  validates :cc_number, presence: true, on: :pay
  validates :zip, presence: true, on: :pay
  validates :cc_exp, presence: true, on: :pay
  validates :cc_cvv, presence: true, on: :pay

  def session_over
    if self.status = "pending"
      self.destroy
    end
  end

  def self.pending(product)
    Order.transaction do
      order = Order.new(status: 'pending')
      order.products << product
      order.save!
    end
  end


  private

  def has_orderitem
    !!self.orderitems
  end
end
