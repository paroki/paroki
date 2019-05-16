import SubmissionError from '@/utils/SubmissionError'
import ApiService from '@/services/ApiService'
import * as types from './mutation_types'

export const create = ({ commit }, values) => {
    commit(types.{{{uc}}}_CREATE_SET_ERROR, '')
    commit(types.{{{uc}}}_CREATE_TOGGLE_LOADING)

    const url = ApiService.generateUrl('{{{name}}}');
    return ApiService.post(url, values)
        .then((data) => {
            commit(types.{{{uc}}}_CREATE_TOGGLE_LOADING)
            commit(types.{{{uc}}}_CREATE_SET_CREATED, data)
        })
        .catch((e) => {
            commit(types.{{{uc}}}_CREATE_TOGGLE_LOADING)

            if (e instanceof SubmissionError) {
                commit(types.{{{uc}}}_CREATE_SET_VIOLATIONS, e.errors)
                // eslint-disable-next-line
                commit(types.{{{uc}}}_CREATE_SET_ERROR, e.errors._error)
                return
            }

            commit(types.{{{uc}}}_CREATE_SET_ERROR, e.message)
        })
}

export const reset = ({ commit }) => {
    commit(types.{{{uc}}}_CREATE_RESET)
}
