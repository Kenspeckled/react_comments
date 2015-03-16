(function() {
  var CommentBox, CommentForm, CommentList, a, article, comments, div, form, h1, img, input, li, p, ref, section, ul;

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

  ref = React.DOM, form = ref.form, section = ref.section, article = ref.article, img = ref.img, a = ref.a, p = ref.p, ul = ref.ul, li = ref.li, div = ref.div, h1 = ref.h1, input = ref.input;

  CommentList = React.createClass({
    getInitialState: function() {
      return {
        comments: comments
      };
    },
    handleCommentSubmit: function(comment) {
      comments.push(comment);
      return this.setState({
        comments: comments
      });
    },
    displayName: 'CommentList',
    render: function() {
      var comment, index;
      return div(null, (function() {
        var i, len, ref1, results;
        ref1 = this.state.comments;
        results = [];
        for (index = i = 0, len = ref1.length; i < len; index = ++i) {
          comment = ref1[index];
          results.push(React.createElement(CommentBox, {
            comment: comment,
            index: index
          }));
        }
        return results;
      }).call(this), React.createElement(CommentForm, {
        onCommentSubmit: this.handleCommentSubmit
      }));
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
    handleSubmit: function(e) {
      var comment, currentDate, date, name;
      e.preventDefault();
      name = React.findDOMNode(this.refs.name).value.trim();
      comment = React.findDOMNode(this.refs.comment).value.trim();
      currentDate = new Date;
      date = currentDate.toLocaleTimeString('en-gb', {
        hour: '2-digit',
        minute: '2-digit'
      }) + ", " + currentDate.toLocaleDateString('en-gb', {
        day: 'numeric',
        month: 'short',
        year: 'numeric'
      });
      this.props.onCommentSubmit({
        name: name,
        comment: comment,
        date: date
      });
      React.findDOMNode(this.refs.name).value = "";
      React.findDOMNode(this.refs.comment).value = "";
      return React.findDOMNode(this.refs.comment).focus();
    },
    render: function() {
      return div({
        className: "row"
      }, div({
        className: "col-sm-12"
      }, form({
        className: "commentForm",
        onSubmit: this.handleSubmit
      }, input({
        type: "text",
        ref: "comment",
        placeholder: "Comment:"
      }, input({
        type: "text",
        ref: "name",
        placeholder: "Your Name:"
      }, input({
        type: "submit",
        value: "Post"
      }))))));
    }
  });

  React.render(React.createElement(CommentList, null), document.getElementById('content'));

}).call(this);
