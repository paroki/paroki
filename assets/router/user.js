import UserList from '../components/user/List'
import UserCreate from '../components/user/Create'
import UserUpdate from '../components/user/Update'
import UserShow from '../components/user/Show'

export default [
  { name: 'UserList', path: '/user/', component: UserList, meta: {label: 'Daftar User'} },
  { name: 'UserCreate', path: '/user/create', component: UserCreate },
  { name: 'UserUpdate', path: '/user/:id', component: UserUpdate, meta: {label: 'Edit User'} },
  { name: 'UserShow', path: '/user/show/:id', component: UserShow, meta: {label: 'User Detail'} }
]
