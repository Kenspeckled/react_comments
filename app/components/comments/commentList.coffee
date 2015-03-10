comments = [
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


{section, article, img, a, p, ul, li, div, h1, input} = React.DOM
CommentList = React.createClass(
  displayName: 'CommentList',
  render: ->
    div null,
      for comment, index in comments 
        React.createElement(CommentBox, {comment: comment, index: index})
    

)
CommentBox = React.createClass(
  displayName: 'CommentBox',
  render: ->
    div className: "row",
      div className: "col-sm-12",
        section className: "comments",
          article className: "comment",
            a className: "comment-img", href: "#non",
              img alt: "", height: "50", src: "http://lorempixum.com/50/50/people/" + @props.index, width: "50",
            div className: "comment-body",
              div className: "text",
                p null, @props.comment,
              p className: "attribution", "by ",
                a href: "#non", "Joe Bloggs" 
                " at 14:11pm, 12th Aug 2014"

)
React.render(
  React.createElement(CommentList, null),
  document.getElementById('content')
)
