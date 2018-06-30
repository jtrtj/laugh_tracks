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

      hbo_special = Special.create(name: 'Jerry Seinfeld HBO Special', comedian_id: jerry.id)
      cc_special = Special.create(name: 'Larry David Comedy Central Special', comedian_id: larry.id)

      visit '/comedians'
      save_and_open_page

      page.should have_css("id_#{jerry.id}", :text => 'Jerry Seinfeld HBO Special')
      page.should have_css("id_#{larry.id}", :text => 'Larry David Comedy Central Special')

    end
  end
end