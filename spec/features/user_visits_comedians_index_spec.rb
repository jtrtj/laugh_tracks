=begin
As a visitor,
When I visit `/comedians`
Then I see a list of comedians with the following
information for each comedian:
  * Name
  * Age

As a visitor,
When I visit `/comedians`
Then I also see a list of each comedian's specials.

As a visitor,
When I visit `/comedians`
Then I also see the average age for all comedians.

As a visitor,
when I visit `/comedians?age=34`
Then I see a list of all comedians with an age of 34.

As a visitor,
When I visit `/comedians`
Then I also see the count of specials for each comedian.
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

    it "should show comedian's comedy specials in their list" do
      jerry = Comedian.create(name: 'Jerry', age: 62)
      larry = Comedian.create(name: 'Larry', age: 69)

      hbo_special = jerry.specials.create(name: 'Jerry Seinfeld HBO Special')
      cc_special = jerry.specials.create(name: 'Comedy Central Special')

      visit '/comedians'

      within ("#id_#{jerry.id}") do
        expect(page).to have_content('Jerry Seinfeld HBO Special')
        expect(page).to have_content('Comedy Central Special')
      end
    end

    it 'should see average age of comedians' do
      jerry = Comedian.create(name: 'Jerry', age: 62)
      larry = Comedian.create(name: 'Larry', age: 69)

      visit '/comedians'

      expect(page).to have_content('Average Age: 65.5')
    end
  end
end