 /** @jsx React.DOM */
 React.renderComponent( <h1> Hello, world! </h1>,
   document.getElementById('example1')
 );

 var MyComponent = React.createClass({
   render: function() {
     return ( <h1> Hello, {
       this.props.name
     }! </h1>);
   }
 });

 React.renderComponent( <MyComponent name = "Jose" /> , document.getElementById('example2'));
