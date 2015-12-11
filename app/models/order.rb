class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orderitems
  has_many :products, through: :orderitems

  validate :has_orderitem, on: :create
  validates :status, presence: true

  # All of the following validations don't need to be true until the status is marked paid. Do we need them as validations, or can we just have the form have required field? (And if we want them as validations, maybe we should have them set as a custom validation that only runs if the status is marked as paid.)

  # validates :cc_name, presence: true
  # validates :email_address, presence: true
  # validates :mailing_address, presence: true
  # validates :cc_number, presence: true
  # validates :zip, presence: true
  # validates :cc_exp, presence: true
  # validates :cc_cvv, presence: true

  def pending_order
    p = # find product ID somehow, find with product
    Order.transaction do
      order = Order.new(status: 'pending')
      order.products << p
      order.save!
    end
  end

  private

  def has_orderitem
    !!self.orderitems
  end
end
