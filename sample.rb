class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    puts "数字を入力してください。"
    puts "0:グー\n1:チョキ\n2:パー"
    input_hand = gets.chomp

    while true
      if input_hand.length == 1 && input_hand == "0" || input_hand == "1" || input_hand == "2"
        return input_hand
      else
        puts "もう一度数字を入力してください。"
        puts "0:グー\n1:チョキ\n2:パー"
        input_hand = gets.chomp
      end
    end
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    rand(3)
  end
end

class Janken
  def pon(player_hand, enemy_hand) #player_handはローカル変数
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする

    jankens = ["グー", "チョキ", "パー"]
    puts "相手の手は#{jankens[enemy_hand]}です。"

    if player_hand.to_i == enemy_hand
      puts "あいこ"
      return true

    elsif (player_hand.to_i - enemy_hand + 3) % 3 == 2
      puts "あなたの勝ちです"
      return false

    else
      puts "あなたの負けです"
      return false
    end
  end
end
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
player = Player.new
enemy = Enemy.new
janken = Janken.new

next_game = true
while next_game
# 下記の記述で、ジャンケンメソッドが起動される
  next_game = janken.pon(player.hand, enemy.hand)
end
