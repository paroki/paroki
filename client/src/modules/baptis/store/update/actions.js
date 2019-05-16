import SubmissionError from '../../../../utils/SubmissionError';
import ApiService from '@/services/ApiService';
import * as types from './mutation_types'

export const reset = ({ commit }) => {
    commit(types.RESET)
}

export const retrieve = ({ commit }, id) => {
    commit(types.TOGGLE_LOADING)
    const url = ApiService.generateUrl('baptis/'+id)
    return ApiService.get(url)
        .then((data) => {
            commit(types.TOGGLE_LOADING)
            commit(types.SET_RETRIEVED, data)
        })
        .catch((e) => {
            commit(types.TOGGLE_LOADING)
            commit(types.SET_ERROR, e.message)
        })
}

export const update = ({ commit, state }) => {
    commit(types.SET_ERROR, '')
    commit(types.TOGGLE_LOADING)

    return ApiService.put(state.retrieved['@id'], state.retrieved)
        .then((data) => {
            commit(types.TOGGLE_LOADING)
            commit(types.SET_UPDATED, data)
        })
        .catch((e) => {
            commit(types.TOGGLE_LOADING)

            if (e instanceof SubmissionError) {
                commit(types.SET_VIOLATIONS, e.errors)
                // eslint-disable-next-line
                commit(types.SET_ERROR, e.errors._error)

                return
            }

            // eslint-disable-next-line
            commit(commit(types.SET_ERROR, e.errors._error))
        })
}

export const updateRetrieved = ({ commit }, updated) => {
    commit(types.UPDATE_RETRIEVED, updated)
}
