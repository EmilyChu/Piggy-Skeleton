class Record < ActiveRecord::Base
   def total
    wins + losses
  end

  def percentage
    ((wins * 100) / (wins + losses)).round2
  end
end