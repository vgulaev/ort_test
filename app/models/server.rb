class Server < ApplicationRecord
  has_many :bandwidths, dependent: :destroy
end
