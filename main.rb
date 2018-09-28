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
      bord(number,display) # ユーザの入力が反映される。○か×が入る
      judge_result = judge($mat) # [true, "○"]
      if judge_result[0] == true then
        break
      end
    end
  end
  
  $icon = [0,-1]

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
    sum = 3
    3.times do |i|
      3.times do |j|
        if $mat[i][j] == number then
          $mat[i][j] = display[0]
          sum = sum + display[1]
        end
        print($mat[i][j]," | ");
      end
      print("\n------------\n");
    end
    sum
  end
  
  def judge(mat)
    sum = [0,0,0,0,0,0,0,0]
      3.times do |i|
        3.times do |j|
          if i == 2-j
            sum[0] = sum[0] + mat[i][2-j][1]
          end
          if i == j
            sum[1] = sum[1] + mat[i][j][1]
          end
          3.times do |k|
            if i == k
              sum[2+k] = sum[2+k] + mat[i][j][1]
            end
            if j == k
              sum[5+k] = sum[5+k] + mat[i][j][1]
            end
          end
        end  
      end

    8.times do |m|
      if sum[m] == 6
        return [true, "○"]
      elsif sum[m] == 0
        return [true,"×"]
      end    
    end  
    return [false, nil]
  end

  def main
    bord(nil, nil)  #変更がないbordを表示したいのでifの条件に合わないnillを引数としている
    get_loop
    judge
  end

  #main

  # 渡された配列に揃ったものがあればtrue、そうでない場合はfalseを返す
  def check(mat,icon)
    number = 
    sum = 3
    3.times do |i|
      3.times do |j|
        if mat[i][j] == 1+3*i then
          sum = sum + icon[1]
        end
      end
    end
    
  end

# --- Test Codes
  require 'minitest/autorun'
  class SampleTest < Minitest::Test
    def test_yoko1
      mat = [
              [["○", 2], ["○", 2], ["○", 2]],
              [[4,   1], ["×", 0], [6,   1]],
              [["×", 0], [8,   1], [9,   1]]
            ]
      assert_equal [true, "○"], judge(mat)
    end

    def test_saisyo
      mat = [
              [[1,   1], [2,   1], [3,   1]],
              [[4,   1], [5,   1], [6,   1]],
              [[7,   1], [8,   1], [9,   1]]
            ]
      assert_equal [false, nil], judge(mat)
    end
    def test_1
      mat = [
              [["○", 2], ["×", 0], [3, 1]],
              [["○", 2], ["×", 0], ["○",2]],
              [[7  , 1], ["×", 0], [9, 1]]
            ]
      assert_equal [true,"×"], judge(mat)
    end
    def test_2
      mat = [
              [["○", 2], ["×", 0], [3, 1]],
              [["×", 0], ["○", 2], [6, 1]],
              [[7  , 1], [8,   1], ["○", 2]]
            ]
      assert_equal [true, "○"], judge(mat)
    end
  end
