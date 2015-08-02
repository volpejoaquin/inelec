class EntryOrder < ActiveRecord::Base
  belongs_to :client
  has_many :transformers

  validates :number, presence: true
  validates :client, presence: true
end
