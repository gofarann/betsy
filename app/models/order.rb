class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orderitems
  has_many :products

  validate :existence_of_item
  accepts_nested_attributes_for :orderitems

  validate :has_orderitem, on: :create
  validates :status, presence: true

  # To create an order: 
  # foo = Order.create!({orderitems_attributes: [{ product_id: 3}] })

  # All of the following validations don't need to be true until the status is marked paid. Do we need them as validations, or can we just have the form have required field? (And if we want them as validations, maybe we should have them set as a custom validation that only runs if the status is marked as paid.)

  # validates :cc_name, presence: true
  # validates :email_address, presence: true
  # validates :mailing_address, presence: true
  # validates :cc_number, presence: true
  # validates :zip, presence: true
  # validates :cc_exp, presence: true
  # validates :cc_cvv, presence: true

  def has_orderitem
    !!self.orderitems
  end

  private
    def existence_of_item
      unless self.orderitems.any?
        errors[:orderitems] << "missing order item"
      end
    end
end
