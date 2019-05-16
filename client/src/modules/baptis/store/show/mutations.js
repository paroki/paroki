import * as types from './mutation_types'

export default {
  [types.BAPTIS_SHOW_RESET] (state) {
    Object.assign(state, {
      error: '',
      isLoading: false,
      retrieved: null
    })
  },

  [types.BAPTIS_SHOW_SET_ERROR] (state, error) {
    Object.assign(state, { error })
  },

  [types.BAPTIS_SHOW_SET_RETRIEVED] (state, retrieved) {
    Object.assign(state, { retrieved })
  },

  [types.BAPTIS_SHOW_TOGGLE_LOADING] (state) {
    Object.assign(state, { isLoading: !state.isLoading })
  }

}
