(function() {
  var CommentForm, a, article, div, h1, img, input, li, p, ref, section, ul;

  ref = React.DOM, section = ref.section, article = ref.article, img = ref.img, a = ref.a, p = ref.p, ul = ref.ul, li = ref.li, div = ref.div, h1 = ref.h1, input = ref.input;

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

  React.render(React.createElement(CommentForm, null), document.getElementById('content'));

}).call(this);
