require 'rails_helper'

RSpec.describe Dish, type: :model do
  before do
    @dish = FactoryBot.build(:dish)
  end
  describe '料理名登録' do
    context '料理名登録できるとき' do
      it '全ての項目が入力してあれば登録できる' do
        expect(@dish).to be_valid
      end
      it 'メモが空でも登録できる' do
        @dish.remark = ''
        expect(@dish).to be_valid
      end
    end
    context '料理名登録できないとき' do
      it 'userが紐付いていない場合は登録できない' do
        @dish.user = nil
        @dish.valid?
        expect(@dish.errors.full_messages).to include('User must exist')
      end
      it '料理名が空で登録できない' do
        @dish.dish = ''
        @dish.valid?
        expect(@dish.errors.full_messages).to include("Dish can't be blank")
      end
      it 'カテゴリーが空で登録できない' do
        @dish.category_id = 1
        @dish.valid?
        expect(@dish.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
