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
end