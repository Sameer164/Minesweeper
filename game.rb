require_relative "./Board.rb"
require "byebug"
def game
    b = Board.new(9, 3)
    b.populate_grid
    b.display_grid
    b.fill_mine_data
    while !b.finished
        puts "Put the position in x,y,r(or f or u for unflag) format"

        a = gets.chomp
     

        if a[4] == "f"
            b.grid[a[0].to_i][a[2].to_i].flagged = true
            b.display_grid
            next
        end

        if a[4] == "u"
            b.unflag(a[0].to_i, a[2].to_i)
            b.display_grid
            next
        end

        if b.grid[a[0].to_i][a[2].to_i].value == "B"
            b.grid[a[0].to_i][a[2].to_i].revealed = true
            break
        end

        if a[4] == "r"
            b.reveal(a[0].to_i, a[2].to_i)
            b.display_grid
        end
    end
    b.display_grid
    if !b.finished
        puts "Sorry! You Lost."
    elsif b.finished && b.won?
        puts "Congrats. You won."
    else
        puts "Sorry! You Lost."
    end
end
game()