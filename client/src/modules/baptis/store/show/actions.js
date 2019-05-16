import ApiService from '@/services/ApiService';
import * as types from './mutation_types'

export const retrieve = ({ commit }, id) => {
  commit(types.BAPTIS_SHOW_TOGGLE_LOADING)

  return ApiService.get(id)
    .then((data) => {
      commit(types.BAPTIS_SHOW_TOGGLE_LOADING)
      commit(types.BAPTIS_SHOW_SET_RETRIEVED, data)
    })
    .catch((e) => {
      commit(types.BAPTIS_SHOW_TOGGLE_LOADING)
      commit(types.BAPTIS_SHOW_SET_ERROR, e.message)
    })
}

export const reset = ({ commit }) => {
  commit(types.BAPTIS_SHOW_RESET)
}
