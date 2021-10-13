class AboutController < ApplicationController
  def index
    @description = Faker::Hipster.paragraph(10)
  end
end
