class Contact < ActiveRecord::Base
  @@nums = {1=>["1"], 2=>["a", "b", "c", "2"], 3=>["d", "e", "f", "3"], 4=>["g", "h", "i", "4"], 5=>["j", "k", "l", "5"], 6=>["m", "n", "o", "6"], 7=>["p", "q", "r", "s", "7"], 8=>["t", "u", "v", "8"], 9=>["w", "x", "y", "z", "9"], 0=>["0", " "], "*"=>[], "#"=>[]}

  def self.get_chars(num)
    str = []
    num.each_char { |c| str = Contact.calc_pattern(str, @@nums[c.to_i]) }
    return str.join("%' OR name ilike '%")
  end

  def self.calc_pattern(str, arr)
    h = Array.new
    if str.empty?
      arr.each { |a| h << a.to_s }
    else
      str.each do |c|
        arr.each { |a| h << c.to_s + a.to_s }
      end
    end
    return h
  end

end
