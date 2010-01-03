require "time"

class DecimalTime

  attr_accessor :hour, :min, :sec


  def get_seconds

    x = Time.now

    t = x.sec + (x.min * 60) + (x.hour * 60 * 60)

    t = (t.to_f * 100000/86400).to_i

    t
  end

  def initialize
    seconds = get_seconds 
    @sec = seconds % 100
    @min = ((seconds - @sec) % 10000) / 100
    @hour = ((seconds - @sec) - (@min * 100)) / 10000 
  end

  def to_s
    "#{@hour}.#{@min}.#{@sec}"
  end

end


while true
  `echo #{DecimalTime.new} | wmiir create /rbar/ztime`
  sleep 0.1
end
