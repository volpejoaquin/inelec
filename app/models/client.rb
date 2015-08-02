class Client < ActiveRecord::Base
  CATEGORY = ['Cooperativas', 'Privadas', 'Otros']

  has_many :contact_people

  validates :name, presence: true
  validates_inclusion_of :category_id, in: (0..CATEGORY.length - 1).to_a, allow_nil: true

  def self.categories
    CATEGORY
  end

  def self.search(field, term)
    if column_names.include?(field) and term
      where("#{field} LIKE ?", "%#{term}%")
    else
      all
    end
  end

  def category
    {id: self.category_id, name: CATEGORY[self.category_id]} unless self.category_id.nil?
  end
end
