require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      title: "MyString",
      location: "MyString",
      company: "MyString"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input[name=?]", "article[title]"

      assert_select "input[name=?]", "article[location]"

      assert_select "input[name=?]", "article[company]"
    end
  end
end
