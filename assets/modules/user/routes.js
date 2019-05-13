import UserList from './views/List'
import UserCreate from './views/Create'
import UserUpdate from './views/Update'
import UserShow from './views/Show'

export default [
  { name: 'UserList', path: '/user/', component: UserList, meta: {label: 'Daftar User'} },
  { name: 'UserCreate', path: '/user/create', component: UserCreate },
  { name: 'UserUpdate', path: '/user/:id', component: UserUpdate, meta: {label: 'Edit User'} },
  { name: 'UserShow', path: '/user/show/:id', component: UserShow, meta: {label: 'User Detail'} }
]
