Helper = require('hubot-test-helper')
expect = require('chai').expect
nock = require('nock')

# helper loads a specific script if it's a file
helper = new Helper('./../src/zet.coffee')

describe 'zet', ->
  room = null

  beforeEach ->
    # Set up the room before running the test
    room = helper.createRoom()
    do nock.disableNetConnect
    nock('http://blog.techno-z.at')
      .get('/')
      .reply 200, '<div class="widget weekly-plan"> <img src="http://blog.techno-z.at/wp-content/themes/connect/images/zet.gif" alt="zet" class="zet"> <div data-live-edit-id="2924-post_title-datum-suppentopf-kostlich_bewahrt-a_la_carte-vegetarisch_aktiv-mahl_spezial" data-live-edit-fields="post_title,datum,suppentopf,kostlich_bewahrt,a_la_carte,vegetarisch_aktiv,mahl_spezial" data-live-edit-post_id="2924"> <h2><span class="date-stamp">03.12.</span>Speiseplan für heute</h2> <ul class="group"> <li><span class="title">Suppentopf</span><span class="data">Test</span></li> <li><span class="title">Menü 1</span><span class="data">Test2</span></li></ul> </div> <!-- /Widget -->'

  afterEach ->
    # Tear it down after the test to free up the listener.
    room.destroy()
    nock.cleanAll()

  context 'user says zet to hubot', ->
    beforeEach (done) ->
      room.user.say 'alice', 'hubot zet'
      setTimeout done, 200

    it 'should reply with menu to user', ->
      expect(room.messages).to.eql [
        ['alice', 'hubot zet']
        ['hubot', '03.12. - Test - Test2']
      ]