class TestsController < ApplicationController

  def index
    @tests = Test.all

    render plain: @tests.inspect
  end
end
