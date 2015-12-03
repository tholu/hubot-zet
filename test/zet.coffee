Helper = require('hubot-test-helper')
expect = require('chai').expect

# helper loads a specific script if it's a file
helper = new Helper('./../src/zet.coffee')

describe 'zet', ->
  room = null

  beforeEach ->
    # Set up the room before running the test
    room = helper.createRoom()

  afterEach ->
    # Tear it down after the test to free up the listener.
    room.destroy()

  context 'user says zet to hubot', ->
    beforeEach ->
      room.user.say 'alice', 'hubot zet'

    it 'should reply with menu to user', ->
      expect(room.messages).to.eql [
        ['alice', 'hubot zet']
        ['hubot', 'https://c1.staticflickr.com/9/8754/16283894793_4a1889f612_b.jpg']
      ]