# Description:
#   Returns a seinfeld logo of your text.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot seinfeld me <input> - Return a seinfeld logo with your input.
#
# Notes:
#   Thanks to @holman for his fuck-yeah-nouns script that this is based on.
#   Also thanks to @charliesome for his seinfeld generator.
#
# Author:
#   antn

module.exports = (robot) ->
  robot.respond /seinfeld me (.+)/i, (msg) ->
    input = encodeURIComponent(msg.match[1])
    url = "https://charlie.bz/cgi-bin/seinfeld/#{input}.png"

    ping = msg.http(url).get (e, req) =>
      req.addListener "response", (res) =>
        if res.statusCode != 200
          robot.logger.error "Bad response: #{res.statusCode}"
        else
          msg.send url
    ping()
