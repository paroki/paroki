import SubmissionError from '@/utils/SubmissionError'
import ApiService from '@/services/ApiService'
import * as types from './mutation_types'

export const create = ({ commit }, values) => {
    commit(types.BAPTIS_CREATE_SET_ERROR, '')
    commit(types.BAPTIS_CREATE_TOGGLE_LOADING)

    const url = ApiService.generateUrl('baptis');
    return ApiService.post(url, values)
        .then((data) => {
            commit(types.BAPTIS_CREATE_TOGGLE_LOADING)
            commit(types.BAPTIS_CREATE_SET_CREATED, data)
        })
        .catch((e) => {
            commit(types.BAPTIS_CREATE_TOGGLE_LOADING)

            if (e instanceof SubmissionError) {
                commit(types.BAPTIS_CREATE_SET_VIOLATIONS, e.errors)
                // eslint-disable-next-line
                commit(types.BAPTIS_CREATE_SET_ERROR, e.errors._error)
                return
            }

            commit(types.BAPTIS_CREATE_SET_ERROR, e.message)
        })
}

export const reset = ({ commit }) => {
    commit(types.BAPTIS_CREATE_RESET)
}
