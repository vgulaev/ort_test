// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

class BandwidthList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      items: []
    };
  }

  componentDidMount() {
    fetch(`api/bandwidth?server=${this.props.server_id}`)
      .then(res => res.json())
      .then(
        (result) => {
          this.setState({
            isLoaded: true,
            items: result
          });
        },
        (error) => {
          this.setState({
            isLoaded: true,
            error
          });
        }
      )
  }

  render() {
    const { error, isLoaded, items } = this.state;
    if (error) {
      return <div>Ошибка: {error.message}</div>;
    } else if (!isLoaded) {
      return <div>Загрузка...</div>;
    } else if (0 == items.length) {
      return '';
    } else {
      return (
          <div className="divTable" style={{border: '1px solid #000'}} >
          <div className="divTableBody">
            <div className="divTableRow">
            <div className="divTableCell">NN</div>
            <div className="divTableCell">Bandwidths</div>
            <div className="divTableCell">Loads Mbs</div>
            </div>
            {items.map(item => (
            <div className="divTableRow" key={item.id} id={item.id}>
            <div className="divTableCell">{item.id}</div>
            <div className="divTableCell">
              {item.interface_name}
            </div>
            <div className="divTableCell">
              {item.value}
            </div>
            </div>
            ))}
          </div>
          </div>
      );
    }
  }
}

class ServerList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      items: []
    };
  }

  componentDidMount() {
    fetch("api/server")
      .then(res => res.json())
      .then(
        (result) => {
          this.setState({
            isLoaded: true,
            items: result
          });
        },
        (error) => {
          this.setState({
            isLoaded: true,
            error
          });
        }
      )
  }

  // bandwidthList(e) {
  //   e.preventDefault();
  //   console.log('По ссылке кликнули.');
  //   // this.d
  // }

  render() {
    const { error, isLoaded, items } = this.state;
    if (error) {
      return <div>Ошибка: {error.message}</div>;
    } else if (!isLoaded) {
      return <div>Загрузка...</div>;
    } else {
      return (
          <div className="divTable" style={{border: '1px solid #000'}} >
          <div className="divTableBody">
            <div className="divTableRow">
            <div className="divTableCell">NN</div>
            <div className="divTableCell">Server list</div>
            </div>
            {items.map(item => (
            <div className="divTableRow" key={item.id} id={item.id}>
            <div className="divTableCell">{item.id}</div>
            <div className="divTableCell">
              {item.name}
              <BandwidthList server_id={item.id} />
            </div>
            </div>
            ))}
          </div>
          </div>
      );
    }
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <ServerList name="any React" />,
    document.body.appendChild(document.createElement('div')),
  )
})
