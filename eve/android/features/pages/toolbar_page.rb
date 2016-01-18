require 'calabash-android/abase'

class ToolbarPage < Calabash::ABase
  def trait
    "*"
    #"* id:'profile_tool_bar'"
  end

  def logout
    menu_button = "android.support.v7.widget.ActionMenuPresenter$OverflowMenuButton"
    wait_for(:timeout => 10, :regry_frequency => 2) do
      element_exists menu_button
    end
    sleep 1
    touch menu_button
    sleep 0.5
    touch "* text:'Log out'"
  end
end