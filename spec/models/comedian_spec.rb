RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end
    end
  end

  describe 'class methods' do
    it '#avg_age' do
      Comedian.create(name: 'Jerry', age: 62)
      Comedian.create(name: 'Larry', age: 69)

      expect(Comedian.avg_age).to eq(65.5)
    end
  end

  describe 'instance methods' do
    it '#specials_count' do
      jerry = Comedian.create(name: 'Jerry', age: 62)
      larry = Comedian.create(name: 'Larry', age: 69)

      special_1 = jerry.specials.create(name: 'Jerry Seinfeld HBO Special')
      special_2 = jerry.specials.create(name: 'Comedy Central Special')
      special_3 = larry.specials.create(name: 'Really Funny Special')

      expect(jerry.specials_count).to eq(2)
      expect(larry.specials_count).to eq(1)
    end
  end
end