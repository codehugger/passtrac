class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_s
    name || super
  end
end
