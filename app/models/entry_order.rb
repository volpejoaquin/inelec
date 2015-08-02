class EntryOrder < ActiveRecord::Base
  belongs_to :client

  validates :number, presence: true
  validates :client, presence: true
end
