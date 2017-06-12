# Description
#   A ZET Menu service for Hubots.
#
# Configuration:
#   None
#
# Commands:
#   hubot zet - fetches the current ZET menu from the Techno-Z blog
#
# Author:
#   tholu
#

cheerio = require('cheerio')

module.exports = (robot) ->

  robot.respond /zet\b/i, (msg) ->
    url = 'https://blog.techno-z.at/'

    robot.http(url).get() (err, res, body) ->
      switch res.statusCode
        when 200
          # parse response
          $ = cheerio.load(body)
          menu = []
          $('div.weekly-plan div h2 span.date-stamp').each (i) ->
            menu.push $(this).text()
          $('div.weekly-plan div ul.group li span.data').each (i) ->
            menu.push $(this).text()
          msg.send menu.join(' - ')
        when 404
          msg.send "Page not found: "+url
        else
          msg.send "Unable to process your request and we're not sure why :("

