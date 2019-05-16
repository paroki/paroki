import BaptisList from './views/List'
import BaptisCreate from './views/Create'
import BaptisUpdate from './views/Update'

export default [
  { name: 'BaptisList', path: '/baptis/', component: BaptisList },
  { name: 'BaptisCreate', path: '/baptis/create', component: BaptisCreate },
  { name: 'BaptisUpdate', path: '/baptis/:id', component: BaptisUpdate }
]
