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

      expect(page).to have_content("Average age of comedians: #{Comedian.avg_age}")
    end

    it 'should see number of specials per comedian' do
      jerry = Comedian.create(name: 'Jerry', age: 62)
      larry = Comedian.create(name: 'Larry', age: 69)

      special_1 = jerry.specials.create(name: 'Jerry Seinfeld HBO Special')
      special_2 = jerry.specials.create(name: 'Comedy Central Special')
      special_3 = larry.specials.create(name: 'Really Funny Special')

      visit '/comedians'

      within ("#id_#{jerry.id}") do
        expect(page).to have_content("Special Count: #{jerry.specials_count}")
      end

      within ("#id_#{larry.id}") do
        expect(page).to have_content("Special Count: #{larry.specials_count}")
      end
    end
  end

  context 'visiting /comedians?age=34' do
    it 'should see a list of comedians aged 34' do
      jerry = Comedian.create(name: 'Jerry', age: 62)
      larry = Comedian.create(name: 'Larry', age: 69)
      john = Comedian.create(name: 'John', age: 34)
      
      visit '/comedians?age=34' 
      save_and_open_page

      expect(page).to have_content("#{john.name}")
      expect(page).to_not have_content("#{jerry.name}")
      expect(page).to_not have_content("#{larry.name}")
    end
  end
end