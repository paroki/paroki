import ApiService from '@/services/ApiService'
import * as types from './mutation_types'

export const del = ({ commit }, item) => {
    commit(types.{{{uc}}}_DELETE_TOGGLE_LOADING)

    return ApiService.delete(item['@id'])
        .then(() => {
            commit(types.{{{uc}}}_DELETE_TOGGLE_LOADING)
            commit(types.{{{uc}}}_DELETE_SET_DELETED, item)
        })
        .catch((e) => {
            commit(types.{{{uc}}}_DELETE_TOGGLE_LOADING)
            commit(types.{{{uc}}}_DELETE_SET_ERROR, e.message)
        })
}

export const reset = ({ commit }) => {
    commit(types.{{{uc}}}_DELETE_RESET)
}
