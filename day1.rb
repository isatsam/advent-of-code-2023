def word_to_num(word)
  translate = {'one' => '1', 'two' => '2', 'three' => '3',
               'four' => '4', 'five' => '5', 'six' => '6',
               'seven' => '7', 'eight' => '8',
               'nine' => '9'}
  if translate.include? word
    return translate[word]
  else
    return word
  end
end

sum = 0

IO.foreach('day1.txt') do |line|

  # Match all numbers
  all_nums = line.scan(/(?=(one|two|three|four|five|six|seven|eight|nine|[1-9]))/).flatten

  # Convert spelt-out numbers into normal numbers
  all_nums.each_with_index do |el, i|
    if el.length > 1
      all_nums[i] = word_to_num(el)
    end
  end
  
  # Sum
  new_num = all_nums[0] + all_nums[-1]
  sum += new_num.to_i
end

puts sum
