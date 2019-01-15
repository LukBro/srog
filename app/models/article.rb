class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :title,
            format: { with: /\A[a-zA-Z]+\z/,
                      message: 'only allows letters' }
end
#  before_create do |title|
#     self.title = self.title.to_s.titleize
#   end
# end
