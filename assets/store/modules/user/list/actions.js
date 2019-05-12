import fetch from '../../../../utils/fetch'
import * as types from './mutation_types'
import toggleLoading from '../../../../utils/toggleLoading';

const getItems = ({ commit, state }, page=null) => {
    toggleLoading(commit);

    if(null === page && state.page !== null){
        //page = state.page;
    }
    page = null === page ? 1:page;
    let url = `/api/user?page=${page}`

    commit(types.SET_PAGE, page);
    return fetch(url)
        .then(response => response.json())
        .then((data) => {
            toggleLoading(commit);
            commit(types.SET_ITEMS, data['hydra:member'])
            commit(types.SET_VIEW, data['hydra:view'])
            commit(types.SET_TOTAL, data['hydra:totalItems'])
        })
        .catch((e) => {
            toggleLoading(commit);
            commit(types.SET_ERROR, e.message)
        })
}

export default getItems
