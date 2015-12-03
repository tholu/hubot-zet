# Description
#   A ZET Menu service for Hubots.
#
# Configuration:
#   None
#
# Commands:
#   hubot zet - fetches the menu and outputs the flickr image
#
# Author:
#   tholu
#


module.exports = (robot) ->

  robot.respond /zet\b/i, (msg) ->
      showZetMenu(msg, 1)

    showZetMenu = (msg, num) ->
      if true
         # menu of this week
         msg.send "https://c1.staticflickr.com/9/8754/16283894793_4a1889f612_b.jpg"
       else
         msg.send "D'oh! ZET Menu not found. Go to De Cesare or Bistro."

