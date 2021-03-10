require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "ユーザー管理機能" do
    before do
      @user = FactoryBot.build(:user)
    end

    describe "新規登録" do
      it "情報が正しければ登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailがすでに登録されていたら登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@を含まなければ登録できない" do
        @user.email = "test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが６文字より少なければ登録できない" do
        @user.password = "12abc"
        @user.password_confirmation = "12abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは英字だけでは登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordは数字だけでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordとpassword_confirmationの両方が存在しなければ登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordとpassword_confirmationが異なれば登録できない" do
        @user.password = "123abc"
        @user.password_confirmation = "123abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_name_kanjiが空では登録できない" do
        @user.last_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      it "first_name_kanjiが空では登録できない" do
        @user.first_name_kanji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it "last_name_kanjiが漢字でなければ登録できない" do
        @user.last_name_kanji = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji には、全角漢字を使用してください")
      end
      it "first_name_kanjiが漢字でなければ登録できない" do
        @user.first_name_kanji = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji には、全角漢字を使用してください")
      end
      it "last_name_katakanaが空では登録できない" do
        @user.last_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it "first_name_katakanaが空では登録できない" do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it "last_name_katakanaがカタカナでなければ登録できない" do
        @user.last_name_katakana = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana には、全角カタカナを使用してください")
      end
      it "first_name_katakanaがカタカナでなければ登録できない" do
        @user.first_name_katakana = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana には、全角カタカナを使用してください")
      end
      it "dateが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      
    end

  end

end
