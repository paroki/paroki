import SubmissionError from '../../../../error/SubmissionError';
import fetch from '../../../../utils/fetch';
import * as types from './mutation_types';
import toggleLoading from '../../../../utils/toggleLoading';

export const reset = ({ commit }) => {
  commit(types.RESET)
}

export const retrieve = ({ commit }, id) => {
  toggleLoading(commit)

  return fetch(`/api/user/${id}`)
    .then(response => response.json())
    .then((data) => {
      toggleLoading(commit)
      commit(types.SET_RETRIEVED, data)
    })
    .catch((e) => {
      toggleLoading(commit)
      commit(types.SET_ERROR, e.message)
    })
}

export const update = ({ commit, state }) => {
  commit(types.SET_ERROR, '')
  toggleLoading(commit)

  return fetch(state.retrieved['@id'], {
    method: 'PUT',
    headers: new Headers({ 'Content-Type': 'application/ld+json' }),
    body: JSON.stringify(state.retrieved)
  })
    .then(response => response.json())
    .then((data) => {
      toggleLoading(commit)
      commit(types.SET_UPDATED, data)
    })
    .catch((e) => {
      toggleLoading(commit)

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
