janken_array = ["グー", "チョキ", "パー"]
direction_array = ["上", "下", "左", "右"]
fight_flag = 1 #1:初期値　2:じゃんけん勝ち状態 3:じゃんけん負け状態 4:あっちむいてほい終了状態

while fight_flag < 4 do
  puts "じゃんけん・・・"
  while fight_flag == 1 do

    puts "0:グー, 1:チョキ, 2:パー, それ以外:戦わない"
    player = gets.chomp.to_i
    if player != 0 and player !=1 and player != 2  then
      puts "戦わないことも一つの戦略"
      puts "--------------------------"
      exit
    end
    computer = rand(3)
    puts "あなたは#{janken_array[player]}を出しました"
    puts "相手は#{janken_array[computer]}を出しました"
    
    #じゃんけん判定は出した手の差を3で割った余りで行う
    result = (computer - player) % 3

    case result
      when 0
        puts "あいこで・・・"
      when 1
        puts "You win"
        fight_flag = 2
      when 2
        puts "Your lose"
        fight_flag = 3
    end
  end  

  puts "あっちむいて・・・"
  puts "0:上, 1:下, 2:左, 3:右"
  player_direction = gets.chomp.to_i
  computer_direction = rand(4)
  
  case player_direction
    when 0, 1, 2, 3
    else
      puts "試合放棄しました"
      exit
  end
  puts "あなたは#{direction_array[player_direction]}を出しました"
  puts "相手は#{direction_array[computer_direction]}を出しました"

  if player_direction == computer_direction then
    if fight_flag == 2 then
      puts "You win!"
      fight_flag = 4
    elsif fight_flag == 3 then
      puts "You lose"
      fight_flag = 4
    else
      puts "何かおかしなことが起きている"
    end
  else
    fight_flag = 1
  end
  
  if fight_flag == 4 then
    puts "まだやりますか？Y or N"
    final_answer = gets.chomp
    if final_answer == "Y" then
      fight_flag = 1
    else
      puts "おしまい"
    end
  end
end