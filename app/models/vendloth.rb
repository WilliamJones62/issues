class Vendloth < ApplicationRecord
  establish_connection "e21prod".to_sym
  self.table_name = "vendloth"
end
