import UserList from '../components/user/List'
import UserCreate from '../components/user/Create'
import UserUpdate from '../components/user/Update'
import UserShow from '../components/user/Show'

export default [
  { name: 'UserList', path: '/user/', component: UserList },
  { name: 'UserCreate', path: '/user/create', component: UserCreate },
  { name: 'UserUpdate', path: '/user/edit/:id', component: UserUpdate },
  { name: 'UserShow', path: '/user/show/:id', component: UserShow }
]
