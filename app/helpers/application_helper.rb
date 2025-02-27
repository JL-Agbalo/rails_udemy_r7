module ApplicationHelper
    def is_authorize(admin, permission_id)
        admin.super_admin? || admin.role.permissions_ids.include?(permission_id)
    end

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
