=begin
As a visitor,
When I visit `/comedians`
Then I also see a list of each comedian's specials.
=end

RSpec.describe 'a visitor' do
  context 'visits /comedians' do
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