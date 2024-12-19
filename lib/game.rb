class Game

    def initialize
        @frames = []
    end

    def score
        computed_score = 0
        cursor = 0
        10.times do
            if strike?(@frames[cursor])
                computed_score += (10 + strike_bonus(cursor))
            elsif spare?(@frames[cursor], @frames[cursor+1])
                computed_score += (10 + spare_bonus(cursor))
            else
                computed_score += (@frames[cursor] + @frames[cursor+1])
            end
            cursor = cursor + 2
        end
        computed_score
    end

    def spare_bonus(cursor)
        @frames[cursor+2]
    end

    def strike_bonus(cursor)
        if strike?(@frames[cursor + 2])
            puts "jkfjfdf"
            @frames[cursor + 2] + @frames[cursor + 4]
        else
            @frames[cursor + 2] + @frames[cursor + 3]
        end
    end

    def strike?(current_roll)
        current_roll == 10
    end

    def spare?(current_roll, next_roll)
        (next_roll + current_roll) == 10
    end

    def roll(pins)
        @frames << pins
    end
end