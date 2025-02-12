class Employee < ApplicationRecord
    has_rich_text :notes
    belongs_to :department
    belongs_to :country

    #it's a way to name a custom database query, composed of ActiveRecord methods
    scope :search, -> (query) {
        if query.present?
            where("firstname LIKE ? OR lastname LIKE ? OR CAST(salary AS TEXT) LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
        else 
            all
        end
    }
end
