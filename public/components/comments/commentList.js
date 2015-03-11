(function() {
  var CommentBox, CommentForm, CommentList, a, article, comments, div, h1, img, input, li, p, ref, section, ul;

  comments = [
    {
      comment: "This is a much longer one that will go on for a few lines.<br/>It has multiple paragraphs and is full of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end.",
      name: "Joe Bloggs",
      date: "14:23pm, 4th Dec 2010"
    }, {
      comment: "tHIS IS A MUCH LONGER ONE THAT WILL GO ON FOR A FEW LINES of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end.",
      name: "Joe Bloggs",
      date: "14:23pm, 4th Dec 2010"
    }, {
      comment: "This is a much longer one that will go on for a few lines.<BR/>iT HAS MULTIPLE PARAGRAPHS AND IS FULL OF WAFFLE TO PAD OUT THE COMMENT. uSUALLY, YOU JUST WISH THESE SORTS OF COMMENTS WOULD COME TO AN END.",
      name: "Joe Bloggs",
      date: "14:23pm, 4th Dec 2010"
    }, {
      comment: "This is a much longer one that will go on for a few linesaragraphs and is full of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end.",
      name: "Joe Bloggs",
      date: "14:23pm, 4th Dec 2010"
    }, {
      comment: "This is a much longer one that will go on for a few lines.<br/>It has multiple paragraphs anja is full of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end.",
      name: "Joe Bloggs",
      date: "14:23pm, 4th Dec 2010"
    }, {
      comment: "This is a much longer one that will go on for a one line.",
      name: "Jane Doe",
      date: "14:43pm, 12th Dec 2014"
    }
  ];

  ref = React.DOM, section = ref.section, article = ref.article, img = ref.img, a = ref.a, p = ref.p, ul = ref.ul, li = ref.li, div = ref.div, h1 = ref.h1, input = ref.input;

  CommentList = React.createClass({
    displayName: 'CommentList',
    render: function() {
      var comment, index;
      return div(null, (function() {
        var i, len, results;
        results = [];
        for (index = i = 0, len = comments.length; i < len; index = ++i) {
          comment = comments[index];
          results.push(React.createElement(CommentBox, {
            comment: comment,
            index: index
          }));
        }
        return results;
      })(), React.createElement(CommentForm, null));
    }
  });

  CommentBox = React.createClass({
    displayName: 'CommentBox',
    render: function() {
      return div({
        className: "row"
      }, div({
        className: "col-sm-12"
      }, section({
        className: "comments"
      }, article({
        className: "comment"
      }, a({
        className: "comment-img",
        href: "#non"
      }, img({
        alt: "",
        height: "50",
        src: "http://lorempixum.com/50/50/people/" + this.props.index,
        width: "50"
      })), div({
        className: "comment-body"
      }, div({
        className: "text"
      }, p(null, this.props.comment.comment)), p({
        className: "attribution"
      }, "by ", a({
        href: "#non"
      }, this.props.comment.name), " at " + this.props.comment.date))))));
    }
  });

  CommentForm = React.createClass({
    displayName: 'CommentForm',
    render: function() {
      return div({
        className: "row"
      }, div({
        className: "col-sm-12"
      }, div({
        className: "comment-input"
      }, input({
        type: "text",
        name: "comment"
      }, "Comment:"))));
    }
  });

  React.render(React.createElement(CommentList, null), document.getElementById('content'));

}).call(this);
