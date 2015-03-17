Base = require '../baseClass.coffee'
A = require '../modules/a.coffee'
B = require '../modules/b.coffee'

class Comment extends Base
  @include A, B 
  constructor: ->
    @comments = [
      comment: "This is a much longer one that will go on for a few lines.<br/>It has multiple paragraphs and is full of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end."
      name: "Joe Bloggs"
      date: "14:23pm, 4th Dec 2010"
    ,
      comment: "tHIS IS A MUCH LONGER ONE THAT WILL GO ON FOR A FEW LINES of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end."
      name: "Joe Bloggs"
      date: "14:23pm, 4th Dec 2010"
    ,
      comment: "This is a much longer one that will go on for a few lines.<BR/>iT HAS MULTIPLE PARAGRAPHS AND IS FULL OF WAFFLE TO PAD OUT THE COMMENT. uSUALLY, YOU JUST WISH THESE SORTS OF COMMENTS WOULD COME TO AN END."
      name: "Joe Bloggs"
      date: "14:23pm, 4th Dec 2010"
    ,
      comment: "This is a much longer one that will go on for a few linesaragraphs and is full of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end."
      name: "Joe Bloggs"
      date: "14:23pm, 4th Dec 2010"
    ,
      comment: "This is a much longer one that will go on for a few lines.<br/>It has multiple paragraphs anja is full of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end."
      name: "Joe Bloggs"
      date: "14:23pm, 4th Dec 2010"
    ,
      comment: "This is a much longer one that will go on for a one line."
      name: "Jane Doe"
      date: "14:43pm, 12th Dec 2014"
    ]

  toString: ->
    @comments[0].comment

  toJSON: ->
    { name: @name }




module.exports = Comment
