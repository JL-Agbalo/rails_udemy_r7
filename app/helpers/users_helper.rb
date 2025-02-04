module UsersHelper
    def print_error(obj, field)
      return '' if obj.errors[field].nil? || obj.errors[field].blank?
      "<div class='text-danger'>#{obj.errors[field].join('<br>')}</div>".html_safe
    end
  end