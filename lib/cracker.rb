class Cracker

  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def find_offsets(cipher_text)
    shift_1 = @alphabet.find_index(" ") - @alphabet.find_index(cipher_text[-4])
    shift_2 = @alphabet.find_index("e") - @alphabet.find_index(cipher_text[-3])
    shift_3 = @alphabet.find_index("n") - @alphabet.find_index(cipher_text[-2])
    shift_4 = @alphabet.find_index("d") - @alphabet.find_index(cipher_text[-1])
    [shift_1, shift_2, shift_3, shift_4].rotate(-(cipher_text.size % 4))
  end

  def last_four(date)
    (date.to_i ** 2).to_s[-4..-1]
  end


  def second_int_to_str(cipher_text, date)
    second_int += 27 until second_int >= 0
    second_str = second_int.to_s.rjust(2,"0")
    until first_str[1] == second_str[0] && (second_int < 100 || second_int > 0)
      second_int += @alphabet.length
      second_str = second_int.to_s.rjust(2,"0")
    end
  end

  def check_match(first_str, second_str, third_str, fourth_str)
    check_first_set  = first_str[1]  == second_str[0]
    check_second_set= second_str[1] == third_str[0]
    check_third_set  = third_str[1]  == fourth_str[0]
    check_first_set && check_second_set && check_third_set
  end

  def check_two_digits(first_str, second_str, third_str, fourth_str)
    check_first_set  = first_str.length < 3
    check_second_set = second_str.length < 3
    check_third_set  = third_str.length < 3
    check_fourth_set = fourth_str.length < 3
    check_first_set && check_second_set && check_third_set && check_fourth_set
  end


  def find_key(cipher_text, date = today)

    matches = false
    two_digits = false

    first_int = (-find_offsets(cipher_text)[0] - last_four(date)[0].to_i)

    first_int += 27 until first_int >= 0
    until matches == true && two_digits == true
      first_str = first_int.to_s.rjust(2,"0")

      second_int = (-find_offsets(cipher_text)[1] - last_four(date)[1].to_i)

      second_int += 27 until second_int >= 0
      second_str = second_int.to_s.rjust(2,"0")
      until first_str[1] == second_str[0] && (second_int < 100 || second_int > 0)
        second_int += @alphabet.length
        second_str = second_int.to_s.rjust(2,"0")
      end

      third_int = (-find_offsets(cipher_text)[2] - last_four(date)[2].to_i)

      third_int += 27 until third_int >= 0
      third_str = third_int.to_s.rjust(2,"0")
      until second_str[1] == third_str[0] && (third_int < 100 || third_int > 0)
        third_int += @alphabet.length
        third_str = third_int.to_s.rjust(2,"0")
      end

      fourth_int = (-find_offsets(cipher_text)[3] - last_four(date)[3].to_i)

      fourth_int += 27 until fourth_int >= 0
      fourth_str = fourth_int.to_s.rjust(2,"0")
      until third_str[1] == fourth_str[0] && (fourth_int < 100 || fourth_int > 0)
        fourth_int += @alphabet.length
        fourth_str = fourth_int.to_s.rjust(2,"0")
      end

      matches = check_match(first_str, second_str, third_str, fourth_str)
      two_digits = check_two_digits(first_str, second_str, third_str, fourth_str)

      first_int += @alphabet.length if matches == false || two_digits == false
    end
    "#{first_str}#{second_str[1]}#{third_str[1]}#{fourth_str[1]}"
  end





end
