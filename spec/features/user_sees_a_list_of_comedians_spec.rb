=begin
As a visitor,
When I visit `/comedians`
Then I see a list of comedians with the following
information for each comedian:
  * Name
  * Age
=end

RSpec.describe 'a visitor' do
  context 'visiting /comedians' do
    it 'should see a list of comedians with names and ages for each' do
      jerry = Comedian.create(name: 'Jerry', age: 62)
      larry = Comedian.create(name: 'Larry', age: 69)

      visit '/comedians'
     
      expect(page).to have_content('Jerry')
      expect(page).to have_content(62)
  
      expect(page).to have_content('Larry')
      expect(page).to have_content(69)
    
    end
  end
end