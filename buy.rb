
class Buy

  def initialize
    @slot_money = 0
    @sale_proceeds_price = 0
  end

  def current_slot_money
    @slot_money
  end
# "売上金額"
  def sale_proceeds
     @sale_proceeds_price
  end
# リスト
  def list
    puts "購入可能リスト"
    @drink_stock.each_with_index do |drink,index|
      if current_slot_money >= drink[:price] && drink[:stock] > 0
        puts "#{index}:#{drink[:name]}"
      end
    end
  end

# 金額確認
  def money_check
    if @slot
      list
      puts "現在#{@slot_money}円入っています"
      puts "まだ投入しますか？ Yes:0  No:1"
      count = gets.to_i
      while true
        if count == 1
          return true
        elsif count == 0
          return false
        else
          puts "正しい番号を入力してください"
          puts "まだ投入しますか？ Yes:0  No:1"
          count = gets.to_i
        end
      end
    else
      puts "10円玉、50円玉、100円玉、500円玉、1000円札を入れてください"
    end
  end

# 購入処理
  def purchase
    @drink_stock[@number][:stock] -= 1
    @sale_proceeds_price  += @drink_stock[@number][:price]
    @slot_money -= @drink_stock[@number][:price]
  end

# 継続判断
  def buy_another
    if current_slot_money >= @drink_stock[@number][:price] && @drink_stock[@number][:stock] > 0
      purchase
    else
      puts "買えません"
    end
    while true
      puts "1:まだ買います 2:もう買いません"
      count = gets.to_i
      if count == 1
        return amount
      elsif count == 2
        change
        break
      else
        puts "正しい番号を入力してください"
      end
    end
  end

# 釣銭
  def change
    puts "お釣りの#{@slot_money}円です"
    return_money
  end

  def return_money
    puts @slot_money
    @slot_money = 0
  end
end
