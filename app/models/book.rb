class Book < ApplicationRecord
    validates :datePublished, date_format: true
end
