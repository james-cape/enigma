class Enigma

  attr_reader :today,
              :random_key

  def initialize
    time = Time.new
    @today = "#{time.month}#{time.day}#{time.year}".rjust(8,"0")
    @random_key = 5.times.map{rand(10)}.join

  end


  def encrypt(message, key = random_key, date = today)
    components = Hash.new(0)
    components[:encryption] = message # Change later to encrypted string
    components[:key] = key
    components[:date] = date
    components
  end


  # 4 different shifts:
  # 1st, 5th,  9th characters use A shift
  # 2nd, 6th, 10th characters use B shift
  # 3rd, 7th, 11th characters use C shift
  # 4th, 8th, 12th characters use D shift

  # Keys: from the 5-digit random_key, (i.e. 03827)
  # A shift key (03)
  # B shift key (38)
  # C shift key (82)
  # D shift key (27)

  # Offsets: from the MMDDYY (i.e. 041019)
  # Square the numeric form (1682558361)
  # Take the last four digits (8361)
  # A shift offset (8)
  # B shift offset (3)
  # C shift offset (6)
  # D shift offset (1)

  # A final shift (11)
  # B final shift (41)
  # C final shift (88)
  # D final shift (28)






  # Our algorithm will use the standard lowercase alphabet, plus a space, so 27 characters in total.
  ############ ("a".."z").to_a << " " ############

  # Finding the shifts... could be its own class?




end
