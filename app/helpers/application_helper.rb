module ApplicationHelper
    def select_department
        Department.all.collect { |d| [d.name, d.id] }
    end

    def select_country
        Country.all.collect { |c| [c.name, c.id] }
    end

    def select_account
        Account.all
    end
end
