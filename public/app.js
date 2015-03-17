(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var CommentList;

CommentList = require('./components/comments/commentList.coffee');

React.render(React.createElement(CommentList, null), document.getElementById('content'));



},{"./components/comments/commentList.coffee":4}],2:[function(require,module,exports){
var CommentBox, a, article, div, img, p, ref, section;

ref = React.DOM, div = ref.div, section = ref.section, article = ref.article, a = ref.a, img = ref.img, div = ref.div, p = ref.p;

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
      src: "http://lorempixum.com/50/50/people/2",
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

module.exports = CommentBox;



},{}],3:[function(require,module,exports){
var CommentForm, div, form, input, ref;

ref = React.DOM, div = ref.div, form = ref.form, input = ref.input;

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

module.exports = CommentForm;



},{}],4:[function(require,module,exports){
var Comment, CommentBox, CommentForm, CommentList, c, comments, div;

CommentBox = require('./commentBox.coffee');

CommentForm = require('./commentForm.coffee');

Comment = require('../../models/comments/comment.coffee');

div = React.DOM.div;

c = new Comment();

comments = c.comments;

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
      var i, len, ref, results;
      ref = this.state.comments;
      results = [];
      for (index = i = 0, len = ref.length; i < len; index = ++i) {
        comment = ref[index];
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

module.exports = CommentList;



},{"../../models/comments/comment.coffee":5,"./commentBox.coffee":2,"./commentForm.coffee":3}],5:[function(require,module,exports){
var Comment;

Comment = (function() {
  function Comment() {
    this.comments = [
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
  }

  Comment.prototype.toString = function() {
    return this.comments[0].comment;
  };

  Comment.prototype.toJSON = function() {
    return {
      name: this.name
    };
  };

  return Comment;

})();

module.exports = Comment;



},{}]},{},[1]);
