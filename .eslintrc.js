module.exports = {
  parserOptions: {
    parser: 'babel-eslint',
    ecmaVersion: 2017,
    sourceType: 'module'
  },
  extends: [
    'eslint:recommended',
    'plugin:vue/recommended'
  ],
  rules: {
    'brace-style': 'error',
    'indent': ['error', 2],
    'key-spacing': ['error', { 'beforeColon': false, 'afterColon': true }],
    'keyword-spacing': ['error', { 'before': true, 'after': true }],
    'no-extra-parens': ['error', 'all'],
    'no-multi-spaces': 'error',
    'no-trailing-spaces': 'error',
    'no-unused-vars': ['error', { 'argsIgnorePattern': '^_' }],
    'no-whitespace-before-property': 'error',
    'object-curly-spacing': ['error', 'always'],
    'space-before-blocks': ['error', 'always'],
    'space-before-function-paren': ['error', 'never'],
    'space-in-parens': ['error', 'never'],
    'space-infix-ops': 'error',
    'space-unary-ops': ['error', {'words': true, 'nonwords': false}],
    'spaced-comment': ['error', 'always'],
    'object-property-newline': 'error',
  }
}
