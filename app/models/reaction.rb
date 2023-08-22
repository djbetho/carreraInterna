class Reaction < ApplicationRecord
  belongs_to :offer , optional: true
  belongs_to :btouser, optional: true
  has_many :offers

  
 # se permite que la relación sea opcional a nivel de modelo
 validates :kind, acceptance: {
  accept: %w[postular],
  }

def self.kinds
  %w[postular]
end   

end
