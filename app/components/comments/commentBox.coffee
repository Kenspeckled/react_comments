{section, article, img, a, p, ul, li, div, h1} = React.DOM
CommentBox = React.createClass(
  displayName: 'CommentBox',
  render: ->
    div className: "row",
      div className: "col-sm-12",
        section className: "comments",
          article className: "comment",
            a className: "comment-img", href: "#non",
              img alt: "", height: "50", src: "http://lorempixum.com/50/50/people/1", width: "50",
            div className: "comment-body",
              div className: "text",
                p null, "Hello this is an example comment",
              p className: "attribution", "by ",
                a href: "#non", "Joe Bloggs" 
                " at 14:11pm, 12th Aug 2014"

)
#React.render(
#  React.createElement(CommentBox, null),
#  document.getElementById('content')
#)
