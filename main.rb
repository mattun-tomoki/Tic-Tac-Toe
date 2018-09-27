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
    print("#{number}\n");
  end

  def get_loop
    9.times{
      get_method
    }
  end
  
  def main
    bord
    get_loop
  end

  main
