class Numgame

  def start
    @ans = gets.chomp  #ユーザーが入力した数字
    @ans_arr = []  #ユーザーが入力した数字を入れる配列
    
    4.times do |n|
      @ans_arr << @ans.slice(n).to_i  #ユーザーが入力した数字を配列に入れる
    end
    
  end  #def startここまで
  
  
  def kazuate
    
    hit = 0  #hit数
    count = 0  #ユーザーが数字を入力した数
    num_arr = []  #1から10の配列
    cor_arr = []  #正解の数字を入れた配列
    
    10.times do |n|
      num_arr << n  #1から10をnum_arrに入れる
    end
    
    4.times do
      cor = num_arr.sample  #num_arrの数字をランダムに取り出す
      num_arr.delete(cor)  #重複を避けるため、取り出した数字は配列から消す
      cor_arr << cor  #取り出した数字を、正解の配列に入れる
    end
    
    while hit != 4  #hitが4になるまでゲームは続く
    
      hit = 0  #hit数
      blow = 0  #blow数
      hit_str = ""  #hitした数を教える文字列
      blow_str = ""  #blowした数を教える文字列
      count += 1  #何回目の回答かカウントする
    
      @ans_arr.each do |n|
        cor_arr.each do |i|
          blow += 1 if n == i  #配列の数を比べて、数字が合っていればblowにプラスする
        end
      end
    
      @ans_arr.length.times do |n|
        hit += 1 if @ans_arr[n] == cor_arr[n]  #数字と順番が完全一致すればhitにプラスする
      end
    
      blow -= hit  #blowとhitの重複分をマイナスする
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
cla.start
cla.kazuate