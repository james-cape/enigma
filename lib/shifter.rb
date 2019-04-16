class Shifter

  attr_reader :key,
              :date,
              :slot
              
  def initialize(key, date, slot)
    @key = key
    @date = date
    @slot = slot

  end

  def last_four(date)
    (date.to_i ** 2).to_s[-4..-1]
  end

# Outputs shifted alphabet
  def shift(key, date, slot)
    shift_key = key[slot..(slot + 1)].to_i
    shift_offset = last_four(date)[slot].to_i
    @alphabet.rotate(shift_key + shift_offset)
  end


end
