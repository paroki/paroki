import fetch from '../../../../utils/fetch'
import * as types from './mutation_types'
import * as siap from '../../../siap/types';

const getItems = ({ commit }, page = '/api/user') => {
    commit(types.TOGGLE_LOADING)
    commit(`siap/${siap.SIAP_TOGGLE_LOADING}`,null, {root: true})

    fetch(page)
        .then(response => response.json())
        .then((data) => {
            commit(types.TOGGLE_LOADING)
            commit(`siap/${siap.SIAP_TOGGLE_LOADING}`,null, {root: true})
            commit(types.SET_ITEMS, data['hydra:member'])
            commit(types.SET_VIEW, data['hydra:view'])
            commit(types.SET_TOTAL, data['hydra:totalItems'])
        })
        .catch((e) => {
            commit(types.TOGGLE_LOADING)
            commit(`siap/${siap.SIAP_TOGGLE_LOADING}`,null, {root: true})
            commit(types.SET_ERROR, e.message)
        })
}

export default getItems
