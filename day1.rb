sum = 0

IO.foreach('day1.txt') do |line|
  all_nums = line.scan(/[1-9]/)
  new_num = all_nums[0] + all_nums[-1]
  sum += new_num.to_i
  puts "#{all_nums}, #{new_num}, #{sum}"
end

puts sum
