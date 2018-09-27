# Tic-Tac-Toe program

  def get_method
    p 'enter number from 1 to 9'
    gets.to_i  #関数get_methodの返り血がgets.to_i(入力した数字)になる
  end

  def get_loop
    9.times do |n|
      #get_methodでの返り値を利用するとき、引数とするための変数にget_methodで得た返り値を代入する
      number = get_method   
      #determineの返り値はiconなので、返り値としてのiconを引数としてのdisplayに代入している
      display = determine(n)
      #get_loop内で宣言したnumber,displayという変数をbordの引数として渡している
      bord(number,display) 
    end
  end
  
  $icon = [0,0]

  def determine(n)
    if n.even?
      $icon[0] = "○"
      $icon[1] = 1
    else 
      $icon[0] = "×"
    end
    $icon
  end

  $mat = [[ 1 , 2 , 3 ],[ 4 , 5 , 6 ],[ 7 , 8 , 9 ]]

  def bord(number,display) # get_loopでbord関数の引数としてのnumberとdisplayを受け取る,numberとdisplayという他の関数で得た変数を扱うことができるようになる
    3.times do |i|
      3.times do |j|
        if $mat[i][j] == number then
          $mat[i][j] = display[0]
        end
        print($mat[i][j]," | ");
      end
      print("\n------------\n");
    end
  end

  def main
    bord(nil, nil)  #変更がないbordを表示したいのでifの条件に合わないnillを引数としている
    get_loop
  end

  main

  # 渡された配列に揃ったものがあればtrue、そうでない場合はfalseを返す
#  def check(mat)
#    true
#  end

# --- Test Codes
#  require 'minitest/autorun'
#  class SampleTest < Minitest::Test
#    def test_yoko1
#      mat = [["○","○","○"], [4,"×",6],["×",8,9]]
#      assert check(mat)
#    end
#
#    def test_saisyo
#      mat = [[ 1 , 2 , 3 ],[ 4 , 5 , 6 ],[ 7 , 8 , 9 ]]
#      refute check(mat)
#    end
#  end
