class Position < ApplicationRecord
  belongs_to :asset

  after_save do
    if asset.positions.count > 500
      Position.where(id: asset.positions.order(id: :desc).collect(&:id).slice(500..-1)).destroy_all
    end
  end
end
