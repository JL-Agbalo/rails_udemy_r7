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

    # Callback that runs after an object is initialized
    after_initialize :do_after_initialize

    # Callback that runs after an object is found by a finder method
    after_find :output_after_find
  
    # Callback that runs before an object is saved
    before_save :print_before_save_message
  
    # Callback that runs around the save action
    around_save :print_around_save_message
  
    # Callback that runs after an object is saved
    after_save :print_after_save_message
  
    # Callback that runs before an object is created
    before_create :print_before_create_message
  
    # Callback that runs around the create action
    around_create :print_around_create_message
  
    # Callback that runs after an object is created
    after_create :print_after_create_message
  
    # Callback that runs before an object is updated
    before_update :print_before_update_message
  
    # Callback that runs around the update action
    around_update :print_around_update_message
  
    # Callback that runs after an object is updated
    after_update :print_after_update_message

    # Callback that runs before an object is destroyed
    before_destroy :print_before_destroy_message

    # Callback that runs around the destroy action
    around_destroy :print_around_destroy_message

    # Callback that runs after an object is destroyed
    after_destroy :print_after_destroy_message

    private

    def do_after_initialize
        puts "You have initialized an object with firstname: #{self.firstname}, lastname: #{self.lastname}, and salary: #{self.salary}!"
    end

    def output_after_find
    puts "You have found an object with firstname: #{self.firstname}, lastname: #{self.lastname}, and salary: #{self.salary} after find!"
    end

    def print_saved_message
        puts 'BEFORE SAVE: The object is about to be saved!'
        today = Date.today
        if today.saturday? || today.sunday?
            error.add(:base, 'You cannot save an object on the weekend!')
            throw(:abort)
        end
    end

    def print_around_save_message
    puts "AROUND SAVE: The object is about to be saved!"
    yield # This is where the save action happens
    puts "AROUND SAVE: The object has been saved!"
    end

    def print_saved_message
    puts "AFTER SAVE: The object has been saved!"
    end

    def print_create_message
    puts "BEFORE CREATE: The object is about to be created!"
    end

    def print_around_create_message
    puts "AROUND CREATE: The object is about to be created!"
    yield # This is where the save action happens
    puts "AROUND CREATE: The object has been created!"
    end

    def print_created_message
    puts "AFTER CREATE: The object has been created!"
    end

    def print_update_message
    puts "BEFORE UPDATE: The object is about to be updated!"
    end

    def print_around_update_message
    puts "AROUND UPDATE: The object is about to be updated!"
    yield #employee is now updated
    puts "AROUND UPDATE: The object has been updated!"
    end

    def print_updated_message
    puts "AFTER UPDATE: The object has been updated!"
    end

    def print_before_destroy_message
    puts "BEFORE DESTROY: The object is about to be destroyed!"
    end

    def print_around_destroy_message
    puts "AROUND DESTROY: The object is about to be destroyed!"
    yield #employee is now destroyed
    puts "AROUND DESTROY: The object has been destroyed!"
    end

    def print_after_destroy_message
    puts "AFTER DESTROY: The object has been destroyed!"
    Backupemployee.create(firstname: self.firstname, lastname: self.lastname, salary: self.salary, department_id: self.department_id, country_id: self.country_id)
    end
end
