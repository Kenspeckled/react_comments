{div, section, article, a, img, div, p} = React.DOM

CommentBox = React.createClass(
  displayName: 'CommentBox',
  render: ->
    div className: "row",
      div className: "col-sm-12",
        section className: "comments",
          article className: "comment",
            a className: "comment-img", href: "#non",
              img alt: "", height: "50", src: "http://lorempixum.com/50/50/people/2", width: "50",
            div className: "comment-body",
              div className: "text",
                p null, @props.comment.comment,
              p className: "attribution", "by ",
                a href: "#non", @props.comment.fancyName
                " at " + @props.comment.date
)

module.exports = CommentBox
