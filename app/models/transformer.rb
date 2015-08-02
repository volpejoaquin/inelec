class Transformer < ActiveRecord::Base
  belongs_to :entry_order

  validates :number, presence: true
  validates :entry_order, presence: true
end
