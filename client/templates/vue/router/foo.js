import {{{titleUcFirst}}}List from './views/List'
import {{{titleUcFirst}}}Create from './views/Create'
import {{{titleUcFirst}}}Update from './views/Update'

export default [
  { name: '{{{titleUcFirst}}}List', path: '/{{{name}}}/', component: {{{titleUcFirst}}}List },
  { name: '{{{titleUcFirst}}}Create', path: '/{{{name}}}/create', component: {{{titleUcFirst}}}Create },
  { name: '{{{titleUcFirst}}}Update', path: '/{{{name}}}/:id', component: {{{titleUcFirst}}}Update }
]
