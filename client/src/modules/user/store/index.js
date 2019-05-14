import list from './list'
import create from './create'
import update from './update'
import del from './delete'

export default {
  namespaced: true,
  modules: {
    list,
    create,
    update,
    del
  }
}
