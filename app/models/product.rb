class Product < ApplicationRecord
  # associations
  has_many :line_items

  # validations
  validates :title, :description, :image_url, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title,
            length: {
              minimum: 5,
              message: 'Title length must be at least 5',
            }
  validates :image_url,
            allow_blank: true,
            format: {
              with: /\.(gif|jpg|png)\z/i,
              message: 'must be of type .gif, .jpg or .png',
            }

  # callbacks
  before_destroy :ensure_not_referenced_by_any_line_item

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line Items are present")
      throw :abort
    end
  end
end
