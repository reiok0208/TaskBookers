class Book < ApplicationRecord

    belongs_to :user

    validates :title, presence: true
    validates :body, presence: true

    validates :body, length: 0..200

end
