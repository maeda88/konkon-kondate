class MenuesController < ApplicationController
   # １週間のカレンダーと予定が表示されるページ
   def index
    get_week
    @menu = Menu.new
  end

  # 予定の保存
  def create
    Menu.create(menu_params)
    redirect_to action: :index
  end

  private

  def menu_params
    params.require(:menu).permit(:date, :dish1, :dish2, :dish3)
  end

  def get_week
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    # Dateオブジェクトは、日付を保持しています。下記のように`.today.day`とすると、今日の日付を取得できます。
    @todays_date = Date.today
    # 例)　今日が2月1日の場合・・・ Date.today.day => 1日

    @week_days = []

    menues = Menu.where(date: @todays_date..@todays_date + 6)

    7.times do |x|
      today_menues = []
      menues.each do |menu|
        today_menues.push(menu.menu) if menu.date == @todays_date + x
      end

      wday_num = Date.today.wday
      if wday_num >= 7
        wday_num = wday_num -7
      end

      days = { month: (@todays_date + x).month, date: (@todays_date+x).day, menues: today_menues, wdays: wdays[wday_num]}

      @week_days.push(days)
    end

  end
end
