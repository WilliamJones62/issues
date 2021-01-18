class EmployeeList < ApplicationRecord
  establish_connection 'production'.to_sym
end
