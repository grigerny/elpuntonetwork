require 'csv'

module Exporter
  def self.run
    CSV.open($stdout, 'w') do |csv|
      User.all do |u|
        csv << u.attributes.values
      end
    end
  end
end


