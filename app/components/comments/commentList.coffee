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


{form, section, article, img, a, p, ul, li, div, h1, input} = React.DOM
CommentList = React.createClass(
  getInitialState: ->
    comments: comments
  handleCommentSubmit: (comment) ->
    comments.push comment
    @setState {comments: comments}


  displayName: 'CommentList',
  render: ->
    div null,
      for comment, index in @state.comments 
        React.createElement(CommentBox, {comment: comment, index: index})
      React.createElement(CommentForm, onCommentSubmit: @handleCommentSubmit)
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
                p null, @props.comment.comment,
              p className: "attribution", "by ",
                a href: "#non", @props.comment.name
                " at " + @props.comment.date
)

CommentForm = React.createClass(
  displayName: 'CommentForm',
  handleSubmit: (e) ->
    e.preventDefault()
    name = React.findDOMNode(@refs.name).value.trim()
    comment = React.findDOMNode(@refs.comment).value.trim()
    currentDate = new Date
    date = currentDate.toLocaleTimeString('en-gb', hour: '2-digit', minute: '2-digit') +  ", " + currentDate.toLocaleDateString('en-gb', day: 'numeric', month: 'short', year: 'numeric')
#    date = React.findDOMNode(@refs.date).value.trim()
    @props.onCommentSubmit({name: name, comment: comment, date: date})
    React.findDOMNode(@refs.name).value = ""
    React.findDOMNode(@refs.comment).value = ""
    React.findDOMNode(@refs.comment).focus()
  ,
  render: ->
    div className: "row",
      div className: "col-sm-12",
        form className: "commentForm", onSubmit: @handleSubmit,
          input type: "text", ref: "comment", placeholder: "Comment:",
          input type: "text", ref: "name", placeholder: "Your Name:",
          input type: "submit", value: "Post"
)

React.render(
  React.createElement(CommentList, null),
  document.getElementById('content')
)
