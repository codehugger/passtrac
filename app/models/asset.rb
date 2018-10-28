class Asset < ApplicationRecord
  belongs_to :company
  has_many :positions

  before_save :create_key

  def position
    positions.last
  end

  def qr
    @qr ||= RQRCode::QRCode.new("https://localhost:3000/assets/#{key}", :size => 8, :level => :h)
  end

  def create_key
    self.key ||= SecureRandom.uuid
  end
end
