Contacts = {}

Contacts.model = function() {

  this.name = m.prop('[Your Name]');
  this.email = m.prop('[Your email]');
};

Contacts.controller = function() {
  var ctrl = this;
  ctrl.contacts = m.prop([new Contacts.model()])

  ctrl.add = function() {
    var newModel = new Contacts.model()
    ctrl.contacts().push(newModel)
  }

  ctrl.remove = function(idx) {
    ctrl.contacts().splice(idx, 1)
  }
}

Contacts.view = function(ctrl) {
  return m('.contacts', [
    m('h3', 'Please enter your contact information:'),
    ctrl.contacts().map(function(contact, idx) {
      return m('fieldset', [
        m('legend', "Attendee #" + (idx + 1)),
        m('label', "Name:"),
        m('input[type=text]', {
          value: contact.name(),
          onchange: m.withAttr('value', contact.name)
        }),
        m('br'),
        m('label', "Email:"),
        m('input[type=text]', {
          value: contact.email(),
          onchange: m.withAttr('value', contact.email)
        }),
        removerAnchor(ctrl, idx)
      ])
    }),
    m('a', {
      onclick: ctrl.add,
      href: '#'
    }, 'Add another attendee')


  ])
}

Function.prototype.papp = function() {
  var slice = Array.prototype.slice
  var fn = this
  var args = slice.call(arguments)
  return function() {
    return fn.apply(this, args.concat(slice.call(arguments)))
  }
}

function removerAnchor(ctrl, idx) {
  if (ctrl.contacts().length >= 2) {
    return m('a', {
      onclick: ctrl.remove.papp(idx),
      href: '#'
    }, 'remove')
  };
}
