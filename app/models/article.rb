class Article < ApplicationRecord
    belongs_to :user
    has_many :article_category
    has_many :categories, through: :article_category
    validates :title, presence: true
    validates :title, length: {minimum: 6, maximum: 100}
    validates :description, presence: true
    validates :description, length: {minimum: 10, maximum: 350}
end
