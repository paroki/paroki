import ApiService from '@/services/ApiService'
import * as types from './mutation_types'

const getItems = ({ commit, state }, payload) => {
    payload = state.pager;

    const params = ApiService.generateListParams(payload);
    const url = ApiService.generateUrl('baptis', params);

    commit(types.TOGGLE_LOADING);
    commit(types.TOGGLE_LOADING)

    ApiService.get(url)
        .then((data) => {
            commit(types.TOGGLE_LOADING)
            commit(types.SET_ITEMS, data['hydra:member'])
            commit(types.SET_VIEW, data['hydra:view'])
        })
        .catch((e) => {
            commit(types.TOGGLE_LOADING)
            commit(types.SET_ERROR, e.message)
        })
}

export const setPager = ({commit}, payload) => {
    commit(types.SET_PAGER,payload);
}

export default getItems
