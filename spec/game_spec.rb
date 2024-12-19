require 'game'

RSpec.describe Game do

    context "Gutter game" do
        it do
            game = Game.new

            20.times.each do
                game.roll(0)
            end
            expect(game.score).to eq(0)
        end
    end

    context "All ones" do
        it do
            game = Game.new

            20.times.each do
                game.roll(1)
            end
            expect(game.score).to eq(20)
        end
    end

    context "One spare" do
        rolls = [5,5 ,3,0 ,0,0 ,0,0 ,0,0 ,0,0 ,0,0 ,0,0 ,0,0 ,0,0]
        it do
            game = Game.new

            rolls.each do |roll|
                game.roll(roll)
            end
            expect(game.score).to eq(16)
        end
    end

    context "One strike" do
        it do
            rolls = [10,0 ,3,4 ,0,0 ,0,0 ,0,0 ,0,0 ,0,0 ,0,0 ,0,0 ,0,0]
            game = Game.new

            rolls.each do |roll|
                game.roll(roll)
            end
            expect(game.score).to eq(24)
        end

        it do
            rolls = [10,0 ,10,0 ,10,0 ,7,2 ,0,0 ,0,0 ,0,0 ,0,0 ,0,0 ,0,0]
            game = Game.new

            rolls.each do |roll|
                game.roll(roll)
            end
            expect(game.score).to eq(85)
        end
    end

    context "One Spare at last frame" do
        it do
            rolls = [0,0 ,0,0 ,0,0, 0,0, 0,0, 0,0, 0,0 ,0,0 ,4,7, 0,0,0]
            game = Game.new

            rolls.each do |roll|
                game.roll(roll)
            end
            expect(game.score).to eq(11)
        end
    end

    context "Perfect game" do
        it do
            rolls = [10,0, 10,0 ,10,0 ,10,0 ,10,0 ,10,0 ,10,0 ,10,0 ,10,0 ,10,10,10]
            game = Game.new

            rolls.each do |roll|
                game.roll(roll)
            end
            expect(game.score).to eq(3000)
        end
    end
end
