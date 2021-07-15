class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories_attributes)
    # byebug
    categories_attributes.values.each do |category_attributes|
      unless category_attributes[:name].blank?
        category = Category.find_or_create_by(category_attributes)
        self.categories << category  
      end
    end
  end
end
