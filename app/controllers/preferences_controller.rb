class PreferencesController < ApplicationController
  before_filter :authenticate_user!

  def plus_one
  end

  def minus_one
  end
end
