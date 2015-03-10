(function() {
  var CommentBox, a, article, div, h1, img, li, p, ref, section, ul;

  ref = React.DOM, section = ref.section, article = ref.article, img = ref.img, a = ref.a, p = ref.p, ul = ref.ul, li = ref.li, div = ref.div, h1 = ref.h1;

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
        src: "http://lorempixum.com/50/50/people/1",
        width: "50"
      })), div({
        className: "comment-body"
      }, div({
        className: "text"
      }, p(null, "Hello this is an example comment")), p({
        className: "attribution"
      }, "by ", a({
        href: "#non"
      }, "Joe Bloggs"), " at 14:11pm, 12th Aug 2014"))))));
    }
  });

}).call(this);
