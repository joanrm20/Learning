'use strict'
var React = require('react');
import Greet from './greet';

class Main extends React.Component {
  render() {
    return (
      <h1>
        Important content for SEO here....
      </h1>
    );
  }
}

let documentReady = () => {
  React.render(
    <Main />,
    document.getElementById('react')
  );
};

$(documentReady);
