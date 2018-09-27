# Tic-Tac-Toe program

  def bord 
    3.times do |i|
      3.times do |j|
        print((3*i)+(1+j)," | ");
      end
      print("\n------------\n");
    end
  end

  def get_method
    p 'enter number from 1 to 9'
    number = gets.to_i
  end

  def get_loop
    9.times do |n|
      get_method
      bord
      determine(n)
    end
  end
  
  def determine(n)
    if n.even?
      display = "〇"
    else 
      display = "✖"
    end
    print(display)
  end

  def main
    bord
    get_loop
  end

  main
