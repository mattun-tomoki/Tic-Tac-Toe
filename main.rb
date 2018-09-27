  
  def main
    bord
    get_method  
  end  

  def bord
    3.times do |i|
      3.times do |j|
        print((3*i)+(1+j)," | ");
      end
      print("\n------------\n");
    end
  end

  def get_method

  end

  def get_loop
    9.timets{
      get_method
    }
  end
  
  main
