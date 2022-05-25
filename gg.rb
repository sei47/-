# require_relative '../Ruby-g/gg.rb'

# # 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new
#
# # 作成した自動販売機に100円を入れる
# vm.slot_money (100)
#
# # 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money
#
# # 作成した自動販売機に入れたお金を返してもらう
# vm.return_money
require_relative "buy.rb"

class VendingMachine < Buy

  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    super
    @drink_stock = [{price: 120,stock: 5,name: "コーラ"},{price: 200,stock: 5,name: "レッドブル"},{price: 100,stock: 5,name: "水"},]
  end
# 在庫補充
  def refill
    @drink_stock.each_with_index do |drink,index|
      puts "#{index}:#{drink[:name]}"
    end
    puts "補充する番号を選んで下さい"
    number_check
    @drink_stock[@number][:stock] = 5 if @flag
    puts @drink_stock[@number]
  end
  # "番号確認"
  def number_check
    @number = gets.to_i
    if (0..2) === @number
        @flag = true
    else
      puts "正しい番号を入力してください"
      number_check
    end
  end

  def slot_money(money)
    return false unless MONEY.include?(money)
    @slot_money += money
  end

# "購入できるかできないか"
  def amount
    while true
      puts "お金を入れてください"
      money = gets.to_i
      @slot = slot_money(money)
      break if money_check == true
    end
    puts "購入する番号を入れてください"
    puts "コーラ:0, レッドブル:1, 水:2"
    number_check
    buy_another if @flag
  end
# "在庫"
  def current_drink
    @drink_stock.each do |drink|
      puts "#{drink[:name]}は#{drink[:stock]}本あります。値段は#{drink[:price]}円です。"
    end
  end
end
