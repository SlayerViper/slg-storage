local function callback(Text)
   if Text == "Yes" then
      print("true")
   elseif Text == "No" then
      print("false")
   end
end

local NotificationBindable == Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback

game.StarterGui:SetCore("SendNotification", {
      Title = test;
      Text = test2;
      Icon = "";
      Duration = 5;
      Button1 = "Yes";
      Button2 = "No";
      Callback = NotificationBindable;
})
