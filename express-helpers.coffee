express = require 'express'
logger = require 'morgan'


# Add logging tokens.
padString = (str, minlength) ->
    while str.length < minlength
        str = str.concat ' '
    return str

pad = (n) ->
    (if n < 10 then "0" else "") + n.toString(10)

months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

timestamp = ->
    d = new Date
    "#{pad d.getDate()} #{months[d.getMonth()]} #{pad d.getHours()}:#{pad d.getMinutes()}:#{pad d.getSeconds()}"

logger.token 'remote-addr-padded', (req, res, field) ->
    addr = req.ip || 'unknown-ip'
    padString(addr, 15)

logger.token 'proto-padded', (req, res, field) ->
    padString req.protocol.toUpperCase(), 5

logger.token 'method-padded', (req, res, field) ->
    padString req.method, 4

logger.token 'date-padded', (req, res, field) ->
    timestamp()
