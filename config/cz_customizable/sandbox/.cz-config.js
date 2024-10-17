module.exports = {

  // Messages
  messages: {
    type: "Change type ? ",
    subject: 'Change description (eg. Add password reset):',
    body: 'Motivation and implementation details. | for newline (opt):\n',
    confirmCommit: 'Commit the changes now ?',
  },

  // Hide these messages
  skipQuestions: ['footer'],

  // Separators
  typePrefix: '[',
  typeSuffix: ']',
  subjectSeparator: ' ',

  // Types
  types: [
    { value: 'feat',     name: 'feat:     Change behaviour (expected)' },
    { value: 'fix',      name: 'fix:      Change behaviour (unexpected)' },
    { value: 'tech',     name: 'tech:     Change behaviour (technical)' },
    { value: 'docs',     name: 'docs:     Change documentation' },
    { value: 'refactor', name: 'refactor: Preserve behaviour',
    },
  ],

  // Subject allowed length
  subjectLimit: 50,
};
