
express = require 'express'

app = module.exports = new express.Router()

app.get '/', (req, res) ->
    res.send "Hello world"

