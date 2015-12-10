class Order < ActiveRecord::Base
  belongs_to :user
  has_many :orderitems
  has_many :products

  validate :has_orderitem, on: :create
  validates :status, presence: true
  validates :cc_name, presence: true
  validates :email_address, presence: true
  validates :mailing_address, presence: true
  validates :cc_number, presence: true
  validates :zip, presence: true
  validates :cc_exp, presence: true
  validates :cc_cvv, presence: true

  def has_orderitem
    !!self.orderitems
  end

end
