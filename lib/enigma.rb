class Enigma

  attr_reader :todays_date,
              :random_key

  def initialize
    time = Time.new
    year = time.year
    month = time.month
    day = time.day
    @todays_date = month + day + year
    @random_key = 5.times.map{rand(10)}.join

  end


  def encrypt(message, key = random_key, date = todays_date)

  end



end
