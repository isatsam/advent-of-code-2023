class Game
    def initialize(string)
        @bag = {'red' => 12, 'green' => 13, 'blue' => 14}
        @reveals = read_reveals(string)
        @id = read_id(string)
    end

    def id
        @id
    end

    def read_id(string)
        game_id = string.split(':')
        game_id = game_id[0].scan(/\d+/)[0].to_i
    end

    def read_reveals(string)
        str_reveals = string.split(':')[1]

        reveals = Hash.new
        count_rev = 0
        colours = @bag.keys

        cubes = Hash.new
        str_reveals = str_reveals.split(';')
        str_reveals.each do |rev|
            colours.each do |colour|
                cubes[colour] = rev.scan(/\d+.#{colour}/)
                unless cubes[colour].class == NilClass
                    cubes[colour] = cubes[colour].to_s.scan(/\d+/)[0].to_i
                end
            end
            reveals[count_rev] = cubes.dup
            count_rev += 1
        end
        return reveals
    end

    def possible?
        # If revealed colours weren't in the bag
        @reveals.each do |reveal|
            reveal[1].keys.each do |colour|
                unless @bag.keys.include? colour
                    return false
                end
            end
        end

        @reveals.keys.each do |rev_num|
            @reveals[rev_num].keys.each do |colour|
                unless @bag[colour] >= @reveals[rev_num][colour]
                    puts "#{@id} is impossible because #{colour} in reveal #{rev_num} = #{@reveals[rev_num][colour]} is bigger than #{@bag[colour]}"
                    return false
                end
            end
        end

        return true
    end
end

sum = 0

IO.foreach('day2.txt') do |line|
    game = Game.new(line)
    if game.possible?
        sum += game.id
    end
end

puts sum