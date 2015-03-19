(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var CommentList, registerControllers;

CommentList = require('./components/comments/commentList.coffee');

registerControllers = require('./controllers/controllerRegistry.coffee');

registerControllers();

React.render(React.createElement(CommentList, null), document.getElementById('content'));



},{"./components/comments/commentList.coffee":4,"./controllers/controllerRegistry.coffee":6}],2:[function(require,module,exports){
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
    }, this.props.comment.fancyName), " at " + this.props.comment.date))))));
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
var ActionController, Comment, CommentBox, CommentForm, CommentList, div;

CommentBox = require('./commentBox.coffee');

CommentForm = require('./commentForm.coffee');

Comment = require('../../models/comments/comment.coffee');

ActionController = require('../../models/actionController.coffee');

div = React.DOM.div;

CommentList = React.createClass({
  componentDidMount: function() {
    return Comment.listen('changed', (function(_this) {
      return function() {
        return _this.forceUpdate();
      };
    })(this));
  },
  handleCommentSubmit: function(comment) {
    return ActionController.broadcast('commentSubmitted', {
      comment: comment
    });
  },
  displayName: 'CommentList',
  render: function() {
    var comment;
    return div(null, (function() {
      var i, len, ref, results;
      ref = Comment.all();
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        comment = ref[i];
        results.push(React.createElement(CommentBox, {
          comment: comment
        }));
      }
      return results;
    })(), React.createElement(CommentForm, {
      onCommentSubmit: this.handleCommentSubmit
    }));
  }
});

module.exports = CommentList;



},{"../../models/actionController.coffee":7,"../../models/comments/comment.coffee":9,"./commentBox.coffee":2,"./commentForm.coffee":3}],5:[function(require,module,exports){
var ActionController, Comment, commentsControllerActions;

ActionController = require('../models/actionController.coffee');

Comment = require('../models/comments/comment.coffee');

commentsControllerActions = {
  commentSubmitted: function(data) {
    if (!data || !data.comment) {
      throw new Error("No comment passed");
    }
    return Comment.create(data.comment);
  }
};

module.exports = commentsControllerActions;



},{"../models/actionController.coffee":7,"../models/comments/comment.coffee":9}],6:[function(require,module,exports){
var ActionController, commentsControllerActions, controllerRegistry;

ActionController = require('../models/actionController.coffee');

commentsControllerActions = require('./commentsController.coffee');

controllerRegistry = function() {
  return ActionController.registerListenersOn(commentsControllerActions);
};

module.exports = controllerRegistry;



},{"../models/actionController.coffee":7,"./commentsController.coffee":5}],7:[function(require,module,exports){
var ActionController, Base, PublishSubscribe,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Base = require('./baseClass.coffee');

PublishSubscribe = require('./modules/pubSub.coffee');

ActionController = (function(superClass) {
  extend(ActionController, superClass);

  function ActionController() {
    return ActionController.__super__.constructor.apply(this, arguments);
  }

  ActionController.extend(PublishSubscribe);

  ActionController.registerListenersOn = function(actionObj) {
    var action, results;
    if (actionObj.constructor !== Object) {
      throw new Error('Arguments not an object');
    }
    results = [];
    for (action in actionObj) {
      results.push(ActionController.listen(action, actionObj[action]));
    }
    return results;
  };

  return ActionController;

})(Base);

module.exports = ActionController;



},{"./baseClass.coffee":8,"./modules/pubSub.coffee":10}],8:[function(require,module,exports){
var Base, PublishSubscribe,
  slice = [].slice;

PublishSubscribe = require('./modules/pubSub.coffee');

Base = (function() {
  function Base() {}

  Base.extend = function() {
    var _class, args;
    args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
    _class = this;
    return args.forEach(function(module) {
      var afterExtend, prop;
      if (module.constructor !== Object) {
        throw new Error('Arguments not an object or an array of objects');
      }
      for (prop in module) {
        if (prop !== 'moduleName') {
          _class[prop] = module[prop];
        }
      }
      afterExtend = _class.afterExtend;
      if (afterExtend) {
        return afterExtend(module);
      }
    });
  };

  Base.prototype.afterExtend = function(module) {
    if (!module.moduleName) {
      throw new Error('Module defined without a name');
    }
    if (!this.extendedModules) {
      this.extendedModules = [];
    }
    return this.extendedModules.push(module.moduleName);
  };

  Base.include = function() {
    var _class, args;
    args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
    _class = this;
    return args.forEach(function(module) {
      var afterInclude, prop;
      if (module.constructor !== Object) {
        throw new Error('Arguments not an object or an array of objects');
      }
      for (prop in module) {
        if (prop !== 'moduleName') {
          _class.prototype[prop] = module[prop];
        }
      }
      afterInclude = _class.afterInclude;
      if (afterInclude) {
        return afterInclude(module);
      }
    });
  };

  Base.prototype.afterInclude = function(module) {
    if (!module.moduleName) {
      throw new Error('Module defined without a name');
    }
    if (!this.includedModules) {
      this.includedModules = [];
    }
    return this.includedModules.push(module.moduleName);
  };

  Base.extend(PublishSubscribe);

  return Base;

})();

module.exports = Base;



},{"./modules/pubSub.coffee":10}],9:[function(require,module,exports){
var Base, Comment,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Base = require('../baseClass.coffee');

Comment = (function(superClass) {
  var data;

  extend(Comment, superClass);

  data = [
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

  Comment.comments = _.map(data, function(c) {
    return new Comment(c);
  });

  function Comment(obj) {
    this.name = obj.name;
    this.comment = obj.comment;
    this.date = obj.date;
    this.fancyName = "Mr Bigglesworth " + this.name + " IV";
  }

  Comment.prototype.toString = function() {
    return this.comments[0].comment;
  };

  Comment.prototype.toJSON = function() {
    return {
      name: this.name
    };
  };

  Comment.create = function(props) {
    var newObject;
    newObject = new Comment(props);
    this.comments.push(newObject);
    return this.broadcast('changed');
  };

  Comment.all = function() {
    return this.comments;
  };

  return Comment;

})(Base);

module.exports = Comment;



},{"../baseClass.coffee":8}],10:[function(require,module,exports){
var PubSub;

PubSub = {
  moduleName: "PubSub",
  broadcast: function(ev, data) {
    var _callbackList;
    _callbackList = this._callbacks[ev];
    if (!this.hasOwnProperty('_callbacks') || !_callbackList) {
      return this;
    }
    _callbackList.forEach((function(_this) {
      return function(fn) {
        return fn.call(_this, data);
      };
    })(this));
    return this;
  },
  listen: function(ev, fn) {
    if (!this.hasOwnProperty('_callbacks')) {
      this._callbacks = {};
    }
    (this._callbacks[ev] || (this._callbacks[ev] = [])).push(fn);
    return this;
  }
};

module.exports = PubSub;



},{}]},{},[1]);
