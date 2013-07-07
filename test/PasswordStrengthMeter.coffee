should = require 'should'
PasswordStrengthMeter = require("../src/PasswordStrengthMeter").PasswordStrengthMeter

describe 'PasswordStrengthMeter', ->
    p = null

    beforeEach ->
       p = new PasswordStrengthMeter "12345"

    afterEach ->

    it "should be a PasswordStrengthMeter object", ->
       p.should.be.a('object')

    it "has properties", ->
       p.should.have.property('score')

    it "can make store", ->
       p.score().should.equal("week")

       p = new PasswordStrengthMeter "123456"
       p.score().should.equal("week")

       p = new PasswordStrengthMeter "123456a"
       p.score().should.equal("normal")

       p = new PasswordStrengthMeter "1456aA"
       p.score().should.equal("normal")

       p = new PasswordStrengthMeter "123456aA!"
       p.score().should.equal("strong")
