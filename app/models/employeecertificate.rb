class Employeecertificate < ApplicationRecord
  belongs_to :employeeinfo
  has_one_attached :certificate

end
