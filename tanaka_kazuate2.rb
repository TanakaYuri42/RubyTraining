class Numgame

  def start
    ans = gets.chomp  #ユーザーが入力した数字
    @ans_arr = ans.split("").map(&:to_i)
  end  #def startここまで
  
  
  def kazuate
    start
    
    hit = 0  #hit数
    count = 0  #ユーザーが数字を入力した数
    
    num_arr = (0..9).to_a  #0から9の配列を生成
    cor_arr = num_arr.shuffle.take(4)  #順番シャッフルしたnum_arrから4つ数字を取り出す
    
    while hit != 4  #hitが4になるまでゲームは続く
    
      hit = 0  #hit数
      blow = 0  #blow数
      hit_str = ""  #hitした数を教える文字列
      blow_str = ""  #blowした数を教える文字列
      count += 1  #何回目の回答かカウントする
      
      @ans_arr.each do |n|
        if n == cor_arr[@ans_arr.find_index(n)]
          hit += 1  #位置も値も完全一致していればhitに+1
          next
        end
        blow += 1 if cor_arr.include?(n)  #入力した数値が含んでいればblowに+1
      end

      hit_str = "#{hit} Hit " if hit > 0  #もしhitがあれば、文字列を生成
      blow_str = "#{blow} Blow" if blow > 0  #もしblowがあれば、文字列を生成
    
      if hit == 4
        p "正解です。正解まで#{count}回答えました。"  #全部hitしたので、正解
      else
        p "#{hit_str}#{blow_str}"  #hitとblowの数を表示する
        start  #まだ全部hitしていないので、入力やり直し
      end
    
    end  #while ここまで
  
  end  #def kazuateここまで

end  #class Numgameここまで


p "4桁の数あてゲームを行います。数字を4つ記入してください"
cla = Numgame.new
cla.kazuate